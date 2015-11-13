<?php
namespace Org\BUI;
	class User{
        var $user_id;
        var $email;
        var $nickname;
        var $phone;
        var $headurl;

        function __construct($result){
            $this->phone = $result['phone'];
            $this->user_id = $result['user_id'];
            $this->email = $result['email'];
            $this->nickname = $result['nickname'];
            $this->headurl = $result['headurl'];
        }
    }
