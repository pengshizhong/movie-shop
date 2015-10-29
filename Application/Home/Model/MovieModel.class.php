<?php
/**
 * Created by PhpStorm.
 * User: psz
 * Date: 15-10-29
 * Time: 上午10:53
 */

namespace Home\Model;
use Think\Model;
class MovieModel extends Model
{
    function select($tableName){
        $model  = M($tableName);
        $result = $model->select();
        return $result;
    }
}