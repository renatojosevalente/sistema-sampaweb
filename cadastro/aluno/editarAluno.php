<?php 

require_once '../conexao/ConexaoPDO.php';

$idAluno = $_POST['inputIdAluno'];
$nomeAluno = $_POST['inputNomeAluno'];
$idClasse = $_POST['inputIdClasse'];
$idEscola = $_POST['inputIdEscola'];

$conexao = ConexaoPDO::getInstance();
$query = "UPDATE aluno SET idAluno=:a, nomeAluno=:b, idClasse=:c, idClasse=:d";

$stmt = $conexao->prepare($query);
$stmt->bindValue("a", $idAluno, PDO::PARAM_STR);
$stmt->bindValue("b", $nomeAluno, PDO::PARAM_STR);
$stmt->bindValue("c", $idClasse, PDO::PARAM_STR);
$stmt->bindValue("d", $idEscola, PDO::PARAM_STR);
$stmt->execute();

echo "<script>location.href='listarAlunos.php'</script>";

?>