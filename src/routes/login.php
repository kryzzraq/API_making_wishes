<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

//constantes
require_once '../src/config/config.php';
//manejador BD
require_once '../src/config/db.php';


$app->post('/login', function (Request $request, Response $response, array $args) {
        $response = $request->getParam("email");
        
        return $name->withHeader('Access-Control-Allow-Origin', '*');
      });