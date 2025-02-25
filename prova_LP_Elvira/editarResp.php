<?php
    session_start();
    if(isset($_SESSION['email'])){

?>

<?php
require_once '../conexao/ConexaoPDO.php'; // Inclui o arquivo de conexão com PDO

$conn = ConexaoPDO::getInstance();
$queryEscola = "SELECT idEscola, nomeEscola FROM Escola WHERE idEscola = 1";
$resultEscola = $conn->query($queryEscola)->fetch(PDO::FETCH_ASSOC);

// Recupera os dados do aluno e as respostas para exibição no formulário de edição
$idAluno = $_GET['idAluno'] ?? null;
$queryQuestoes = null;
$respostas = [];

if ($idAluno) {
    $queryQuestoes = "SELECT * FROM Questoes_lp WHERE idAluno = ?";
    $stmtQuestoes = $conn->prepare($queryQuestoes);
    $stmtQuestoes->execute([$idAluno]);
    $respostas = $stmtQuestoes->fetch(PDO::FETCH_ASSOC);
}

// Recupera os dados do aluno para a seleção no formulário
$queryAlunos = "SELECT idAluno, nomeAluno FROM Aluno WHERE idEscola = 1";
$resultAlunos = $conn->query($queryAlunos);

// Processa o envio do formulário de edição
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['atualizar'])) {
    $idAluno = $_POST['idAluno'];
    $respostasAtualizadas = [];
    for ($i = 1; $i <= 20; $i++) {
        $respostasAtualizadas[$i] = isset($_POST["resposta$i"]) ? $_POST["resposta$i"] : null;
    }

    // Atualiza as respostas no banco de dados
    $sqlUpdate = "UPDATE Questoes_lp SET 
        resposta1 = ?, resposta2 = ?, resposta3 = ?, resposta4 = ?, resposta5 = ?, 
        resposta6 = ?, resposta7 = ?, resposta8 = ?, resposta9 = ?, resposta10 = ?, 
        resposta11 = ?, resposta12 = ?, resposta13 = ?, resposta14 = ?, resposta15 = ?, 
        resposta16 = ?, resposta17 = ?, resposta18 = ?, resposta19 = ?, resposta20 = ? 
        WHERE idAluno = ?";

    $stmtUpdate = $conn->prepare($sqlUpdate);

    try {
        if ($stmtUpdate->execute(array_merge(array_values($respostasAtualizadas), [$idAluno]))) {
            echo "<script>alert('Respostas atualizadas com sucesso!')</script>";
        } else {
            echo "<script>alert('Erro ao atualizar respostas: Algo deu errado.')</script>";
        }
    } catch (PDOException $e) {
        echo "<script>alert('Erro ao atualizar respostas:' " . $e->getMessage() . "</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../estilo/estilo.css">
    <title>Editar Respostas</title>
</head>
<body>
    <header>
        <img src="../imagens/sampaweb_logo2.png" alt="Logo" class="logo">
        <h1>Editar Respostas do Aluno</h1>
        <p><strong>Disciplina:</strong> Língua Portuguesa</p>
        <p><strong>Escola:</strong> <?= $resultEscola['nomeEscola'] ?></p>
    </header>

    <form method="POST" action="">
        <label for="idAluno">Selecione um aluno:</label>
        <select name="idAluno" id="idAluno" onchange="location = '?idAluno=' + this.value" required>
            <option value="">Selecione um aluno</option>
            <?php while ($row = $resultAlunos->fetch(PDO::FETCH_ASSOC)): ?>
                <option value="<?= $row['idAluno'] ?>" <?= isset($idAluno) && $idAluno == $row['idAluno'] ? 'selected' : '' ?>><?= $row['nomeAluno'] ?></option>
            <?php endwhile; ?>
        </select>

        <?php if (!empty($respostas)): ?>
            <fieldset>
                <legend>Respostas:</legend>
                <?php for ($i = 1; $i <= 20; $i++): ?>
                    <label for="resposta<?= $i ?>">Resposta <?= $i ?>:</label>
                    <select name="resposta<?= $i ?>" id="resposta<?= $i ?>" required>
                        <option value="">Selecione</option>
                        <option value="A" <?= $respostas["resposta$i"] == "A" ? "selected" : "" ?>>A</option>
                        <option value="B" <?= $respostas["resposta$i"] == "B" ? "selected" : "" ?>>B</option>
                        <option value="C" <?= $respostas["resposta$i"] == "C" ? "selected" : "" ?>>C</option>
                        <option value="D" <?= $respostas["resposta$i"] == "D" ? "selected" : "" ?>>D</option>
                    </select>
                    <br>
                <?php endfor; ?>
            </fieldset>

            <button type="submit" name="atualizar">Atualizar</button>
            <a href="inserirResp.php" class="linkacesso-link">Voltar</a>
        <?php else: ?>
            <p>Selecione um aluno para editar as respostas.</p>
        <?php endif; ?>
    </form>
    <footer>
        <p>Sistema desenvolvido por: <strong>Renato José Valente - Ano 2025</strong></p>
    </footer>
</body>
</html>

<?php
    }else{
    ?>
    echo "<script>alert('Acesse a página de Login!!!'); location.href='../login.php';</script>";
 <?php
}
 ?>

