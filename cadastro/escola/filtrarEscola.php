<?php
    session_start();
    if(isset($_SESSION['email'])){

?>

<?php

require_once '../conexao/ConexaoPDO.php';

?>

<h2>Buscar Escola</h2>

<hr>

<h2>Escola</h2>

<form action="" method="POST">
    <label>Digite o nome da escola desejada</label>
    <input type="text" name="inputNomeEscola" id="inputNomeEscola" placeholder="Digite aqui"/>Digite<br>

    <input type="submit" value="Buscar Escola"/>

</form>

<hr>

<?php 

$escola="";
if(isset($_POST['inputNomeEscola'])){
    $escola = $_POST['inputNomeEscola'];
}
$conexao = ConexaoPDO::getInstance();
$query = "SELECT * FROM escola WHERE nomeEscola LIKE :valor";
$stmt = $conexao->prepare($query);
$stmt->bindValue("valor","%".$escola."%",PDO::PARAM_STR);
$stmt->execute();
$escola = $stmt->fetchAll();

?>

<table>
    <tr>
        <td>Id</td>
        <td>Escola</td>
    </tr>

    <?php foreach ($escola as $registro => $escola) { ?>
<tr>
    <td><?php echo $escola["idEscola"];?></td>
    <td><?php echo $escola["nomeEscola"]?></td>

    <td>
    <a href="excluirEscola.php?idEscola=<?php echo $escola["idEscola"];?>">Excluir</a>

    <a href="formEditarEscola.php?idEscola=<?php echo $escola["idEscola"]; ?>">Editar</a>
    
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