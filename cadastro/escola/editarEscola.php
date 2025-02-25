<?php 

require_once '../conexao/ConexaoPDO.php';

$idEscola = $_POST['inputIdEscola'];
$nomeEscola = $_POST['inputNomeEscola'];
$conexao = ConexaoPDO::getInstance();
$query = "UPDATE escola SET nomeEscola=:y WHERE idEscola=:x";
$stmt = $conexao->prepare($query);
$stmt->bindValue("x", $idEscola, PDO::PARAM_STR);
$stmt->bindValue("y", $nomeEscola,PDO::PARAM_STR);
$stmt->execute();

echo "<script>location.href='listarEscolas.php'</script>";

?>
