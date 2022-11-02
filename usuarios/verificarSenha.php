<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '..\config\database.php';
include_once '..\models\usuario.php';

$database = new Database();
$db = $database->getConnection();
$usuario = new usuario($db);
$data = json_decode(file_get_contents("php://input"));
$usuario->login = $data->login;
$usuario->senha = $data->senha;
$stmt = $usuario -> verificarSenha();
echo json_encode($stmt->fetchColumn());