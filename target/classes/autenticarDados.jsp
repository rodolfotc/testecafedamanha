<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="persistence.Usuario" %> 
<%@ page import="persistence.AutenticarUsuario" %>   
<%@ page import="java.util.List" %>  
<%@ page import="java.util.ArrayList" %>  
<%@ page import="java.util.*" %>     
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/maven-tutorial/css/bootstrap.min.css" media="screen" />
<meta charset="ISO-8859-1">
<title>Autenticar Dados</title>
</head>
<body>

<div class="alert alert-primary text-center text-xxl-center">
Autenticar
</div>

<%
	try { 
		
		Usuario usr = new Usuario();
		usr.setNome(request.getParameter("nome"));
		usr.setSenha(request.getParameter("senha"));
		
		AutenticarUsuario autenticarusr = new AutenticarUsuario();
		autenticarusr.autenticar(usr);
		
        List<Usuario> lista = autenticarusr.autenticar(usr);
        
        int $count;
        $count=0;
		for (Usuario objeto : lista) {
			$count++;
			//out.print("<h3>" +objeto.getNome() +"</h3>");	

		}

        if ($count > 0){
        	//session
			session.setAttribute("usuario", request.getParameter("nome"));
        	
	        String redirectURL = "index.jsp";
	        response.sendRedirect(redirectURL);
        } else {
	        String redirectURL = "autenticarErro.jsp";
	        response.sendRedirect(redirectURL);
        }
        
        

	
	} catch(Exception erro){
		out.print("Erro ao inserir!"+erro);
	}
%>




</body>
</html>