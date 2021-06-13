<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->post('/sendFriendship', function (Request $request, Response $response, array $args) {
    $cnn = new DB();
    $id_user_notif = $request->getParam("id_user_notif");

    $auth = apache_request_headers();
    $token = $auth['Authorization'];
    $partsToken =  explode('.', $token);

    $data = json_decode(base64_decode($partsToken[1], true));

    try{
        $cnn = $cnn->connect();
      
        if(!$cnn){
            throw new Exception("Error al conectar con la base de datos.", 1);
        }

        $sql = "INSERT INTO `notifications`(`recibed`, `user_notif`, `adding_user`, `id_group`, `kind`) 
            VALUES ('no','{$id_user_notif}','{$data->id_user}',NULL,'friendship')";

        $stmt1 = $cnn->query($sql);
        $cnn-> close(); 

        if(!$stmt1) {
            throw new Exception("Ha habido un error, intentelo más tarde.");
        }


        $resp = '{"text": "Notificación mandada."}';

    } catch (Exception $e) {
        $response = $response->withStatus(400);        
        $resp = '{"error": "'.$e-> getMessage().'"}';
    }

    $response->getBody()->write($resp);
    $response->withHeader('Content-Type', 'application/json');
    return $response;
});