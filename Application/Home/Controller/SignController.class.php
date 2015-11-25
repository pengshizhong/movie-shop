<?php
namespace Home\Controller;
use Think\Controller;
class SignController extends Controller {
    public function index(){
        $this->assign('submitUrl',U('check'));
        $this->display();
    }

    private function setToken($data){
        $token = md5(date('Y-m-d-h-i-s') . $data['user_id']);
        //session('token',$token);
        cookie('token',$token);
        //cookie('username',$data['nickname']);
        //session('user_id',$data['user_id']);
        S($token,$data);
    }
    public function check(){

    //var_dump($_GET);
        $model  = new \Home\Model\MovieModel();
        $result = $model->selectOne('user'," email='" . I('get.email') . "' ");
        $result = $result[0];
        if($result){
            if($result['password']==I('get.password')){
                $this->setToken($result);
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
                'phone' => '-',
                'nickname' => md5(date('Y-m-d h-i-s')),
                'headurl' => 'headicon.jpg',
            ];
            $user = M('user');
            $user->add($data);
            $data['user_id'] = $user->getLastInsID();
            $this->setToken($data);
            $this->redirect('Home/Index/index', array('cate_id' => 2), 1, '<script>alert("register success")</script>');
        }
    }
}