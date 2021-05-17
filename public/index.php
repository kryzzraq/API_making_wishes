<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require_once '../vendor/autoload.php';

$app = new \Slim\App;
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




 
$app->run();



