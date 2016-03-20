<?php
namespace Vip\Controller;
use Think\Controller;
class VipListController extends Controller {
    private $tableName = 'user';
    private $util = 'User';
    private function getData(){
        return [
            'nickname' => I('post.nickname'),
            'headurl'  => I('post.headurl'),
            'email'    => I('post.email'),
            'phone'    => I('post.phone'),
        ];
    }
    public function index(){
        $this->assign('select',U('select'));
        $this->assign('update',U('update'));
        $this->assign('delete',U('delete'));
        $this->assign('insert',U('insert'));
        $this->display(C('TPL_PATH') . 'Vip/vipList.tpl');
    }

    public function select(){
        $model = new \Home\Model\MovieModel();
        $where = '';
        if(I('get.user_id')){
            $where = " user_id ='" . I('get.user_id') . "' and ";
        }
        if(I('get.nickname')){
            $where = " nickname ='" . I('get.nickname') . "' and " . $where;
        }

        $where = $where . ' 1=1 ';
        $limit = I('get.pageInde') * I('get.limit');
        $result = $model->select($this->tableName,$where,I('get.start') . ',' . $limit);
    //        echo $result;
    //        exit;
        $this->selectData($result,$this->util);
    }

    public function delete(){
        // var_dump($_POST);
        $this->deleteData($this->tableName);
    }

    public function insert(){
        $this->insertData('cinema',$this->getData());
    }

    public function update(){
        $where = $this->tableName . '_id=' . I('post.'.$this->tableName.'_id') . ' ';
        $this->updateData($this->getData(),$this->tableName,$where);
    }

}