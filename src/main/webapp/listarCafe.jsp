<%@page import="persistence.CafeDaManha"%>
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
      <th>Remover</th>
    </tr>
  </thead>
  <tbody>





<% 
	try { 
		

		ListarUsuario listuser = new ListarUsuario();	
        //listuser.listar();
        //List<Usuario> lista = listuser.listar();
        
        Usuario usuarioindividual = new Usuario();
        


        long id = Long.parseLong(request.getParameter("id"));
        usuarioindividual.setId(id);
        
        Usuario lista = listuser.listaIndividual(usuarioindividual);
        
        //out.print(lista);
		int count;
		count = 1;
			
			out.print("<tr>");
			        out.print("<td>" +lista.getId() +"</td>");
			        out.print("<td>" +lista.getNome() +"</td>");
			        out.print("<td>" +lista.getCpf() +"</td>");
			        out.print("<td>" +lista.getEmail() +"</td>");
			        out.print("<td>" +lista.getSenha() +"</td>");
			        out.print("<td></td>");	
			        //out.print("<td><a href='listarCafe.jsp?id="+lista.getId()+"'><button type='button' class='btn btn-success'>Cafe Da Manha</button></a></td>");
			        out.print("<td></td>");		        
			out.print("</tr>");
			    // for para Multi dimensional, acessando os itens do cafe da manha de casa usuário.
				for (CafeDaManha cafemanhaespecial : lista.getCafedamanha()) {
					//out.print("testando "+cafemanhaespecial.getDescricao()+" - ");
					out.print("<tr>");
					out.print("<td></td>");
					out.print("<td></td>");
					out.print("<td></td>");
					out.print("<td>Opção"+count+"</td>");
					out.print("<td>" +cafemanhaespecial.getDescricao() +"</td>");
			        out.print("<td><a href='editar.jsp?id="+lista.getId()+"&nome="+lista.getNome()+"&cpf="+lista.getCpf()+"&email="+lista.getEmail()+"&senha="+lista.getSenha()+"'><button type='button' class='btn btn-primary'>Update</button></td></a>");
			        //out.print("<td><a href='listarCafe.jsp?id="+lista.getId()+"'><button type='button' class='btn btn-success'>Cafe Da Manha</button></a></td>");
			        out.print("<td><a href='removerDados.jsp?id="+lista.getId()+"'><button type='button' class='btn btn-danger'>X</button></a></td>");	
			        
			    	out.print("</tr>");
			    	
			    	count++;
				}
			count = 1;
		
			
			out.print("<a href='inserirCafe.jsp?id="+lista.getId()+"'><button type='button' class='btn btn-success'>Inserir</button></a>");
			
		
		
	} catch(Exception erro){
		
	}

%>
  </tbody>
</table>


</body>
</html>




