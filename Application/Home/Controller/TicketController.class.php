<?php
namespace Home\Controller;
use Think\Controller;
class TicketController extends Controller {
    public function index(){
        $this->assign('searchurl',U('Search/index'));
        $this->display();
        $this->assign('movieurl',U('Movie/index'));
    }
}