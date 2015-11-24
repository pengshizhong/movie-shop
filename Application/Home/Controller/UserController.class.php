<?php
namespace Home\Controller;
use Think\Controller;
class UserController extends Controller {
    public function index(){
        $this->assign('searchurl',U('Search/index'));
        $model  = new \Home\Model\MovieModel();
        $account = M('account');
        $user_id = getUserId();
        //var_dump($user_id);
        $join   = [
            'left join schedule on schedule.schedule_id=account.schedule_id',
            'left join movie on movie.movie_id=schedule.movie_id',
        ] ;
        $userinfo = $model->select('user','user_id='. $user_id);
        $where = 'account.user_id=' . $user_id;
        $filed = 'account_id,user_id,buy_time,schedule.schedule_id,name,schedule.movie_id,date,price';
        $records = $account->join($join)->where($where)->field($filed)->select();
        //var_dump($userinfo);
        $this->assign('records',$records);
        $this->assign('userinfo',$userinfo[0]);
        $this->display();
    }
}