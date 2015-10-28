<?php
namespace Movie\Controller;
use Think\Controller;
class MovieListController extends Controller {
    public function index(){
        $this->display(C('TPL_PATH') . 'Movie/movieList.tpl');
        //$this->display(C('TPL_PATH') . '/Movie/discussList.tpl');
    }

}