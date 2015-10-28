<?php
namespace Movie\Controller;
use Think\Controller;
class DiscussListController extends Controller {
    public function index(){
        $this->display(C('TPL_PATH') . '/Movie/discussList.tpl');
    }

}