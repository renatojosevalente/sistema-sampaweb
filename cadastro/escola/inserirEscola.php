<?php 

require_once '../conexao/ConexaoPDO.php';


$nomeEscola = $_POST['inputNomeEscola'];
$conexao = ConexaoPDO::getInstance();
$query = "INSERT INTO escola (nomeEscola) VALUES (:y)";
$stmt = $conexao->prepare($query);
$stmt->bindValue("y",$nomeEscola,PDO::PARAM_STR);
$stmt->execute();

echo "<script>location.href='listarEscolas.php'</script>"

?>