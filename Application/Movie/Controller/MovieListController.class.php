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
        $this->selectData($result,'Movie');
    }

    public function update(){
        //var_dump($_POST);
        $data = [
                 'movie_id' => I('post.movie_id'),
                 'coverurl' => I('post.coverurl'),
                 'name'     => I('post.name'),
                 'director' => I('post.director'),
                 'type'     => I('post.type') ,
                ];
        $where = ' movie_id=' . I('post.movie_id') . ' ';
        $this->updateData($data,'movie',$where);
    }

    public function delete(){
       // var_dump($_POST);
        $this->deleteData('movie');
    }

    public function insert(){
        $data = [
                'coverurl' => I('post.coverurl'),
                'name'     => I('post.name'),
                'director' => I('post.director'),
                'type'     => I('post.type'),
        ];
        $this->insertData('movie',$data);
    }
}