<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->post('/checkOwnership', function (Request $request, Response $response, array $args) {
    $id_group = $request->getParam('id_group');
    $cnn = new DB();

    $auth = apache_request_headers();
    $token = $auth['Authorization'];
    $partsToken =  explode('.', $token);

    $data = json_decode(base64_decode($partsToken[1], true));

    try{
        $cnn = $cnn->connect();
      
        if(!$cnn){
            throw new Exception("Error al conectar con la base de datos.", 1);
        }

        $sql1 = "SELECT name FROM `groups` where id_user_owner = '{$data->id_user}' and id_group = '{$id_group}'";

        $stmt = $cnn->query($sql1);
        $cnn->close();

        if(!$stmt) {
            throw new Exception("Ha ocurrido un error en la consulta, intentelo más tarde.");
        }else{
            if($stmt->num_rows === 1) {
                $resp = '{"text": "Propietario correcto"}';
            } else {
                throw new Exception("No es el propietario del grupo");
                
            }
        }

    }catch (Exception $e) {      
        $resp = '{"error": "'.$e-> getMessage().'"}';
    }


    $response->getBody()->write($resp);
    $response->withHeader('Content-Type', 'application/json');
    return $response;
});