<?php
namespace Org\BUI;
	class Discuss{
        var $comment_id;
        var $user_id;
        var $nikename;
        var $name;
        var $content;
        var $adddate;

        function __construct($result){
            //var_dump($result);
            $this->comment_id = $result['comment_id'];
            $this->user_id = $result['user_id'];
            $this->nikename = $result['nickname'];
            $this->name = $result['name'];
            $this->content = $result['content'];
            $this->adddate = $result['adddate'];

        }
    }
