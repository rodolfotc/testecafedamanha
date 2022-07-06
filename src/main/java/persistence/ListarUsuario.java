package persistence;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ListarUsuario {
	//Lista completa
	public List<Usuario> listar() {
		// TODO Auto-generated method stub
		
		
		
				// Criar EntityManagerFactory
				EntityManagerFactory emf = Persistence.createEntityManagerFactory("minha-persistence-unit");

				// Criar EntityManager
				EntityManager em = emf.createEntityManager();
				        
				// Fazer consulta ao banco
				List<Usuario> lista =  em.createQuery("FROM Usuario", Usuario.class).getResultList();
				
				        
				// Fechar EntityManager e EntityManagerFactory
				em.close();
				emf.close();
		
				return lista;
				
				
	}
	
	//Busca por id
	
	public Usuario listaIndividual(Usuario usuario) {

				// Criar EntityManagerFactory
				EntityManagerFactory emf = Persistence.createEntityManagerFactory("minha-persistence-unit");

				// Criar EntityManager
				EntityManager em = emf.createEntityManager();
				        
				// Fazer consulta ao banco
				
				Usuario usuarioretorno = em.find(Usuario.class, usuario.getId());				
				        
				// Fechar EntityManager e EntityManagerFactory
				em.close();
				emf.close();
		
				return usuarioretorno;
							
	}
	


}
