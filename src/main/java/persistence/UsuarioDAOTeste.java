package persistence;

import java.util.ArrayList;
import java.util.List;
import persistence.Usuario;
import persistence.CafeDaManha;

public class UsuarioDAOTeste {
	public static void main(String[] args) {
    UsuarioDAO dao = new UsuarioDAO();

    //Cria uma usuario
    Usuario usuario = new Usuario();
    usuario.setNome("Rafaela");
    usuario.setSenha("12345");
    usuario.setEmail("rafaela@gmail.com");


    CafeDaManha cafedamanha1 = new CafeDaManha();
    cafedamanha1.setDescricao("Pão com queijo");
    
    CafeDaManha cafedamanha2 = new CafeDaManha();
    cafedamanha2.setDescricao("Pão com Alho");

    CafeDaManha cafedamanha3 = new CafeDaManha();
    cafedamanha3.setDescricao("Mamão com banana");
    



    //Cria uma lista de telefones e guarda dentro do aluno.
    List<CafeDaManha> cafedamanha = new ArrayList<CafeDaManha>();
    
    cafedamanha.add(cafedamanha1);
    cafedamanha.add(cafedamanha2);
    cafedamanha.add(cafedamanha3);
    
    
    usuario.setCafedamanha(cafedamanha);

    System.out.println("Salva as informações do usuario.");
    dao.inserir(usuario);


  }
}
