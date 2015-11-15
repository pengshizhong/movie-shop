<?php
namespace Home\Controller;
use Think\Controller;
class TicketController extends Controller {
    public function index(){
        $id = I('get.schedule_id');
        $allcss =['ticket'];
        $model  = new \Home\Model\MovieModel();
        $seat = $model->select('account',' schedule_id=' . $id);
        //var_dump($seat);
        $this->assign('schedule_id',$id);
        $this->assign('seat',$seat);
        $this->assign('movieurl',U('Movie/index'));
        $this->assign('searchurl',U('Search/index'));
        $this->assign('allcss',$allcss);
        $this->assign('buy',U('buy'));
        $this->assign('user',U('user'));
        $this->display();

    }

    public function buy(){
        //var_dump($_POST);
        $lockModel = new \Think\Model(); // 实例化一个model对象 没有对应任何数据表
        $model  = new \Home\Model\MovieModel();
        $schedule_id = I('post.schedule_id');
        $seats = I('post.seats');
        $user_id = session('user_id');
       // $account = M('account');
        M()->startTrans();
        //$lockModel->query("lock tables schedule write");
        $tickets = $model->select('account');
        foreach($tickets as $ticket){
            $flag = true;
            foreach($seats as $seat){
                if($seat['col']==$ticket['col']&&$seat['row']==$ticket['row']){
                    $flag = false;
                    break;
                }
            }
            if($flag){
                $data = [
                    'buy_time' => date('Y-m-d-h-i-s'),
                    'col'  => $ticket['col'],
                    'row'  => $ticket['row'],
                    'user_id' => $user_id,
                    'schedule_id' => $schedule_id,
                ];
                $model->addData($data);
            }
        }
        //$lockModel->query('unlock tables');
        M()->commit();

    }
}