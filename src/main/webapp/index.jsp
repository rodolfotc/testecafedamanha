<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="persistence.Usuario" %> 
<%@ page import="persistence.ListarUsuario" %>   
<%@ page import="java.util.List" %>  
<%@ page import="java.util.ArrayList" %>  
<%@ page import="java.util.*" %>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/maven-tutorial/css/bootstrap.min.css" media="screen" />
<meta charset="ISO-8859-1">
<title>Usuário</title>
</head>
<body>

<div class="alert alert-primary text-center text-xxl-center">
<%		
   String usuario = (String) session.getAttribute("usuario");
	if (usuario != null){
		out.print("<h3>Usuário: " +usuario +"</h3>");
	} else {
        String redirectURL = "autenticar.jsp";
        response.sendRedirect(redirectURL);
	}
%>



</div>
<a href="autenticar.jsp">
<button type="button" class="btn btn-info">Logout</button>
</a>



<table class="table table-striped table-hover">
  <thead>
    <tr>
      <th>ID</th>
      <th>Nome</th>
      <th>Cpf</th>
      <th>E-mail</th>
      <th>Senha</th>
      <th>Editar</th>
      <th>Cafe da Manha</th>
      <th>Remover</th>
    </tr>
  </thead>
  <tbody>





<% 
	try { 
		

		ListarUsuario listuser = new ListarUsuario();	
        listuser.listar();
        List<Usuario> lista = listuser.listar();
        
		
		for (Usuario objeto : lista) {
			
			out.print("<tr>");
			        out.print("<td>" +objeto.getId() +"</td>");
			        out.print("<td>" +objeto.getNome() +"</td>");
			        out.print("<td>" +objeto.getCpf() +"</td>");
			        out.print("<td>" +objeto.getEmail() +"</td>");
			        out.print("<td>" +objeto.getSenha() +"</td>");
			        out.print("<td><a href='editar.jsp?id="+objeto.getId()+"&nome="+objeto.getNome()+"&cpf="+objeto.getCpf()+"&email="+objeto.getEmail()+"&senha="+objeto.getSenha()+"'><button type='button' class='btn btn-primary'>Update</button></td></a>");
			        out.print("<td><a href='listarCafe.jsp?id="+objeto.getId()+"'><button type='button' class='btn btn-success'>Cafe Da Manha</button></a></td>");
			        out.print("<td><a href='removerDados.jsp?id="+objeto.getId()+"'><button type='button' class='btn btn-danger'>X</button></a></td>");		        
			out.print("</tr>");
			


		}
		
		
		
	} catch(Exception erro){
		
	}

%>
  </tbody>
</table>

<a href="inserir.jsp">
<button type="button" class="btn btn-success">Inserir</button>
</a>


</body>
</html>