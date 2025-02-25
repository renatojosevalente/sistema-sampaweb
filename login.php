<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Conecte-se ao SampaWeb</title>

    <style>
        body {
            font-family: 'Helvetica', 'Arial', sans-serif;
            text-align: center;
            margin-top: 100px;
            background-color: #f8f9fa;
            color: #333;
        }
        .btn-login {
            display: inline-block;
            padding: 12px 24px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-login:hover {
            background-color: #0056b3;
        }
        img {
            max-width: 400px;
            margin-bottom: 30px;
            border-radius: 10px;
        }
        .form-control {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            text-align: left;
        }
        .login-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            max-width: 400px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h1 {
            color: #444;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <img src="imagens/sampaweb_logo.png" alt="Logo de Login">
        <h1>Conecte-se<span style="display:block; font-size: 18px; color: #555;"><br>Faça o login</span></h1>

        <form action="validarLogin.php" method="POST">
            <div>
                <label for="email">Email</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Digite seu email">
            </div>
            <div>
                <label for="senha">Senha</label>
                <input type="password" class="form-control" name="senha" id="senha" placeholder="Digite sua senha">
            </div>
            <br>
            <div>
                <button type="submit" class="btn-login">Entrar</button>
            </div>
        </form>
    </div>
</body>
</html>
