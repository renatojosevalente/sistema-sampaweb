<?php
    session_start();
    if(isset($_SESSION['email'])){

?>

<?php
require_once '../conexao/ConexaoPDO.php';

$conn = ConexaoPDO::getInstance();

// Recuperar Alunos e Escola somente a Escola com ID = 1
$queryAlunos = "SELECT idAluno, nomeAluno FROM Aluno WHERE idEscola = 1";
$resultAlunos = $conn->query($queryAlunos);

$queryEscola = "SELECT nomeEscola FROM Escola WHERE idEscola = 1";
$resultEscola = $conn->query($queryEscola)->fetch(PDO::FETCH_ASSOC);

// Processa o envio do formulário
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['enviar'])) {
    $idAluno = $_POST['idAluno'];

    /* Busca idDisciplina associado ao idAluno, filtrando por idDisciplina entre 1 e 5,
    pois no banco de dados na tabela Disciplina os IDs de 1 a 5 representam as classes
    do 1º ao 5º ano somente na disciplina de Língua Portuguesa*/

    $queryDisciplinas = "SELECT DISTINCT ad.idDisciplina, e.idEscola
                         FROM AlunoDisciplina ad
                         JOIN Aluno a ON ad.idAluno = a.idAluno
                         JOIN Escola e ON a.idEscola = e.idEscola
                         WHERE ad.idAluno = ? AND ad.idDisciplina BETWEEN 1 AND 5";

    $stmt = $conn->prepare($queryDisciplinas);
    $stmt->execute([$idAluno]);
    $disciplinasAssociadas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (!$disciplinasAssociadas) {
        echo "<script>alert('O aluno não está vinculado a disciplinas com ID entre 1 e 5.')</script>";
        exit();
    }

    // Coleta das respostas do formulário
    $respostas = [];
    for ($i = 1; $i <= 20; $i++) {
        $respostas[$i] = $_POST["resposta$i"] ?? null;
    }

    // Valida se todas as respostas foram preenchidas
    if (in_array(null, $respostas, true)) {
        echo "<script>alert('Por favor, preencha todas as respostas antes de enviar.')</script>";
        exit();
    }

    $placeholders = implode(",", array_fill(0, 20, "?"));

    // Insere para cada disciplina associada ao aluno (com restrição de idDisciplina)
    $sqlInsert = "INSERT INTO Questoes_lp 
                  (idAluno, idDisciplina, idEscola, resposta1, resposta2, resposta3, resposta4, resposta5, resposta6, resposta7, resposta8, resposta9, resposta10, 
                  resposta11, resposta12, resposta13, resposta14, resposta15, resposta16, resposta17, resposta18, resposta19, resposta20) 
                  VALUES (?, ?, ?, $placeholders)";
    
    $stmtInsert = $conn->prepare($sqlInsert);

    foreach ($disciplinasAssociadas as $disciplina) {
        $params = array_merge([$idAluno, $disciplina['idDisciplina'], $disciplina['idEscola']], $respostas);

        try {
            if ($stmtInsert->execute($params)) {
                echo "<script>alert('Respostas inseridas com sucesso para a disciplina de ID " . $disciplina['idDisciplina'] . "')</script>";
            } else {
                echo "<script>alert('Erro ao inserir respostas para a disciplina de ID " . $disciplina['idDisciplina'] . "')</script>";
            }
        } catch (PDOException $e) {
            echo "<script>alert('Erro ao inserir respostas: " . $e->getMessage() . "')</script>";
        }
    }
}
?>



<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../estilo/estilo.css">
    <title>Inserir Respostas</title>
</head>
<body>
    <header>
        <img src="../imagens/sampaweb_logo2.png" alt="Logo" class="logo">
        <h1>Inserir Respostas do Aluno</h1>
        <p><strong>Disciplina:</strong> Língua Portuguesa</p>
        <p><strong>Escola:</strong> <?= $resultEscola['nomeEscola'] ?></p>
    </header>

    <form method="POST" action="">
        <label for="idAluno">Aluno:</label>
        <select name="idAluno" id="idAluno" required>
            <option value="">Selecione um aluno</option>
            <?php while ($row = $resultAlunos->fetch(PDO::FETCH_ASSOC)): ?>
                <option value="<?= $row['idAluno'] ?>" <?= isset($idAluno) && $idAluno == $row['idAluno'] ? 'selected' : '' ?>><?= $row['nomeAluno'] ?></option>
            <?php endwhile; ?>
        </select>

        <?php if (!empty($resultClasse['nomeClasse'])): ?>
            <label for="classe">Classe:</label>
            <input type="text" value="<?= $resultClasse['nomeClasse'] ?>" disabled>
        <?php endif; ?>

        <fieldset>
            <legend>
            ATENÇÃO PROFESSOR(A): Verificar que a prova de 1º e 5º ano = 16 questões, 2º e 4º ano = 15 questões, 
            3º ano = 14 questões. Se estiver utilizando computador utilize a tecla TAB e seta para baixo 
            para mudar de alternativa e de questão respectivamente.
            </legend>
            
            <?php for ($i = 1; $i <= 20; $i++): ?>
                <label for="resposta<?= $i ?>">Resposta <?= $i ?>:</label>
                <select name="resposta<?= $i ?>" id="resposta<?= $i ?>" required>
                    <option value="">Selecione</option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                </select>
                <br>
            <?php endfor; ?>
        </fieldset>

        <button type="submit" name="enviar">Enviar</button>
        <a href="editarResp.php" class="linkacesso-link">Editar resposta</a>
        <a href="../logout.php" class="linkacesso-link">Sair do sistema</a>
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