<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require_once '../src/config/config.php';
require_once '../src/config/db.php';

$app->post('/login', function (Request $request, Response $response, array $args) {
  
  $ret = null;
  $cnn = new DB();
  $resp = '';

  try{
    $cnn = $cnn->connect();

    if(!$cnn){
      throw new Exception("Error al conectar con la base de datos.", 1);
    }

    $user = $request->getParam('email');
    $pw= $request->getParam('passwd'); 
    $sql= "SELECT email, name, last_name_1, last_name_2, rol, route_image, id_user FROM Users WHERE email = '{$user}' and password = '{$pw}'"; 
    $stmt = $cnn->query($sql);
    $cnn-> close();
 
    if($stmt->num_rows!=1){
      throw new Exception("Usuario o contraseña incorrectos.", 5);
    } else{
      while ($row = $stmt->fetch_assoc())
        $ret[]= $row;
   }    
    $resp = '{"email": "'.$ret[0]["email"].'","name":"'.$ret[0]["name"].'","last_name_1":"'.$ret[0]["last_name_1"].'","last_name_2":"'.$ret[0]["last_name_2"].'","rol":"'.$ret[0]["rol"].'","route_image":"'.$ret[0]["route_image"].'","id":"'.$ret[0]["id_user"].'"}';

 
  }catch (Exception $e){             
    $resp = '{"error":{"text":"'.$e->getMessage().'"}}';
  }
  $response->getBody()->write($resp);
  $response->withHeader('Content-Type', 'application/json');
  return $response;  
});