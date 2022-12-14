<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
include_once '..\config\database.php';
include_once '..\models\usuario.php';

try {
    $database = new Database();
    $db = $database->getConnection();

    $usuario = new usuario($db);
    $data = json_decode(file_get_contents("php://input"));
    $usuario->_id           = uniqid("", true);
    $usuario->login         = $data->login;
    $usuario->email         = $data->email;
    $usuario->cpf           = $data->cpf;
    $usuario->senha         = $data->senha;
    $usuario->dataCriacao   = date('Y-m-d H:i:s');

    if($usuario->adicionarUsuarioPessoaFisica()){
        echo 'Adicionado usuário.';
    }
    $db = null;

}
catch(Exception $e) {
    echo 'Exception -> ';
    var_dump($e->getMessage());
}









