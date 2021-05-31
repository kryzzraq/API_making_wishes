<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require_once '../src/config/config.php';
require_once '../src/config/db.php';
require_once '../src/config/tokenGenerator.php';

//loguear en el sistema
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

      $now = new DateTime();
      $expirationDate = new DateTime("now +1 hours");
      $payload = [
        "id_user" => "a",
        "rol" => "wisher",
        "starts" => $now->getTimeStamp(),
        "ends" => $expirationDate->getTimeStamp()
      ];
      
      $token = JWT::createToken($payload, TOKEN_KEY);
    }    
    $resp = '{"email": "'.$ret[0]["email"].'","name":"'.$ret[0]["name"].
      '","last_name_1":"'.$ret[0]["last_name_1"].'","last_name_2":"'.$ret[0]["last_name_2"].
      '","rol":"'.$ret[0]["rol"].'","route_image":"'.$ret[0]["route_image"].
      '","id":"'.$ret[0]["id_user"].'","token":"'.$token.'"}';
    
    
  }catch (Exception $e){             
    $resp = '{"error":{"text":"'.$e->getMessage().'"}}';
  }
  
  $response->getBody()->write($resp);
  $response->withHeader('Content-Type', 'application/json');
  return $response;  
});


//registrarse en la base de datos:
$app->post('/signin', function (Request $request, Response $response, array $args) {
  $cnn = new DB();
  try{
    $cnn = $cnn->connect();
    
    if(!$cnn){
      throw new Exception("Error al conectar con la base de datos.", 1);
    }
    
    $ret = null;
    $resp = '';
    $err = [];
    $regexName = "/(^[a-záéíóúñ]+)([a-z áéíóúñ]+)?$/i";
    $regexLastNames = "/(^[a-záéíóúñ]+)$/i";
    

    if (!filter_var($request->getParam('email'), FILTER_VALIDATE_EMAIL)){
      $err['email'] = "El email no es válido.";
    }
    
    if ($request->getParam('password1') !== $request->getParam('password2')){
      $err['password'] = "Las contraseñas no coinciden";
    }
    
    if (preg_match($regexName, $request->getParam('name'))!== 1) {
      $err['name'] = "Nombre en formato inválido.";
    }
    
    if (preg_match($regexLastNames, $request->getParam('last_name_1')) !== 1){
      $err['last_name_1'] = "Primer apellido inválido.";
    }
    
    if (preg_match($regexLastNames, $request->getParam('last_name_2')) !== 1){
      $err['last_name_2'] = "Segundo apellido inválido.";
    }

    if (count($err) === 0) {

      if (isset($_FILES['image']['name'])) {
        $path = $_FILES['image']['name'];
        $ext = pathinfo($path, PATHINFO_EXTENSION);
        $restado='';
          try {
        
            if($ext != 'jpg' && $ext !='png' && $ext != 'PNG' && $ext != 'JPG'){
              throw new Exception("Formato no válido", 1);
            }
            $location = 'upload/';
        
            $now = new DateTime();
            $now = $now->getTimeStamp();
        
            $filename = $now . $path;
            $totalPath = $location.$filename;

            move_uploaded_file($_FILES['image']['tmp_name'],$location.$filename);

        
            $arr = array("imagen"=>$filename);
            $restado = json_encode($arr);

            $sql = "INSERT INTO `users` (`name`, `last_name_1`, `last_name_2`, `email`, `password`, `rol`, `route_image`) 
              VALUES ('{$request->getParam("name")}', '{$request->getParam("last_name_1")}', '{$request->getParam("last_name_2")}', 
              '{$request->getParam("email")}', '{$request->getParam("password1")}', 'wisher', '{$totalPath}')";

            $stmt = $cnn->query($sql);
            $cnn-> close();
      
            if(!$stmt){
              throw new Exception("Ha habido un error, intentelo más tarde.", 5);
            } else{
              $json = '{"text": "USUARIO REGISTRADO CORRECTAMENTE."}';
            }
        
          } catch (Exception $e) {
            $response = $response->withStatus(400);
            $resp = '{"error": "'.$e-> getMessage().'"}';
          }


      } else {
        $sql = "INSERT INTO `users` (`name`, `last_name_1`, `last_name_2`, `email`, `password`, `rol`) 
        VALUES ('{$request->getParam("name")}', '{$request->getParam("last_name_1")}', '{$request->getParam("last_name_2")}', 
        '{$request->getParam("email")}', '{$request->getParam("password1")}', 'wisher')";

        $stmt = $cnn->query($sql);
        $cnn-> close();
  
        if(!$stmt){
          throw new Exception("Ha habido un error, intentelo más tarde.", 5);
        } else{
          $json = '{"text": "Usuario registrado correctamente."}';
        }
        
      }
    } else {
      $json = json_encode($err);
    }    
    $resp = $json;

 
  } catch (Exception $e){             
    $resp = '{"error":{"text":"'.$e->getMessage().'"}}';
  }
  $response->getBody()->write($resp);
  $response->withHeader('Content-Type', 'application/json');
  return $response;  
});


$app->get('/signoff', function (Request $request, Response $response) {
  $path = $request->getUri()->getPath();
  $response->withStatus(200);
  $response->getBody()->write( $path);
  $response->withHeader('Content-Type', 'application/json');
  return $response; 
});