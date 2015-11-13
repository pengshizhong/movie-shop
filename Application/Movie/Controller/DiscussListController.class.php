<?php
namespace Movie\Controller;
use Think\Controller;
class DiscussListController extends Controller {
    public function index(){
        $this->assign('select',U('select'));
        $this->assign('update',U('update'));
        $this->assign('delete',U('delete'));
        $this->assign('insert',U('insert'));
        $this->display(C('TPL_PATH') . '/Movie/discussList.tpl');
    }

    public function select(){
        $model = new \Home\Model\MovieModel();
        $where = '';
        if(I('get.startDate')){
            $where = " addDate >='" . I('get.startDate') . "' and ";
        }
        if(I('get.endDate')){
            $where = " addDate <='" . I('get.endDate') . "' and " . $where;
        }
        if(I('get.user_id')){
            $where = " user_id=" . I('get.user_id') . " and " . $where;
        }
        if(I('get.comment_id')){
            $where = " comment_id=" . I('get.comment_id') . " and " . $where;
        }
        $where = $where . ' 1=1 ';
        $join = [
            'LEFT JOIN user ON user.user_id=comment.user_id',
            'LEFT JOIN movie ON movie.movie_id=comment.movie_id',
        ];
        $limit = I('get.pageInde') * I('get.limit');
        $result = $model->select('comment',$where,I('get.start') . ',' . $limit,$join);
        //var_dump($result);
        $this->selectData($result,'Discuss');
    }
}