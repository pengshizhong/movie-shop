<?php
namespace Home\Controller;
use Think\Controller;
class AController extends Controller {
    public function index(){
        $query = M();
        var_dump($query);
        $query->query('select * from user');
        var_dump($query);
    }
}