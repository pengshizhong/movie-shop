<?php
namespace Vip\Controller;
use Think\Controller;
class VipListController extends Controller {
    public function index(){
        $this->display(C('TPL_PATH') . 'Vip/vipList.tpl');
    }

}