<?php
namespace Home\Controller;
use Think\Controller;
class TicketController extends Controller {
    public function index(){
        islogin();
        $id = I('get.schedule_id');
        $allcss =['ticket'];
        $model  = new \Home\Model\MovieModel();
        $join = [
            ' movie on movie.movie_id=schedule.movie_id ',

        ];
        $seat = $model->select('account',' schedule_id=' . $id);
        $movieInfo = $model->select('schedule',' schedule_id=' . $id,'',$join);
        //var_dump($movieInfo);
        //var_dump($seat);
        $this->assign('movieInfo',$movieInfo[0]);
        $this->assign('schedule_id',$id);
        $this->assign('seat',$seat);
        $this->assign('movieurl',U('Movie/index'));
        $this->assign('searchurl',U('Search/index'));
        $this->assign('allcss',$allcss);
        $this->assign('buy',U('buy'));
        $this->assign('user',U('user/index'));
        $this->display();

    }

    public function buy(){

        //  var_dump($_POST);
        //  $lockModel = new \Think\Model(); // 实例化一个model对象 没有对应任何数据表
        $model  = new \Home\Model\MovieModel();
        $schedule_id = I('post.schedule_id');
        $tickets = I('post.seats');
        $user_id = getUserId();
         // $account = M('account');
        //$lockModel = M();
        M()->startTrans();
        //$lockModel->lockTable('account',1);
        $seats = $model->select('account','','','',true);
        $tflag = true;
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
                    'buy_time' => date('Y-m-d h-i-s'),
                    'col'  => $ticket['col'],
                    'row'  => $ticket['row'],
                    'user_id' => $user_id,
                    'schedule_id' => $schedule_id,
                ];
                //var_dump($data);
                $model->addData('account',$data);
            }
            else{
                M()->rollback();
                echo '{"success":0}';
                $tflag=false;
                break;
            }
        }

        if($tflag) {
            M()->commit();
            echo '{"success":1}';
            //  echo '{"success":1}';
        }

    }
}