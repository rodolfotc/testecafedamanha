<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="persistence.Usuario" %> 
<%@ page import="persistence.RemoverUsuario" %>        
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/maven-tutorial/css/bootstrap.min.css" media="screen" />
<meta charset="ISO-8859-1">
<title>Remover Dados</title>
</head>
<body>

<div class="alert alert-danger text-center text-xxl-center">

<%
	try { 
		
		
		Usuario usr = new Usuario();

		if (request.getParameter("id") != null){
			long id = Integer.parseInt(request.getParameter("id"));
			usr.setId(id);
		}
		
		
		
		RemoverUsuario removerruser = new RemoverUsuario();

		
		if (usr.getId() == null){
			out.print("ID não informado"); 
		} else {
			removerruser.remover(usr);
			out.print("Usuário removido com Sucesso!"); 
		}
		
		
		
	} catch(Exception erro){
		out.print("Erro ao inserir!");
	}
%>

</div>

<table class="table table-striped table-hover">
  <thead>
    <tr>
      <th>Código:</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tbody>
    	<tr>
    	<td><% out.print(request.getParameter("id")); %></td>
    	<td><a href="index.jsp"><button type="button" class="btn btn-success">Listar</button></a></td>
    	</tr>
    </tbody>
</table>


</body>
</html>