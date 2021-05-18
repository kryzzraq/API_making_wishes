<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;


require_once '../src/config/config.php';
require_once '../src/config/db.php';


$app->get('/hola', function (Request $request, Response $response, array $args) {
  $a = "Hola";
  $response->getBody()->write($a);
  $response->withHeader('Content-Type', 'application/json');
  var_dump($response);
  return $response;
});