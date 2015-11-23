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

    function select($tableName,$where='',$limet='',$join='',$lock=false){
        $model  = M($tableName);
        if($join) {
            if(!$lock)
                $result = $model->join($join)->where($where)->limit($limet)->select();
            else
                $result = $model->join($join)->where($where)->limit($limet)->lock(true)->select();
        }
        else {
            if(!$lock)
                $result = $model->where($where)->limit($limet)->select();
            else
                $result = $model->where($where)->limit($limet)->lock(true)->select();
        }
            return $result;
    }

    function selectOne($tableName,$where){
        $model  = M($tableName);
        $result = $model->where($where)->select();
        return $result;
    }
    function getContentByType($tableName,$pageContentNum,$order='id',$where=''){
        $Model 		= M($tableName);
        $count      = $Model->where($where)->count();
        //$pageNum 	= $count%10==0?sprintf("%d",($count/10)):sprintf("%d",$count/10+1);
        $Page       = new \Think\Page($count,$pageContentNum);
        $show       = $Page->show();
        $front = $Page->firstRow;
        if(I('get.start')){
            $Page->firstRow = I('get.start');
        }
        $list = $Model->where($where)->order($order)->limit($Page->firstRow.','.$Page->listRows)->select();
        $result 	= array(
            'show' => $show,
            'list' => $list,
            'pageNum' => $Page->totalPages,
            'pageNextStart' => $Page->firstRow+$Page->listRows,
            'pageFront'     => $front,
        );
        return $result;
    }

    function searchMovie($keyword){
        $model  = M('movie');
        $result = $model->where(" name like '%" . $keyword . '%\' ')->select();
        return $result;
    }

    function createwhere(){
      var_dump($_GET);
      //  foreach(I('get'))
    }

    function addData($tablename,$data){
        $model = M($tablename);
        $model->add($data);
    }
}