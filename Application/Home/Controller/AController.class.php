<?php
namespace Home\Controller;
use Think\Controller;
class AController extends Controller {
    public function index(){
        echo THINK_VERSION;
        $query = M();
        $sql = 'lock tables user write';
        $dbLink = $query->getDbLink();
        //$ab = $query->query($sql);
        var_dump($dbLink);
        //var_dump($query);
    }
}