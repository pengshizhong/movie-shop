<?php
namespace Home\Controller;
use Think\Controller;
class MovieController extends Controller {
    public function index(){
        $id     = I('get.movie_id');
        $model  = new \Home\Model\MovieModel();
        $result = $model->selectOne('movie','movie_id=' . $id);
        $join =[
            ' join movie on movie.movie_id=schedule.movie_id ',
            ' join hall on schedule.hall_id=hall.hall_id ',
           // ' join cinema.cinema_id on cinema_id=hall.cinema_id',
        ];
        $where = ' schedule.movie_id=' . $id . ' ';
        $dom = $model->select('schedule',$where,'',$join);
        foreach($dom as &$movie){
            $movie['cinema'] = $model->selectOne('cinema',' cinema_id=' . $movie['cinema_id']);
            $movie['cinema'] = $movie['cinema'][0];
        }
       // var_dump($dom);
        $allComments = $model->select('comment','movie_id=' . $id,'',' user on user.user_id=comment.user_id');
        $allMovie = $model->select('movie');
        $this->assign('movieurl',U('Movie/index'));
        $this->assign('dom',$dom);
        $this->assign('movie',$result[0]);
        $this->assign('allmovie',$allMovie);
        $this->assign('allComments',$allComments);
        $this->assign('searchurl',U('Search/index'));
      //  var_dump($allComments );
        //$this->assign('allmovie',$allMovie);
        $this->display();
    }
}