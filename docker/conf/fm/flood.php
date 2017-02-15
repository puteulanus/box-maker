<?php
    if(empty($_GET['pd'])){
        exit;
    }
    
    $password = $_GET['pd'];
    
    $ch = curl_init('127.0.0.1/flood/auth/authenticate');
    curl_setopt($ch, CURLOPT_HEADER, 1);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode([
        'username' => 'admin',
        'password' => $password
    ]));
    $header = curl_exec($ch);
    $header = explode('Set-Cookie:',$header);
    $header = explode(';', $header[1]);
    $header = explode('=', trim($header[0]), 2);
    $header = $header[1];
    setcookie('jwt',$header,0,'/flood/');
    header('Location: /flood/');