<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/maven-tutorial/css/bootstrap.min.css" media="screen" />
<meta charset="ISO-8859-1">
<title>Inserir</title>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/mask.js"></script>
<!-- Funcionalidades da página -->
<script type="text/javascript">
	$(document).ready(function(){
		//alert("página carregada")
		$('#cpf').mask('000.000.000-00');
		
		 //Executa a requisição quando o campo username perder o foco
	    $('#cpf').blur(function()
	    {
	        var cpf = $('#cpf').val().replace(/[^0-9]/g, '').toString();
	        
	        if(cpf.length == 11 ){
	            
	            var v = [];

	            //Calcula o primeiro dígito de verificação.
	            v[0] = 1 * cpf[0] + 2 * cpf[1] + 3 * cpf[2];
	            v[0] += 4 * cpf[3] + 5 * cpf[4] + 6 * cpf[5];
	            v[0] += 7 * cpf[6] + 8 * cpf[7] + 9 * cpf[8];
	            v[0] = v[0] % 11;
	            v[0] = v[0] % 10;

	            //Calcula o segundo dígito de verificação.
	            v[1] = 1 * cpf[1] + 2 * cpf[2] + 3 * cpf[3];
	            v[1] += 4 * cpf[4] + 5 * cpf[5] + 6 * cpf[6];
	            v[1] += 7 * cpf[7] + 8 * cpf[8] + 9 * v[0];
	            v[1] = v[1] % 11;
	            v[1] = v[1] % 10;

		            //Retorna Verdadeiro se os dígitos de verificação são os esperados.
		                    
			            if ((v[0] != cpf[9]) || (v[1] != cpf[10])) {
			            	alert('CPF inválido ==> ' + cpf);
			            	$('#cpf').val('');
			            } else if (cpf[0] == cpf[1] && cpf[1] == cpf[2] && cpf[2] == cpf[3] && cpf[3] == cpf[4] && cpf[4] == cpf[5] && cpf[5] == cpf[6] && cpf[6] == cpf[7] && cpf[7] == cpf[8] && cpf[8] == cpf[9] && cpf[9] == cpf[10]){
			            	alert('CPF inválido ==> ' + cpf);
			            	$('#cpf').val('');
			            	
			            } else{
			          		 //alert('CPF OK ==> ' + cpf);
			            }       
	            } else {
	            	alert('CPF inválido' + cpf); 
	                $('#cpf').val('');

	                
   
	 
	            } // 11
	            
	    }); // end blur
	    
		
	});
</script>
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

<form action="inserirDados.jsp" method="post" style="max-width:400px;margin:auto;">
  <div class="mb-3">
    <label for="nome" class="form-label">Nome</label>
    <input type="text" class="form-control" name="nome" id="nome">
  </div>
  <div class="mb-3">
    <label for="nome" class="form-label">Cpf</label>
    <input type="text" class="form-control" name="cpf" id="cpf">
  </div>
  <div class="mb-3">
    <label for="email" class="form-label">E-mail</label>
    <input type="email" class="form-control" name="email" id="email">
  </div>
  <div class="mb-3">
    <label for="senha" class="form-label">Senha</label>
    <input type="password" class="form-control" name="senha" id="senha">
  </div>

  
  <button type="submit" class="btn btn-primary">Salvar</button>
</form>


</div>

</body>
</html>