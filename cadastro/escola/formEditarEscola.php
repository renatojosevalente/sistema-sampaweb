<?php
    session_start();
    if(isset($_SESSION['email'])){

?>

<?php 

require_once '../conexao/ConexaoPDO.php';

$idEscola = $_GET['idEscola'];
$conexao = ConexaoPDO::getInstance();
$query = "SELECT * FROM escola WHERE idEscola=:x";
$stmt = $conexao->prepare($query);
$stmt->bindValue("x", $idEscola, PDO::PARAM_STR);
$stmt->execute();
$escola = $stmt->fetch();

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Escola</title>
</head>
<body>

<h1>Manutenção de escolas</h1>

<h2>Editar Escola</h2>

<form action="editarEscola.php" method="POST">
    <input type="hidden" name="inputIdEscola" id="inputIdEscola" value="<?php echo $escola["idEscola"]; ?>">

    <label for="inputNomeEscola">Nome Escola:</label>
    
    <input type="text" name="inputNomeEscola" id="inputNomeEscola" value="<?php echo $escola["nomeEscola"]; ?>">

    <input type="submit" value="Editar Escola">
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