<?php 

require_once '../conexao/ConexaoPDO.php';

// Depuração inicial para verificar parâmetros recebidos
if (!isset($_GET['idEscola'])) {
    die("Erro: O parâmetro 'idEscola' não foi encontrado na URL.");
}

// Captura e valida o ID
$idEscola = filter_input(INPUT_GET, 'idEscola', FILTER_VALIDATE_INT);
if (!$idEscola) {
    die("Erro: ID inválido ou não fornecido.");
}

try {
    $conexao = ConexaoPDO::getInstance();
    $query = "DELETE FROM escola WHERE idEscola = :x";
    $stmt = $conexao->prepare($query);
    $stmt->bindValue(":x", $idEscola, PDO::PARAM_INT);
    $stmt->execute();

    echo "<script>location.href='listarEscolas.php';</script>";
} catch (PDOException $e) {
    die("Erro ao excluir o registro: " . $e->getMessage());
}
?>
