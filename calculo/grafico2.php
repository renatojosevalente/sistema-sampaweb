<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../estilo/estilo.css">
    <title>Gráfico de Pontuação por Aluno</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 20px;
        }
        #chartContainer {
            max-width: 1250px;
            margin: 0 auto;
        }
        canvas {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <img src="../imagens/sampaweb_logo2.png" alt="Logo de Login" class="logo">
        <h1>Gráfico de Pontuação por Aluno - SAMPA 2024</h1>
        <p><strong>Escola:</strong> TODAS AS ESCOLAS MUNICIPAIS</p><br>
        
    </header>

    <hr>

    <div id="chartContainer">
        <canvas id="graficoHorizontal"></canvas>
    </div>
    <button onclick="downloadImage()">Baixar Gráfico (PNG)</button>
    <a href="../index.php" class="linkacesso-link">Sair do sistema</a>

    <?php



require_once '../conexao/ConexaoPDO.php';

try {
    $conexao = ConexaoPDO::getInstance();
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
    LEFT JOIN 
        Aluno a ON r.idAluno = a.idAluno
    LEFT JOIN 
        Classe c ON r.idClasse = c.idClasse
    LEFT JOIN 
        Disciplina d ON r.idDisciplina = d.idDisciplina
    LEFT JOIN 
        Escola e ON r.idEscola = e.idEscola
";


    $stmt = $conexao->prepare($query);
    $stmt->execute();
    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo "<pre>";
    print_r($resultados);
    echo "</pre>";
    
} catch (Exception $e) {
    echo "Erro ao carregar os dados: " . $e->getMessage();
}
?>


    <script>
        function getColorByClassification(classification) {
            switch (classification) {
                case 'Insatisfatório':
                    return 'rgba(255, 99, 132, 0.8)';
                case 'Regular':
                    return 'rgba(255, 165, 0)';
                case 'Satisfatório':
                    return 'rgba(75, 192, 192, 0.8)';
                case 'Plenamente Satisfatório':
                    return 'rgba(54, 162, 235, 0.8)';
                default:
                    return 'rgba(201, 203, 207, 0.8)';
            }
        }

        function criarGrafico() {
            if (!resultados || resultados.length === 0) {
                alert('Nenhum dado encontrado.');
                return;
            }

            const labels = resultados.map(
                res => `${res.nomeAluno}\n(${res.nomeClasse}, ${res.nomeDisciplina}, ${res.nomeEscola})`
            );
            const pontuacoes = resultados.map(res => res.pontuacaoAluno);
            const acertos = resultados.map(res => res.acertos);
            const erros = resultados.map(res => res.erros);
            const classificacoes = resultados.map(res => res.classificacao);

            const colors = classificacoes.map(classificacao => getColorByClassification(classificacao));

            const ctx = document.getElementById('graficoHorizontal').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [
                        {
                            label: 'Pontuação',
                            data: pontuacoes,
                            backgroundColor: colors,
                            borderColor: colors.map(color => color.replace('0.8', '1')),
                            borderWidth: 1
                        },
                        {
                            label: 'Acertos',
                            data: acertos,
                            backgroundColor: 'rgba(75, 192, 192, 0.8)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1,
                            stack: 'ErroAcerto'
                        },
                        {
                            label: 'Erros',
                            data: erros,
                            backgroundColor: 'rgba(255, 99, 132, 0.8)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1,
                            stack: 'ErroAcerto'
                        }
                    ]
                },
                options: {
                    indexAxis: 'y', // Gráfico horizontal
                    responsive: true,
                    plugins: {
                        legend: {
                            display: true
                        },
                        tooltip: {
                            callbacks: {
                                afterLabel: function (context) {
                                    return `Classificação: ${classificacoes[context.dataIndex]}`;
                                }
                            }
                        },
                        title: {
                            display: true,
                            text: 'Pontuação, Acertos e Erros por Aluno - SAMPA 2024',
                            font: {
                                size: 20
                            },
                            padding: {
                                top: 40,
                                bottom: 20
                            }
                        }
                    },
                    scales: {
                        x: {
                            beginAtZero: true,
                            max: 100 // Limite do eixo X para pontuações
                        },
                        y: {
                            stacked: true // Apenas erros e acertos são empilhados
                        }
                    }
                }
            });
        }
        console.log(Chart);
        // Função para baixar o gráfico como imagem PNG
        function downloadImage() {
            const canvas = document.getElementById('graficoHorizontal');
            const link = document.createElement('a');
            link.href = canvas.toDataURL('image/png');
            link.download = 'grafico_pontuacao_horizontal.png';
            link.click();
        }

        // Criar o gráfico ao carregar a página
        window.onload = criarGrafico;
    </script>

    <footer>
        <p>Sistema desenvolvido por: <strong>Renato José Valente - Ano 2025</strong></p>
    </footer>
</body>
</html>
