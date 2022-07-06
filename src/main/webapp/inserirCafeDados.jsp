<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="persistence.Usuario"%>
<%@ page import="persistence.EditarUsuario"%>
<%@ page import="persistence.UsuarioDAO"%>
<%@ page import="persistence.CafeDaManha"%>
<%@ page import="persistence.InserirUsuario"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/maven-tutorial/css/bootstrap.min.css" media="screen" />
<meta charset="ISO-8859-1">
<title>Inserir Dados</title>
</head>
<body>

	<div class="alert alert-primary text-center text-xxl-center">
		<%
		
		
		String usuario = (String) session.getAttribute("usuario");
		if (usuario != null) {
			out.print(" <h3>Usuário: " + usuario + "</h3>");
		} else {
			String redirectURL = "autenticar.jsp";
			response.sendRedirect(redirectURL);
		}
		%>


		<%
		try {

			Usuario usr = new Usuario();
		    //Cria uma usuario.
			long id = Long.parseLong(request.getParameter("id"));
			usr.setId(id);
		    //usr.setNome("Rafaela www");
		    //usr.setSenha("12345");
		    //usr.setEmail("rafaela@gmail.com");
		    //usr.setCpf("11122233355");


			//setando café da manhã
			CafeDaManha cafedamanha1 = new CafeDaManha();
			cafedamanha1.setDescricao("Pão com queijo w");

			CafeDaManha cafedamanha2 = new CafeDaManha();
			cafedamanha2.setDescricao("Pão com Alho w");

			CafeDaManha cafedamanha3 = new CafeDaManha();
			cafedamanha3.setDescricao("Mamão com banana w");

			//Cria uma lista de telefones e guarda dentro do aluno.
			List<CafeDaManha> cafedamanha = new ArrayList<CafeDaManha>();

			cafedamanha.add(cafedamanha1);
			cafedamanha.add(cafedamanha2);
			cafedamanha.add(cafedamanha3);
			
			usr.setCafedamanha(cafedamanha);

			UsuarioDAO dao = new UsuarioDAO();
			
			EditarUsuario edtuser = new EditarUsuario();
			
		    System.out.println("Salva as informações do usuario.");
		    dao.inserir(usr);
			
			
			//InserirUsuario inseriruser = new InserirUsuario();
			//inseriruser.inserir(usr);
			out.print("Usuário inserido com sucesso!");

		} catch (Exception erro) {
			out.print("Erro ao inserir!");
		}
		%>
	</div>

	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Descrição</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<tbody>
			<tr>
				<td>
					<%
					out.print(request.getParameter("descricao"));
					%>
				</td>
				<td><a href="index.jsp"><button type="button"
							class="btn btn-success">Listar</button></a></td>
			</tr>
		</tbody>
	</table>

</body>
</html>