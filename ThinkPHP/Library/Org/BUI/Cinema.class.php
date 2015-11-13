<?php
namespace Org\BUI;
	class Cinema{
        var $cinema_id;
        var $description;
        var $address;
        var $phone;
        var $name;
        var $coverurl;

        function __construct($result){
            $this->phone = $result['phone'];
            $this->cinema_id = $result['cinema_id'];
            $this->name = $result['name'];
            $this->description = $result['description'];
            $this->address = $result['address'];
            $this->type = $result['type'];
            $this->coverurl = $result['coverurl'];
        }
    }
