<?php
require_once '../conexao/ConexaoPDO.php';

header('Content-Type: application/json');

try {
    // Conexão com o banco de dados
    $conexao = ConexaoPDO::getInstance();

    // Consulta para buscar dados da tabela Resultado_lp com os nomes correspondentes
    $query = "
        SELECT 
            r.pontuacaoAluno, 
            r.classificacao, 
            r.acertos, 
            r.erros, 
            a.nomeAluno, 
            c.nomeClasse, 
            d.nomeDisciplina, 
            e.nomeEscola
        FROM 
            Resultado_lp r
        JOIN 
            Aluno a ON r.idAluno = a.idAluno
        JOIN 
            Classe c ON r.idClasse = c.idClasse
        JOIN 
            Disciplina d ON r.idDisciplina = d.idDisciplina
        JOIN 
            Escola e ON r.idEscola = e.idEscola
    ";

    $stmt = $conexao->prepare($query);
    $stmt->execute();

    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Verifica se há resultados e retorna como JSON
    if (!empty($resultados)) {
        echo json_encode(['status' => 'success', 'data' => $resultados]);
    } else {
        echo json_encode(['status' => 'success', 'data' => [], 'message' => 'Nenhum resultado encontrado']);
    }
} catch (Exception $e) {
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>
