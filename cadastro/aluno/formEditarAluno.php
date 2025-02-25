<?php
    session_start();
    if(isset($_SESSION['email'])){

?>

<?php 

require_once '../conexao/ConexaoPDO.php';

$idAluno = $_GET['idAluno'];
$conexao = ConexaoPDO::getInstance();
$query = "SELECT * FROM aluno WHERE idAluno=:x";
$stmt = $conexao->prepare($query);
$stmt->bindValue("x", $idAluno, PDO::PARAM_STR);
$stmt->execute();
$aluno = $stmt->fetch();

?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manutenção de alunos</title>
    
</head>
<body>

    <h1>Editar Aluno</h1>
    <hr>
    <form action="editarAluno.php" method="POST">
    <input type="hidden" name="inputIdAluno" id="inputIdAluno" value="<?php echo $aluno["id"] ?>">

    <label for="inputNomeAluno">Nome Aluno</label>
    <input type="text" name="inputNomeAluno" id="inputNomeAluno" value="<?php echo $aluno["nomeAluno"]; ?>">

    <label for="inputIdClasse">Id Classe</label>
    <input type="text" name="inputIdClasse" id="inputIdClasse" value="<?php echo $aluno["idClasse"]; ?>">

    <label for="inputIdEscola">Id Escola</label>
    <input type="text" name="inputIdEscola" id="inputIdEscola" value="<?php echo $aluno["idEscola"]; ?>">

    <input type="submit" value="Editar Aluno">
    </form>
    <hr>
</body>
</html>


<?php
    }else{
    ?>
    echo "<script>alert('Acesse a página de Login!!!'); location.href='../../login.php';</script>";
 <?php
}
 ?>
