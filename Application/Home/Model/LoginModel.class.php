<?php
/**
 * Created by PhpStorm.
 * User: psz
 * Date: 15-10-29
 * Time: 上午10:53
 */

namespace Home\Model;
use Think\Model;
class LoginModel extends Model
{
    function register(){

    }

    function check($username,$password){
        $model   = M('user');
        $account = $model->where(" email='" . $username "' ")->select();
        $account = $account[0];
        if($account){
            if($password==$account['password']){
                //session()
            }
        }
    }
}