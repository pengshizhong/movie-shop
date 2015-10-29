<?php
namespace Home\Controller;
use Think\Controller;
class CinemaListController extends Controller {
    public function index(){
        $model  = new \Home\Model\MovieModel;
        $result = $model->getContentByType('cinema',3,'cinema_id');
        //var_dump($result['list'][0]);
        $data  = $model->select('movie');
        $this->assign('allmovie',$data);
        $this->assign('movieurl',U('Movie/index'));
        $this->assign('result',$result);
        $this->assign('url',U('Cinema/index'));
        $this->assign('front',U('CinemaList/index?start=' . $result['pageFront']));
        $this->assign('next',U('CinemaList/index?start=' . $result['pageNextStart']));
        $this->assign('searchurl',U('Search/index'));
        $this->display();
    }
}