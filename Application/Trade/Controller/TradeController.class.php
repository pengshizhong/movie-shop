<?php
/**
 * Created by PhpStorm.
 * User: psz
 * Date: 15-10-28
 * Time: 下午10:12
 */

namespace Trade\Controller;
use Think\Controller;

class TradeController extends Controller
{
    private $tableName = 'account';
    private $util = 'Account';
    private function getData(){
        return [
            'account_id' => I('post.account_id'),
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
        $this->display(C('TPL_PATH') . 'Trade/trade.tpl');
    }

    public function select(){
        $model = new \Home\Model\MovieModel();
        $where = '';
        if(I('get.user_id')){
            $where = " user.user_id ='" . I('get.user_id') . "' and " . $where;
        }
        if(I('get.account_id')){
            $where = " account_id ='" . I('get.account_id') . "' and " . $where;
        }
        if(I('get.startDate')){
            $where = " buy_time>='" . I('get.startDate') . "' and " . $where;
        }
        if(I('get.end')){
            $where = " buy_time<='" . I('get.end') . "' and " . $where;
        }
        $where = $where . ' 1=1 ';
        $limit = I('get.pageInde') * I('get.limit');
        $result = $model->select($this->tableName,$where,I('get.start') . ',' . $limit,' user on user.user_id=account.user_id');
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