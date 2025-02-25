<?php 

require_once '../conexao/ConexaoPDO.php';


$nomeAluno = $_POST['inputNomeAluno'];
$conexao = ConexaoPDO::getInstance();
$query = "INSERT INTO aluno (nomeAluno) VALUES (:y)";
$stmt = $conexao->prepare($query);
$stmt->bindValue("y",$nomeAluno,PDO::PARAM_STR);
$stmt->execute();

echo "<script>location.href='listarEscolas.php'</script>"

?>