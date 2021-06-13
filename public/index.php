<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once '../vendor/autoload.php';
  
$config = ['settings' => [
  'addContentLengthHeader' => true,
  'displayErrorDetails' => true
]]; 

$app = new \Slim\App($config);

// $middleware = function ($request, $response, $next) 
// {
//   $route = $request->getUri()->getPath();
  
//   $publicRoutes = [
//     'login',
//     'signin'
//   ];

//   if (!in_array($route, $publicRoutes)) {
//     $auth = apache_request_headers();
//     $auth = $auth['Authorization'];

//     if(JWT::validate($auth, TOKEN_KEY)){

//       $response = $next($request, $response);

//     }else{
//       $response = $response->withStatus(401);
//     } 

//   }else{
//     $response = $next($request, $response);
//   }

//   return $response;
// };

/**
 * New routes
 */

//login, registro, cerrar sesión, renovar datos
require "../src/routes/login.php";

//crear deseo, cargar todos los deseos, borrar deseo
require "../src/routes/new_wish.php";

//crear grupo, borrar grupo
require "../src/routes/groups.php";

//cargar deseos de un grupo concreto, cargar miembros de un grupo concreto
require "../src/routes/wish_groups.php";

//cargar los contactos de un usuario concreto
require "../src/routes/users_actions.php";

//eliminar contacto, ver detalles de un contacto
require "../src/routes/contacts.php";

// $app->add($middleware);
$app->run();