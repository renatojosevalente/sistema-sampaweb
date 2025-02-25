<?php
    session_start();
    if(isset($_SESSION['email'])){

?>

<?php
require_once '../../conexao/ConexaoPDO.php';

?>

<?php

$conexao = ConexaoPDO::getInstance();
$query = "SELECT * FROM aluno";
$stmt = $conexao->prepare($query);
$stmt->execute();
$aluno = $stmt->fetchAll();

?>

<h2>Manutenção de alunos</h2>

<hr>

<h2>Novo aluno</h2>

<form action="inserirAluno.php" method="POST">
    <input type="text" name="inputNomeAluno" id="inputNomeAluno" placeholder="Digite o nome do aluno"/>Nome do aluno<br><br>

    <input type="submit" value="Cadastrar Aluno">
</form>
<hr>

<a href="filtrarAluno.php">Buscar Aluno</a>


<table border=1>
    <tr>
        <td>Id</td>
        <td>Nome Aluno</td>
    </tr>
    <?php foreach ($aluno as $registro => $aluno) {?>

    <tr>
        <td><?php echo $aluno["idAluno"]; ?></td>
        <td><?php echo $aluno["nomeAluno"]?></td>
    
    <td>
    <a href="excluirAluno.php?idAluno=<?php echo $aluno['idAluno']; ?>">Excluir</a>

    <a href="formEditarAluno.php?idAluno=<?php echo $aluno["idAluno"]; ?>">Editar</a>
    </td>
    </tr>  

    <?php } ?>

</table>

<?php
    }else{
    ?>
    echo "<script>alert('Acesse a página de Login!!!'); location.href='../../login.php';</script>";
 <?php
}
 ?>
