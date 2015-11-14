<?php
namespace Org\BUI;
	class Account{
        var $account_id;
        var $userd;
        var $nickname;
        var $buy_time;
        var $shedule_id;
        var $seat;

        function __construct($result){
            $this->buy_time = $result['buy_time'];
            $this->account_id = $result['account_id'];
            $this->user_id = $result['user_id'];
            $this->nickname = $result['nickname'];
            $this->shedule_id = $result['shedule_id'];
            $this->seat = $result['col'] . '排' . $result['cow'] . '列';
        }
    }
