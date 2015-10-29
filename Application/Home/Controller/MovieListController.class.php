<?php
namespace Home\Controller;
use Think\Controller;
class MovieListController extends Controller {
    public function index(){
        $model = new \Home\Model\MovieModel();
        $data  = $model->select('movie');
        $this->assign('movie',$data);
        //var_dump($data[1]);
        $this->display();
    }
}