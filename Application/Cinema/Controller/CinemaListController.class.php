<?php
namespace Cinema\Controller;
use Think\Controller;
class CinemaListController extends Controller {
    public function index(){
        $this->assign('select',U('select'));
        $this->assign('update',U('update'));
        $this->assign('delete',U('delete'));
        $this->assign('insert',U('insert'));
        $this->display(C('TPL_PATH') . 'Cinema/cinemaList.tpl');
    }

    public function select(){
        $model = new \Home\Model\MovieModel();
        $where = '';
        include('');
        if(I('get.address')){
            $where = " address ='" . I('get.address') . "' and ";
        }
        if(I('get.name')){
            $where = " name ='" . I('get.name') . "' and " . $where;
        }

        $where = $where . ' 1=1 ';
        $limit = I('get.pageInde') * I('get.limit');
        $result = $model->select('cinema',$where,I('get.start') . ',' . $limit);
        $this->selectData($result,'Cinema');
    }

    public function delete(){
        // var_dump($_POST);
        $this->deleteData('cinema');
    }

    public function insert(){
        $data = [
            'description' => I('post.description'),
            'name'     => I('post.name'),
            'address' => I('post.address'),
            'phone'     => I('post.phone'),
            'coverurl' => I('post.coverurl'),
        ];
        $this->insertData('cinema',$data);
    }

    public function update(){
        //var_dump($_POST);
        $data = [
            'name'     => I('post.name'),
            'address' => I('post.address'),
            'phone'     => I('post.phone'),

        ];
        $where = ' cinema_id=' . I('post.cinema_id') . ' ';
        $this->updateData($data,'cinema',$where);
    }
}