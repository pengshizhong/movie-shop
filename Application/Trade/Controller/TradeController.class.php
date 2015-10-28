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
    public function index(){

        $this->display(C('TPL_PATH') . 'Trade/trade.tpl');
    }
}