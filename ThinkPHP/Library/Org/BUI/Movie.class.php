<?php
namespace Org\BUI;
	class Movie{
        var $movie_id;
        var $name;
        var $director;
        var $coverurl;
        var $type;
        var $showtime;
        var $remark;

        function __construct($result){
            $this->movie_id = $result['movie_id'];
            $this->name = $result['name'];
            $this->director = $result['director'];
            $this->coverurl = $result['coverurl'];
            $this->type = $result['type'];
            $this->showtime = $result['showtime'];
            $this->remark = $result['remark'];
        }
    }
