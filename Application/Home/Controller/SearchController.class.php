<?php
namespace Home\Controller;
use Think\Controller;
class SearchController extends Controller {
    public function index(){
        $model  = new \Home\Model\MovieModel();
        $result = $model->searchMovie(I('post.word'));
        $allmovie = $model->select('movie');
        $this->assign('allmovie',$allmovie);
        $this->assign('searchurl',U('Search/index'));
        $this->assign('result',$result);
        $this->assign('movieurl',U('Movie/index'));
        $this->display();
    }
}