<?php
    //获取当前剩余空间
    $free = disk_free_space('/')/1073741824;
    
    //获取当前下载列表
    $fct = 'download_list';
    $re = rpc ($fct,NULL);
    $re = xmlrpc_decode($re);
    
    //获取种子详细信息
    $json = array();
    foreach ($re as $key => $value) {
        $name = getname($value);
        $state = getway($value);
        $json[$key]['name'] = $name;
        $json[$key]['state'] = $state;
    }
    $json = json_encode($json,true);
    
    //制作post包
    $post = array(
        'free'=>$free,
	    'json'=>$json
	    );
    
    //发送post包
    $url='http://182.254.210.194/box/get.php';
	$ch = curl_init($url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_TIMEOUT, 10);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
	$out = curl_exec($ch);
	echo $out;
    
    
    function rpc ($fct,$hash){//RPC
        $ch = curl_init('http://127.0.0.1/RPC2');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        $post = xmlrpc_encode_request($fct, $hash);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
        $re = curl_exec($ch);
        curl_close($ch);
        if(empty($re)){
            echo 'Post RPC Failed!';
            exit();
        }
        return $re;
    }
    function getname ($hash){//获取名字
        $fct = 'd.get_name';
        $re = rpc($fct,$hash);
        if(empty($re)){
            echo 'Get name Failed!';
            exit();
        }
        return xmlrpc_decode($re);
    }
    function getmsg ($hash){//获取失败信息
        $fct = 'd.get_message';
        $re = rpc($fct,$hash);
        return xmlrpc_decode($re);
    }
    function getstate ($hash){//判断是否暂停
        $fct = 'd.get_state';
        $re = rpc($fct,$hash);
        $re = str_replace('<i8>','<string>',$re);
        $re = str_replace('</i8>','</string>',$re);
        return xmlrpc_decode($re);
    }
    function getcomplete ($hash){//判断是否下载完成
        $fct = 'd.get_complete';
        $re = rpc($fct,$hash);
        $re = str_replace('<i8>','<string>',$re);
        $re = str_replace('</i8>','</string>',$re);
        return xmlrpc_decode($re);
    }
    function getway ($hash){
        if(!empty(getmsg($hash))){
            return getmsg($hash);
        }
        if(!getstate($hash)){
            return 'Stop.';
        }
        if(getcomplete($hash)){
            return 'Finish.';
        }else{
            return 'Downloading.';
        }
    }