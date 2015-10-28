<?php
namespace Cinema\Controller;
use Think\Controller;
class CinemaListController extends Controller {
    public function index(){
        $this->display(C('TPL_PATH') . 'Cinema/cinemaList.tpl');
    }

}