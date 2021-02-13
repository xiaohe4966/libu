<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use think\Db;
/**
 * 礼簿记录
 *
 * @icon fa fa-circle-o
 */
class Libu extends Backend
{
    
    /**
     * Libu模型对象
     * @var \app\admin\model\Libu
     */
    protected $model = null;
    protected $dataLimit = true;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\Libu;
        $this->view->assign("stateList", $this->model->getStateList());
    }

    public function import()
    {
        parent::import();
    }

    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
    

    /**
     * 查看
     */
    public function index()
    {
        //当前是否为关联查询
        $this->relationSearch = true;
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();

            $list = $this->model
                    ->with(['type'])
                    ->where($where)
                    ->order($sort, $order)
                    ->paginate($limit);

            $money = 0;
            foreach ($list as $row) {
                $money = $money + $row->money;
                $row->visible(['id','admin_id','type_id','name','money','createtime','weigh','ps','state']);
                $row->visible(['type']);
				$row->getRelation('type')->visible(['type_name']);
            }

            $result = array("total" => $list->total(), "rows" => $list->items(),'money'=>$money);

            return json($result);
        }
        return $this->view->fetch();
    }



     /**
     * 添加
     */
    public function add()
    {
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            if ($params) {
                $params = $this->preExcludeFields($params);

                if ($this->dataLimit && $this->dataLimitFieldAutoFill) {
                    $params[$this->dataLimitField] = $this->auth->id;
                }
                $result = false;
                Db::startTrans();
                try {
                    //是否采用模型验证
                    if ($this->modelValidate) {
                        $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.add' : $name) : $this->modelValidate;
                        $this->model->validateFailException(true)->validate($validate);
                    }
                    $result = $this->model->allowField(true)->save($params);
                    Db::commit();
                } catch (ValidateException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (PDOException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (Exception $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                }
                if ($result !== false) {
                    $this->success();
                } else {
                    $this->error(__('No rows were inserted'));
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $type = Db::name('type')->where('admin_id',$this->auth->id)->where('status','1')->value('id');
        $this->view->assign("type",$type); 
        $weigh = $this->model->max('weigh')+1;
        $this->view->assign("weigh",$weigh); 
        return $this->view->fetch();
    }

}
