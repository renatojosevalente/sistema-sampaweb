<?php 

require_once 'conexao/ConexaoPDO.php';

// Verifica se os campos foram preenchidos
if (!empty($_POST['email']) && !empty($_POST['senha'])) {

    $email = $_POST['email'];
    $senha = $_POST['senha'];

    try {
        // Realiza a conexão com o banco de dados
        $conexao = ConexaoPDO::getInstance();

        // Prepara a consulta para buscar o usuário pelo e-mail
        $query = "SELECT * FROM Autentic WHERE email = :email";
        $stmt = $conexao->prepare($query);
        $stmt->bindValue(":email", $email, PDO::PARAM_STR);
        $stmt->execute();

        // Obtém o resultado da consulta
        $usuario = $stmt->fetchObject();

        // Verifica se o e-mail e a senha correspondem
        if ($usuario && $senha === $usuario->senha) {

            // Inicia a sessão e salva os dados do usuário
            session_start();
            $_SESSION['email'] = $usuario->email;

            // Redireciona para a página restrita do usuário
            echo "<script>location.href='{$usuario->paginaRestrita}'</script>";

        } else {
            // E-mail ou senha incorretos
            echo "<script>alert('E-mail ou senha incorretos!'); location.href='login.php';</script>";
        }

    } catch (PDOException $e) {
        // Exibe erros relacionados ao banco de dados
        echo "Erro: " . $e->getMessage();
    }
} else {
    // Campos não preenchidos
    echo "<script>alert('Por favor, preencha todos os campos!'); location.href='login.php';</script>";
}
?>
