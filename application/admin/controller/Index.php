<?php

namespace app\admin\controller;

use app\admin\controller\user\Rule;
use app\admin\model\AdminLog;
use app\common\controller\Backend;
use think\Config;
use think\Hook;
use think\Validate;
use fast\Random;
use app\admin\model\Admin;
use think\Db;

/**
 * 后台首页
 * @internal
 */
class Index extends Backend
{

    protected $noNeedLogin = ['login','reg'];
    protected $noNeedRight = ['index', 'logout','reg'];
    protected $layout = '';

    public function _initialize()
    {
        parent::_initialize();
        //移除HTML标签
        $this->request->filter('trim,strip_tags,htmlspecialchars');
    }

    /**
     * 后台首页
     */
    public function index()
    {
        //左侧菜单
        list($menulist, $navlist, $fixedmenu, $referermenu) = $this->auth->getSidebar([
            'dashboard' => 'hot',
            'addon'     => ['new', 'red', 'badge'],
            'auth/rule' => __('Menu'),
            'general'   => ['new', 'purple'],
        ], $this->view->site['fixedpage']);
        $action = $this->request->request('action');
        if ($this->request->isPost()) {
            if ($action == 'refreshmenu') {
                $this->success('', null, ['menulist' => $menulist, 'navlist' => $navlist]);
            }
        }
        $this->view->assign('menulist', $menulist);
        $this->view->assign('navlist', $navlist);
        $this->view->assign('fixedmenu', $fixedmenu);
        $this->view->assign('referermenu', $referermenu);
        $this->view->assign('title', __('Home'));
        return $this->view->fetch();
    }

    public function reg()
    {
        $this->ip();
        if($this->request->isPost()){
            // $rule = new Rule();
            // $data = $rule->add();
            // halt($data);
            $admin = new Admin;
            $this->token();
            $params = $this->request->post("row/a");
            if ($params) {
                if (!Validate::is($params['password'], '\S{6,16}')) {
                    $this->error(__("Please input correct password"));
                }
                $params['salt'] = Random::alnum();
                $params['password'] = md5(md5($params['password']) . $params['salt']);
                $params['avatar'] = '/assets/img/avatar.png'; //设置新管理员默认头像。
                $result = $admin->validate('Admin.add')->save($params);
                if ($result === false) {
                    $this->error($admin->getError());
                }
                // $group = $this->request->post("group/a");
                $group[] = 4;
                //过滤不允许的组别,避免越权
                // $group = array_intersect($this->childrenGroupIds, $group);
                // if (!$group) {
                //     $this->error(__('The parent group exceeds permission limit'));
                // }

                $dataset = [];
                foreach ($group as $value) {
                    $dataset[] = ['uid' => $admin->id, 'group_id' => $value];
                }
                model('AuthGroupAccess')->saveAll($dataset);
                $this->add_ip();
                $this->success('注册成功！','/a.php');
            }
            $this->error();
        }
        $background = Config::get('fastadmin.login_background');
        $background = $background ? (stripos($background, 'http') === 0 ? $background : config('site.cdnurl') . $background) : '';
        $this->view->assign('background', $background);
        $this->view->assign('title', __('Login'));
        $this->view->assign('title', '注册账号');
        // Hook::listen("admin_login_init", $this->request);
        return $this->view->fetch();

        
    }
    /**
     * 限制ip注册个数
     *
     * @return void
     */
    public function ip()
    {
        // halt($this->request->ip());
        $num = Db::name('ip')->where('ip',$this->request->ip())->count();
        if($num>1){
            $this->error('一个Ip只能注册一个！');
        }
    }

    public function add_ip()
    {
        $data['ip'] = $this->request->ip();
        $data['time'] = time();
        Db::name('ip')->insert($data);
    }
    /**
     * 管理员登录
     */
    public function login()
    {
        $url = $this->request->get('url', 'index/index');
        if ($this->auth->isLogin()) {
            $this->success(__("You've logged in, do not login again"), $url);
        }
        if ($this->request->isPost()) {
            $username = $this->request->post('username');
            $password = $this->request->post('password');
            $keeplogin = $this->request->post('keeplogin');
            $token = $this->request->post('__token__');
            $rule = [
                'username'  => 'require|length:3,30',
                'password'  => 'require|length:3,30',
                '__token__' => 'require|token',
            ];
            $data = [
                'username'  => $username,
                'password'  => $password,
                '__token__' => $token,
            ];
            if (Config::get('fastadmin.login_captcha')) {
                $rule['captcha'] = 'require|captcha';
                $data['captcha'] = $this->request->post('captcha');
            }
            $validate = new Validate($rule, [], ['username' => __('Username'), 'password' => __('Password'), 'captcha' => __('Captcha')]);
            $result = $validate->check($data);
            if (!$result) {
                $this->error($validate->getError(), $url, ['token' => $this->request->token()]);
            }
            AdminLog::setTitle(__('Login'));
            $result = $this->auth->login($username, $password, $keeplogin ? 86400 : 0);
            if ($result === true) {
                Hook::listen("admin_login_after", $this->request);
                $this->success(__('Login successful'), $url, ['url' => $url, 'id' => $this->auth->id, 'username' => $username, 'avatar' => $this->auth->avatar]);
            } else {
                $msg = $this->auth->getError();
                $msg = $msg ? $msg : __('Username or password is incorrect');
                $this->error($msg, $url, ['token' => $this->request->token()]);
            }
        }

        // 根据客户端的cookie,判断是否可以自动登录
        if ($this->auth->autologin()) {
            $this->redirect($url);
        }
        $background = Config::get('fastadmin.login_background');
        $background = $background ? (stripos($background, 'http') === 0 ? $background : config('site.cdnurl') . $background) : '';
        $this->view->assign('background', $background);
        $this->view->assign('title', __('Login'));
        Hook::listen("admin_login_init", $this->request);
        return $this->view->fetch();
    }

    /**
     * 退出登录
     */
    public function logout()
    {
        $this->auth->logout();
        Hook::listen("admin_logout_after", $this->request);
        $this->success(__('Logout successful'), 'index/login');
    }

}
