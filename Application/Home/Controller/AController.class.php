<?php
namespace Home\Controller;
use Think\Controller;
class AController extends Controller {
    public function index(){
        echo THINK_VERSION;
        $query = M();
        //$sql = 'lock tables user write';
        //$dbLink = $query->locak();
        //$ab = $query->query($sql);
        //$query->lockTable('user',1);
        //var_dump($dbLink);
        //var_dump($query);
        $array=[
        'a'=>'das',
        ];
        var_dump($query);
    }
}