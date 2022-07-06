<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="persistence.Usuario" %> 
<%@ page import="persistence.InserirUsuario" %>      
<%@ page import="persistence.EditarUsuario" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/maven-tutorial/css/bootstrap.min.css" media="screen" />
<meta charset="ISO-8859-1">
<title>Editar Dados</title>
</head>
<body>

<div class="alert alert-primary text-center text-xxl-center">
<%		
   String usuario = (String) session.getAttribute("usuario");
	if (usuario != null){
		out.print(" <h3>Usuário: " +usuario +"</h3>");
	} else {
        String redirectURL = "autenticar.jsp";
        response.sendRedirect(redirectURL);
	}
%>


<%
	try { 
		
		
		Usuario usr = new Usuario();
		usr.setNome(request.getParameter("nome"));
		usr.setCpf(request.getParameter("cpf"));
		usr.setEmail(request.getParameter("email"));
		usr.setSenha(request.getParameter("senha"));


		
		if (request.getParameter("id") != null){
			long id = Integer.parseInt(request.getParameter("id"));
			usr.setId(id);
		}
		
		
		
		InserirUsuario inseriruser = new InserirUsuario();
		EditarUsuario edtuser = new EditarUsuario();
		
		if (usr.getId() == null){
			inseriruser.inserir(usr);
			out.print("Usuário inserido com sucesso!");
		} else {
			edtuser.editar(usr);
			out.print("Usuário editado com sucesso!");
		}
		
		
		
		
		
	} catch(Exception erro){
		out.print("Erro ao inserir!");
	}
%>
</div>

<table class="table table-striped table-hover">
  <thead>
    <tr>
      <th>Nome</th>
      <th>E-mail</th>
      <th>Senha</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tbody>
    	<tr>
    	<td><% out.print(request.getParameter("nome")); %></td>
    	<td><% out.print(request.getParameter("email")); %></td>
    	<td><% out.print(request.getParameter("senha")); %></td>
    	<td><a href="index.jsp"><button type="button" class="btn btn-success">Listar</button></a></td>
    	</tr>
    </tbody>
</table>

</body>
</html>