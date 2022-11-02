<?php

class usuario{
    // Conexão
    private $db_conn;
    // Tabela
    private $db_table = "t_c4h_usuario";
    // Colunas
    public $_id;
    public $login;
    public $senha;
    public $email;
    public $nome;
    public $dataNascimento;
    public $cpf;
    public $url;
    public $nomeEmpresa;
    public $cnpj;
    public $admin;
    public $doador;
    public $assinante;
    public $colaborador;
    public $voluntario;
    public $dataCriacao;
    public $foto;

    // Construtor com a conexão ao BD
    public function __construct($db){
        $this->db_conn = $db;
    }

    // GET ALL
    public function mostrarTodosUsuarios(){
        $sqlQuery = "SELECT * FROM " . $this->db_table ;
        $stmt = $this->db_conn->prepare($sqlQuery);
        $stmt->execute();
        return $stmt;
    }

    // CREATE
    public function adicionarUsuarioPessoaFisica(): bool
    {
        $sqlQuery = "INSERT INTO ". $this->db_table . "
                    SET
                        id_usuario      = :id,
                        nm_login        = :login,
                        vl_senha        = :senha,       
                        nm_email        = :email,
                        vl_cpf          = :cpf,
                        dt_criacao      = :now";

        $stmt = $this->db_conn->prepare($sqlQuery);

        // bind data
        $stmt->bindParam(":id"    , $this->_id);
        $stmt->bindParam(":login" , $this->login);
        $stmt->bindParam(":senha" , $this->senha);
        $stmt->bindParam(":email" , $this->email);
        $stmt->bindParam(":cpf"   , $this->cpf);
        $stmt->bindParam(":now"   , $this->dataCriacao);

        if($stmt->execute()){
            return true;
        }
        return false;
    }

    // CREATE
    public function adicionarUsuarioPessoaJuridica(): bool
    {
        $sqlQuery = "INSERT INTO ". $this->db_table . "
                    SET
                        id_usuario      = :id,
                        nm_login        = :login,
                        vl_senha        = :senha,       
                        nm_email        = :email,
                        vl_cnpj         = :cnpj,
                        dt_criacao      = :now";

        $stmt = $this->db_conn->prepare($sqlQuery);

        // bind data
        $stmt->bindParam(":id"    , $this->_id);
        $stmt->bindParam(":login" , $this->login);
        $stmt->bindParam(":senha" , $this->senha);
        $stmt->bindParam(":email" , $this->email);
        $stmt->bindParam(":cnpj"  , $this->cnpj);
        $stmt->bindParam(":now"   , $this->dataCriacao);

        if($stmt->execute()){
            return true;
        }
        return false;
    }

    // GET Verify Login
    public function verificarLogin(){
        $sqlQuery = "SELECT EXISTS(SELECT * FROM ". $this->db_table ." WHERE nm_login = ? )";
        $stmt = $this->db_conn->prepare($sqlQuery);
        $stmt->bindParam(1, $this->login);
        $stmt->execute();
        return $stmt;
    }

    // GET Verify CPF
    public function verificarCpf(){
        $sqlQuery = "SELECT EXISTS(SELECT * FROM ". $this->db_table ." WHERE vl_cpf = ? )";
        $stmt = $this->db_conn->prepare($sqlQuery);
        $stmt->bindParam(1, $this->cpf);
        $stmt->execute();
        return $stmt;
    }

    // GET Verify CPF
    public function verificarCnpj(){
        $sqlQuery = "SELECT EXISTS(SELECT * FROM ". $this->db_table ." WHERE vl_cnpj = ? )";
        $stmt = $this->db_conn->prepare($sqlQuery);
        $stmt->bindParam(1, $this->cnpj);
        $stmt->execute();
        return $stmt;
    }

    // GET Verify if password is correct
    public function verUsuarioPorLogin(){
        $sqlQuery = "SELECT * FROM ". $this->db_table ." WHERE nm_login = ? LIMIT 0, 1";
        $stmt = $this->db_conn->prepare($sqlQuery);
        $stmt->bindParam(1, $this->login);
        $stmt->execute();
        $dataRow = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->senha = $dataRow["vl_senha"];
        $this->_id = $dataRow["id_usuario"];
    }

    // READ single
    public function verUsuarioPorId(){
        $sqlQuery = "SELECT * FROM ". $this->db_table ."
                    WHERE
                    id_usuario = ?
                    LIMIT 0,1";
        $stmt = $this->db_conn->prepare($sqlQuery);
        $stmt->bindParam(1, $this->_id);
        $stmt->execute();
        $dataRow = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->_id                = $dataRow["id_usuario"];
        $this->login              = $dataRow["nm_login"];
        $this->senha              = $dataRow["vl_senha"];
        $this->email              = $dataRow["nm_email"];
        $this->nome               = $dataRow["nm_nome"];
        $this->dataNascimento     = $dataRow["dt_nascimento"];
        $this->cpf                = $dataRow["vl_cpf"];
        $this->url                = $dataRow["vl_url"];
        $this->nomeEmpresa        = $dataRow["nm_razao_social"];
        $this->cnpj               = $dataRow["vl_cnpj"];
        $this->admin              = $dataRow["st_admin"];
        $this->doador             = $dataRow["st_doador"];
        $this->assinante          = $dataRow["st_assinante"];
        $this->colaborador        = $dataRow["st_colaborador"];
        $this->voluntario         = $dataRow["st_voluntario"];
        $this->dataCriacao        = $dataRow["dt_criacao"];
        $this->foto               = $dataRow["fl_foto"];

        return $stmt;
    }

//    // UPDATE
//    public function updateEmployee(){
//        $sqlQuery = "UPDATE
//                        ". $this->db_table ."
//                    SET
//                        name = :name,
//                        email = :email,
//                        age = :age,
//                        designation = :designation,
//                        created = :created
//                    WHERE
//                        id = :id";
//
//        $stmt = $this->conn->prepare($sqlQuery);
//
//        $this->name=htmlspecialchars(strip_tags($this->name));
//        $this->email=htmlspecialchars(strip_tags($this->email));
//        $this->age=htmlspecialchars(strip_tags($this->age));
//        $this->designation=htmlspecialchars(strip_tags($this->designation));
//        $this->created=htmlspecialchars(strip_tags($this->created));
//        $this->id=htmlspecialchars(strip_tags($this->id));
//
//        // bind data
//        $stmt->bindParam(":name", $this->name);
//        $stmt->bindParam(":email", $this->email);
//        $stmt->bindParam(":age", $this->age);
//        $stmt->bindParam(":designation", $this->designation);
//        $stmt->bindParam(":created", $this->created);
//        $stmt->bindParam(":id", $this->id);
//
//        if($stmt->execute()){
//            return true;
//        }
//        return false;
//    }


   // DELETE
   function apagarUsuario(){
       $sqlQuery = "DELETE FROM " . $this->db_table . " WHERE id_usuario = ?";
       $stmt = $this->db_conn->prepare($sqlQuery);

       $stmt->bindParam(1, $this->_id);

       if($stmt->execute()){
           return true;
       }
       return false;
   }
}
