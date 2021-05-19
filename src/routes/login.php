<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require_once '../src/config/config.php';
require_once '../src/config/db.php';

$app->post('/login', function (Request $request, Response $response, array $args) {

  $cnn = new DB();
  $resp = '';

  try{
    $cnn = $cnn->connect();

    if(!$cnn){
      throw new Exception("Error al conectar con la base de datos.", 1);
    }

    $user = $request->getParam('email');
    $pw= $request->getParam('password');    
    $sql= "SELECT email,name,last_name_1,last_name_2,rol,route_image,id_user FROM Users WHERE email = ?";

    $stmt = $cnn->prepare($sql);
    $stmt->bind_param("s",$user);

   
    $stmt->bind_result($email,$name,$last_name_1,$last_name_2,$rol,$route_image,$id_user);
    $stmt->execute();
    $stmt->store_result();
    

    if($stmt->affected_rows!=1){
      $stmt-> close();
      $cnn-> close();
      throw new Exception("Usuario o contraseña incorrectos.", 5);
    }
    
    $stmt->fetch();
    $resp = '{"email":"'.$email.'","name":"'.$name.'","last_name_1":"'.$last_name_1.'","last_name_2":"'.$last_name_2.'","rol":"'.$rol.'","route_image":"'.$route_image.'","id_user":"'.$id_user.'"}';

  }catch (Exception $e){
      $resp = '{"error": {"text":"'.$e-> getMessage().'"}}';
  }
  $response->getBody()->write($resp);
  $response->withHeader('Content-Type', 'application/json');
  return $response;      
});