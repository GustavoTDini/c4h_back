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
$usuario->_id = $data->id;
$stmt = $usuario->verUsuarioPorId();
$userColumn = $stmt->fetchColumn();

if ($userColumn !== null){
    echo json_encode($usuario);
} else {
    http_response_code(404);
    echo json_encode(
        array("message" => "Não há usuários com esse id.")
    );
}