<?php
namespace Home\Controller;
use Think\Controller;
class MovieListController extends Controller {
    public function index(){
        $model = new \Home\Model\MovieModel();
        $data  = $model->select('movie');
        $this->assign('allmovie',$data);
        $this->assign('movieurl',U('Movie/index'));
        //var_dump($data[1]);
        $this->assign('searchurl',U('Search/index'));
        $this->display();
    }
}