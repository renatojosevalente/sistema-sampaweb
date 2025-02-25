
<?php
    session_start();
    if(isset($_SESSION['email'])){

?>


<!DOCTYPE html>
<html lang="pt-br">

<header>
    <img src="imagens/sampaweb_logo.png" alt="Logo" class="logo">
        <h1>Editar Respostas do Aluno</h1>
    </header>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilo/estilo.css">
    <title>Escolas Municipais</title>

    <h2>Escolas Municipais</h2>
<hr>

<p><button><a href="cadastro/escola/listarEscolas.php">Manutenção de escolas</button></p>
<p><button><a href="cadastro/aluno/listarAlunos.php">Manutenção de alunos</button></p>

<div>


<div>
    <nav>
        <li>

            
                <a href="logout.php">logout</a>
            
        </li>
    </nav>
</div>
    <div>
        <div>
                <?php
                    if(isset($_SESSION['email'])){
                        echo "Olá ". $_SESSION['email'];
                    }else{
                        echo "Olá visitante";
                    }
                ?>
            </div>
        
            <div>
            <div>
                
                <h1>Página Inicial</h1>
                <p>Esta página é uma página restrita ao usuário administrador (Renato José Valente).</p>
            </div>
        </div>
        </div>
</div>
</head>
<body>
    
</body>
</html>

<?php
    }else{
    ?>
    echo "<script>alert('Acesse a página de Login!!!'); location.href='login.php';</script>";
 <?php
}
 ?>