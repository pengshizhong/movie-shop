<?php
namespace Home\Controller;
use Think\Controller;
class CinemaController extends Controller {
    public function index(){
        $id     = I('get.cinema_id');
        $model  = new \Home\Model\MovieModel();
        $result = $model->selectOne('cinema','cinema_id=' . $id);
        //var_dump($result);
        $this->assign('searchurl',U('Search/index'));
        $allMovie = $model->select('movie','','0,9');
        $this->assign('cinema',$result[0]);
        $this->assign('allmovie',$allMovie);
        $this->assign('movieurl',U('Movie/index'));
        $this->display();
    }
}