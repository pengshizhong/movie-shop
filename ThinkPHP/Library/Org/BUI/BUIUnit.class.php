<?php
namespace Org\BUI;
class BUIUnit{
        var $rows = array();
        var $results=1;
        var $hasError=false;
        var $error='';
        function __construct($results,$className){
            $className = '\Org\BUI\\' . $className;
            $i=0;
            foreach($results as $result){
                $row = new $className($result);
                $this->rows[$i] = $row;
                $i++;
            }
            $this->results = $i;

        }
    }

	/**
     *
     */

	//echo "string";
	//$row = new row;
	//$result = new data();
	//var_dump( $result->rows);
	//var_dump($result);
	//echo json_encode($result);