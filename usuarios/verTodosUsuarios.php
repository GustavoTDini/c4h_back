<?php

function verUsuarios(){
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: GET");
    header("Access-Control-Max-Age: 3600");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

    include_once '..\config\database.php';
    include_once '..\models\usuario.php';
    $database = new Database();
    $db = $database->getConnection();
    $usuarios = new usuario($db);
    $stmt = $usuarios->mostrarTodosUsuarios();
    $usuariosTotais = $stmt->rowCount();

    if($usuariosTotais > 0){
        $employeeArr = array();
        $employeeArr["itemCount"] = $usuariosTotais;
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            $e = array(
                "id"              =>$id_usuario,
                "login"           =>$nm_login,
                "email"           =>$nm_email,
                "senha"           =>"",
                "admin"           =>$st_admin,
                "doador"          =>$st_doador,
                "assinante"       =>$st_assinante,
                "colaborador"     =>$st_colaborador,
                "voluntário"      =>$st_voluntario,
                "razao_social"    =>$nm_razao_social,
                "cpf"             =>$vl_cpf,
                "cnpj"            =>$vl_cnpj,
                "data_nascimento" =>$dt_nascimento,
                "URL"             =>$vl_url,
                "data_criacao"    =>$dt_criacao,
                "Foto"            =>$fl_foto
            );
            $employeeArr["users"][] = $e;
        }
        echo json_encode($employeeArr);
    }
    else{
        http_response_code(404);
        echo json_encode(
            array("message" => "Não há usuários salvos")
        );
    }
}

