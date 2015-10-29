<?php
namespace Home\Controller;
use Think\Controller;
class MovieController extends Controller {
    public function index(){
        $id     = I('get.movie_id');
        $model  = new \Home\Model\MovieModel();
        $result = $model->selectOne('movie','movie_id=' . $id);
        //var_dump($result);
        $allComments = $model->select('comment','movie_id=' . $id,'',' user on user.user_id=comment.user_id');
        $allMovie = $model->select('movie');
        $this->assign('movieurl',U('Movie/index'));
        $this->assign('movie',$result[0]);
        $this->assign('allmovie',$allMovie);
        $this->assign('allComments',$allComments);
        $this->assign('searchurl',U('Search/index'));
        //var_dump($allComments );
        //$this->assign('allmovie',$allMovie);
        $this->display();
    }
}