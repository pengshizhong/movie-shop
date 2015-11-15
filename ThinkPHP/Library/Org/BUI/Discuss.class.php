<?php
namespace Org\BUI;
	class Discuss{
        var $comment_id;
        var $user_id;
        var $nickname;
        var $name;
        var $content;
        var $adddate;

        function __construct($result){
            //var_dump($result);
            $this->comment_id = $result['comment_id'];
            $this->user_id = $result['user_id'];
            $this->nickname = $result['nickname'];
            $this->name = $result['name'];
            $this->content = $result['content'];
            $this->adddate = $result['adddate'];

        }
    }
