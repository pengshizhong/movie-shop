<?php
namespace Home\Controller;
use Think\Controller;
class TicketController extends Controller {
    public function index(){
        $id = I('get.schedule_id');
        $allcss =['ticket'];
        $model  = new \Home\Model\MovieModel();
        $seat = $model->select('account',' schedule_id=' . $id);
        //var_dump($seat);
        $this->assign('seat',$seat);
        $this->assign('movieurl',U('Movie/index'));
        $this->assign('searchurl',U('Search/index'));
        $this->assign('allcss',$allcss);
        $this->display();

    }
}