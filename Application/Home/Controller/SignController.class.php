<?php
namespace Home\Controller;
use Think\Controller;
class SignController extends Controller {
    public function index(){
        $this->assign('submitUrl',U('check'));
        $this->display();
    }

    private function setToken($username){
        $token = md5(date('Y-m-d-h-i-s'));
        session('token',$token);
        cookie('token',$token);
        cookie('username',$username);
    }
    public function check(){

    //var_dump($_GET);
        $model  = new \Home\Model\MovieModel();
        $result = $model->selectOne('user'," email='" . I('get.email') . "' ");
        $result = $result[0];
        if($result){
            if($result['password']==I('get.password')){
                $this->setToken($result['nickname']);
                $this->redirect('Home/Index/index', array('cate_id' => 2), 1, '<script>alert("success")</script>');
            }
            else{
                $this->redirect('Home/Sign/index', array('cate_id' => 2), 1, '<script>alert("password error")</script>');
            }
        }
        else{
            $data = [
                'email' => I('get.email'),
                'password' => I('get.password'),
                'phone' => '13538805451',
                'nickname' => 'dsa1212',
                'headurl' => 'image/33.jpg',
            ];
            $user = M('user');
            $user->add($data);
            $this->setToken($result['nickname']);
            $this->redirect('Home/Index/index', array('cate_id' => 2), 1, '<script>alert("register success")</script>');
        }
    }
}