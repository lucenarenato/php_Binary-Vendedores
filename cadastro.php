<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Cadastro</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="style.css" />
    <script type='text/javascript' src="js/jquery.min.js"></script>
    <script type='text/javascript' src="js/bootstrap.min.js"></script>
</head>

<?php
session_start();
require 'config.php';

// se existi um usuario logado

if(empty($_SESSION['mmnlogin'])) {
    header('Location: login.php');     // se ele estiver vazia ela entra no php, se estiver logado ela segue
    exit;      // se estiver logado ele para por aqui                        
}
$id = $_SESSION['mmnlogin'];   // pegar o nome do usuario é apartir do id o login do usuario


// quando for cadastrado o usuario segue a confirmacao abaixo

if(!empty($_POST['nome']) && !empty($_POST['email'])) {
    $nome = addslashes($_POST['nome']);
    $email = addslashes($_POST['email']); // recebendo o nome e email 
     
    // precido do que para cadastrar?

    $id_pai = $_SESSION['mmnlogin'];  // usuario da sessao 
    $senha = md5($email);             // dados para cadastro

    // verificar se o email esta cadastrado

    $sql = $pdo->prepare('SELECT * FROM usuarios WHERE email = :email');
    $sql->bindValue(':email', $email);
    $sql->execute();
      
    // se ele não achou ele vai inserir abaixo e vai para o index, se nao ele envia usuario ja cadastrado

    if($sql->rowCount() == 0) {
        //INSERT INTO `usuarios` (`id_pai`, `patente`, `nome`, `email`, `senha`) VALUES (1, 5, 'tango', 'tango@hotmail.com', 'teste')
        $sql = $pdo->prepare("INSERT INTO usuarios (id_pai, nome, email, senha) VALUES (:id_pai, :nome, :email, :senha)");
        $sql->bindValue(':id_pai', $id_pai);
        $sql->bindValue(':nome', $nome);
        $sql->bindValue(':email', $email);
        $sql->bindValue(':senha', $senha);
        $sql->execute();
        //var_dump($sql); exit;

        //echo $sql->rowCount();exit;

        header('Location: index.php');
        exit;
    }
    else{
        echo 'Usuario ja esta Cadastrado!';
    }
 }

?>

<body>

    <div class='container'>

         <img src="imagens/mmn.gif" class="img-responsive img-rounded " width="200" height="200">
        <h2 id='login'><kbd>Cadastrar Novos Usuários</kbd></h2>
        <form method='POST'class='form-horizontal'>
            <a href="#"><img src="imagens/user.png" width="50" height="50"><br/><?php echo $id_pai; ?></a>
     
            <div class='form-group-xs'>
                <label for="nome" class='nome'>Nome</label>
                <input type='text' name="nome" class="form-control"autofocus/>
            </div>

            <div class='form-group-xs'>
                <label for="email" class='email' >E-mail</label>
                <input type='email' name="email" class="form-control" />
            </div>

            <div class='form-group-xs'>
                <label for="password" class='password' >Password</label>
                <input type='password' name="password" class="form-control" />
            </div>
            
            <div class='form-group-xs'>
                <input type="submit" value="Cadastrar" class="btn btn-default" />
            </div>        
        </form>

        <hr>

        <div class="panel panel-success">
            <div class="panel-footer">Desenvolvedor
                 <a href='#' target='blank' id='link-1'>Renato Lucena</a>
            </div>
        </div>
</div>

</body>

</html>


<!-- 
    session_start();
    require 'config.php';
    if(!empty($_POST['nome']) && !empty($_POST['email'])) {
        $nome = addslashes($_POST['nome']);
        $email = addslashes($_POST['email']);
        $id_pai = $_SESSION['mmnlogin'];
        $senha = md5($email);
        $sql = $pdo->prepare("SELECT * FROM usuarios WHERE email = :email");
        $sql->bindValue(":email", $email);
        $sql->execute();
        if($sql->rowCount() == 0){
            $sql = $pdo->prepare("INSERT INTO usuarios (id_pai, nome, email, senha) VALUES (:id_pai, :nome, :email, :senha)");
            $sql->bindValue(":id_pai", $id_pai);
            $sql->bindValue(":nome", $nome);
            $sql->bindValue(":email", $email);
            $sql->bindValue(":senha", $senha);
            $sql->execute();
            header("Location: index.php");
            exit;
        } else {
            echo "Usuário inválido. Já cadastrado anteriormente.";
        }
    }
?>

<form method="POST">
    <h1>Cadastro de novo usuário</h1>
    Nome:<br/>
    <input type="text" name="nome"><br/><br/>
    E-mail:<br/>
    <input type="email" name="email"><br/><br/>

    <input type="submit" value="Cadastrar">
</form> -->