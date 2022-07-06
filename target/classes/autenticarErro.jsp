<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/maven-tutorial/css/bootstrap.min.css" media="screen" />
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>


<div class="alert alert-danger text-center text-xxl-center">
LOGIN OU SENHA INCORRETO
</div>

<div class="text-opacity-25 mt-5">

<form action="autenticarDados.jsp" method="post" style="max-width:400px;margin:auto;">
  <div class="mb-3">
    <label for="nome" class="form-label">Login</label>
    <input type="text" class="form-control" name="nome" id="nome">
  </div>
  <div class="mb-3">
    <label for="senha" class="form-label">Senha</label>
    <input type="password" class="form-control" name="senha" id="senha">
  </div>

  
  <button type="submit" class="btn btn-primary">Autenticar</button>
</form>


</div>

</body>
</html>