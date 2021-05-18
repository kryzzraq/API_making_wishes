<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once '../vendor/autoload.php';
  
$config = ['settings' => [
  'addContentLengthHeader' => true,
  'displayErrorDetails' => true
]]; 

$app = new \Slim\App($config);
/**
 * Example route:
 * 
 *  $app->get('/hello/{name}', function (Request $request, Response $response, array $args) {
 *    $name = $args['name'];
 *    $response->getBody()->write("Hello, $name");
 *    return $response;
 *  });
 *
 */

/**
 * New routes
 */

require "../src/routes/login.php";


 
$app->run();



