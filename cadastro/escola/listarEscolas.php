<?php
    session_start();
    if(isset($_SESSION['email'])){

?>

<?php
require_once '../../conexao/ConexaoPDO.php';

?>

<?php

$conexao = ConexaoPDO::getInstance();
$query = "SELECT * FROM escola";
$stmt = $conexao->prepare($query);
$stmt->execute();
$escolas = $stmt->fetchAll();

?>

<h2>Manutenção de escolas</h2>

<hr>

<h2>Nova escola</h2>

<form action="inserirEscola.php" method="POST">
    <input type="text" name="inputNomeEscola" id="inputNomeEscola" placeholder="Digite aqui o nome da escola"/>Nome da Escola<br><br>

    <input type="submit" value="Cadastrar Escolas">
</form>
<hr>

<a href="filtrarEscola.php">Buscar Escola</a>

<table border=1>
    <tr>
        <td>Id</td>
        <td>Nome Escola</td>
    </tr>
    <?php foreach ($escolas as $registro => $escolas) {?>

    <tr>
        <td><?php echo $escolas["idEscola"]; ?></td>
        <td><?php echo $escolas["nomeEscola"]?></td>
    
    <td>
    <a href="excluirEscola.php?idEscola=<?php echo $escolas['idEscola']; ?>">Excluir</a>

    <a href="formEditarEscola.php?idEscola=<?php echo $escolas["idEscola"]; ?>">Editar</a>
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