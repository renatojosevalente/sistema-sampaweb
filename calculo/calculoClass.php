<?php
require_once '../conexao/ConexaoPDO.php';

// Conexão com o banco de dados
$conexao = ConexaoPDO::getInstance();

try {
    // Loop para processar disciplinas de 1 a 10
    for ($idDisciplina = 1; $idDisciplina <= 10; $idDisciplina++) {

        // Buscar o gabarito da disciplina
        $queryGabarito = "
            SELECT * 
            FROM Gabarito 
            WHERE idDisciplina = :idDisciplina
            LIMIT 1
        ";
        $stmtGabarito = $conexao->prepare($queryGabarito);
        $stmtGabarito->bindParam(':idDisciplina', $idDisciplina, PDO::PARAM_INT);
        $stmtGabarito->execute();
        $gabarito = $stmtGabarito->fetch(PDO::FETCH_ASSOC);

        if (!$gabarito) {
            // Ignorar a disciplina caso não tenha gabarito
            echo "Gabarito não encontrado para a disciplina $idDisciplina.<br>";
            continue;
        }

        // Buscar respostas dos alunos na disciplina especificada
        $queryRespostas = "
            SELECT 
                q.*, 
                a.idClasse 
            FROM 
                Questoes_lp q
            LEFT JOIN 
                Aluno a ON q.idAluno = a.idAluno
            WHERE 
                q.idDisciplina = :idDisciplina
        ";
        $stmtRespostas = $conexao->prepare($queryRespostas);
        $stmtRespostas->bindParam(':idDisciplina', $idDisciplina, PDO::PARAM_INT);
        $stmtRespostas->execute();
        $respostasAlunos = $stmtRespostas->fetchAll(PDO::FETCH_ASSOC);

        // Processar cada aluno
        foreach ($respostasAlunos as $respostaAluno) {
            $pontuacao = 0;
            $acertos = 0;
            $erros = 0;

            // Comparar respostas com o gabarito
            for ($i = 1; $i <= 20; $i++) {
                $resposta = $respostaAluno["resposta$i"];
                $respostaGabarito = $gabarito["gabarito$i"];

                if ($resposta === $respostaGabarito) {
                    $pontuacao += 5; // Cada questão vale 5 pontos
                    $acertos++;
                } else {
                    $erros++;
                }
            }

            // Determinar a classificação
            if ($pontuacao <= 49) {
                $classificacao = "Insatisfatório";
            } elseif ($pontuacao <= 69) {
                $classificacao = "Regular";
            } elseif ($pontuacao <= 89) {
                $classificacao = "Satisfatório";
            } else {
                $classificacao = "Plenamente Satisfatório";
            }

            // Verificar se o registro já existe na tabela Resultado
            $queryVerificar = "
                SELECT idResultado 
                FROM Resultado_lp 
                WHERE idAluno = :idAluno 
                  AND idDisciplina = :idDisciplina 
                  AND idClasse = :idClasse 
                  AND idEscola = :idEscola
            ";
            $stmtVerificar = $conexao->prepare($queryVerificar);
            $stmtVerificar->bindParam(':idAluno', $respostaAluno['idAluno'], PDO::PARAM_INT);
            $stmtVerificar->bindParam(':idDisciplina', $idDisciplina, PDO::PARAM_INT);
            $stmtVerificar->bindParam(':idClasse', $respostaAluno['idClasse'], PDO::PARAM_INT);
            $stmtVerificar->bindParam(':idEscola', $respostaAluno['idEscola'], PDO::PARAM_INT);
            $stmtVerificar->execute();
            $resultadoExistente = $stmtVerificar->fetch(PDO::FETCH_ASSOC);

            if ($resultadoExistente) {
                // Atualizar registro existente
                $queryAtualizar = "
                    UPDATE Resultado_lp
                    SET pontuacaoAluno = :pontuacaoAluno, classificacao = :classificacao,
                        acertos = :acertos, erros = :erros
                    WHERE idResultado = :idResultado
                ";
                $stmtAtualizar = $conexao->prepare($queryAtualizar);
                $stmtAtualizar->bindParam(':pontuacaoAluno', $pontuacao, PDO::PARAM_INT);
                $stmtAtualizar->bindParam(':classificacao', $classificacao, PDO::PARAM_STR);
                $stmtAtualizar->bindParam(':acertos', $acertos, PDO::PARAM_INT);
                $stmtAtualizar->bindParam(':erros', $erros, PDO::PARAM_INT);
                $stmtAtualizar->bindParam(':idResultado', $resultadoExistente['idResultado'], PDO::PARAM_INT);
                $stmtAtualizar->execute();
            } else {
                // Inserir novo registro
                $queryInserirResultado = "
                    INSERT INTO Resultado_lp (
                        idAluno, 
                        idDisciplina, 
                        idClasse, 
                        idEscola, 
                        pontuacaoAluno, 
                        classificacao, 
                        acertos, 
                        erros
                    ) VALUES (
                        :idAluno, 
                        :idDisciplina, 
                        :idClasse, 
                        :idEscola, 
                        :pontuacaoAluno, 
                        :classificacao, 
                        :acertos, 
                        :erros
                    )
                ";
                $stmtInserir = $conexao->prepare($queryInserirResultado);
                $stmtInserir->bindParam(':idAluno', $respostaAluno['idAluno'], PDO::PARAM_INT);
                $stmtInserir->bindParam(':idDisciplina', $idDisciplina, PDO::PARAM_INT);
                $stmtInserir->bindParam(':idClasse', $respostaAluno['idClasse'], PDO::PARAM_INT);
                $stmtInserir->bindParam(':idEscola', $respostaAluno['idEscola'], PDO::PARAM_INT);
                $stmtInserir->bindParam(':pontuacaoAluno', $pontuacao, PDO::PARAM_INT);
                $stmtInserir->bindParam(':classificacao', $classificacao, PDO::PARAM_STR);
                $stmtInserir->bindParam(':acertos', $acertos, PDO::PARAM_INT);
                $stmtInserir->bindParam(':erros', $erros, PDO::PARAM_INT);
                $stmtInserir->execute();
            }

            echo "Aluno {$respostaAluno['idAluno']} - Disciplina $idDisciplina:<br>";
            echo "Pontuação: $pontuacao | Acertos: $acertos | Erros: $erros | Classificação: $classificacao<br>";
        }

        echo "Resultados processados e armazenados com sucesso para a disciplina $idDisciplina!<br>";
    }
} catch (Exception $e) {
    echo "Erro: " . $e->getMessage();
}
?>
