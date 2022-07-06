<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/maven-tutorial/css/bootstrap.min.css" media="screen" />
<meta charset="ISO-8859-1">
<title>Inserir</title>
</head>
<body>

<div class="alert alert-primary text-center text-xxl-center">
INSERIR
<%		
   String usuario = (String) session.getAttribute("usuario");
	if (usuario != null){
		out.print(" <h3>Usuário: " +usuario +"</h3>");
	} else {
        String redirectURL = "autenticar.jsp";
        response.sendRedirect(redirectURL);
	}
%>
</div>

<div class="text-opacity-25 mt-5">

<form action="inserirCafeDados.jsp" method="post" style="max-width:400px;margin:auto;">
  <div class="mb-3">
    <label for="nome" class="form-label">Descrição</label>
    <input type="text" class="form-control" name="descricao" id="descricao">
  </div>
  <button type="submit" class="btn btn-primary">Salvar</button>
</form>


</div>

</body>
</html>