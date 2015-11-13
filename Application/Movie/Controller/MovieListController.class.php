<?php
namespace Movie\Controller;
use Think\Controller;
class MovieListController extends Controller {
    public function index(){
        $this->assign('select',U('select'));
        $this->assign('update',U('update'));
        $this->assign('delete',U('delete'));
        $this->assign('insert',U('insert'));
        $this->display(C('TPL_PATH') . 'Movie/movieList.tpl');
        //$this->display(C('TPL_PATH') . '/Movie/discussList.tpl');
    }

    /**
     * @return string
     */
    public function select(){
       // $model = \Home\Model\MovieModel;
        //Vendor('BUI.BUIUnit');
        //$sine = new \BUI\BUIUnit();
        //var_dump($sine);
//        $image = new \Org\BUI\BUIUnit();
//        var_dump($image);
        $model = new \Home\Model\MovieModel();
        $where = '';
        include('');
        if(I('get.showtime')){
            $where = " showtime >='" . I('get.showtime') . "' and ";
        }
        if(I('get.endtime')){
            $where = " endtime <='" . I('get.endtime') . "' and " . $where;
        }
        if(I('get.name')){
            $where = " name='" . I('get.name') . "' and " . $where;
        }
        $where = $where . ' 1=1 ';
        $limit = I('get.pageInde') * I('get.limit');
        $result = $model->select('movie',$where,I('get.start') . ',' . $limit);
        //var_dump($result);
        $this->selectData($result,'Movie');
//        $data = new \Org\BUI\BUIUnit($result,'Movie');
//        //var_dump($data);
//        //$result = '{"rows":[{"movie_id":"a","b":"b","c":"c"}],"results":1,"hasError":false,"error":""}';
//        //var_dump(json_decode($result));
//        echo json_encode($data);
    }

    public function update(){
        
        $this->updateData();
    }
}