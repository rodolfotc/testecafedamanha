package persistence;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import persistence.Usuario;

/**
 * Classe DAO para manipular as informações do usuario no banco de dados.
 */
public class UsuarioDAO {
	public void inserir(Usuario usuario) {
		// TODO Auto-generated method stub
		
		
		
				// Criar EntityManagerFactory
				EntityManagerFactory emf = Persistence.createEntityManagerFactory("minha-persistence-unit");

				// Criar EntityManager
				EntityManager em = emf.createEntityManager();

				
				// Persistir objeto no banco
				em.getTransaction().begin();
				em.persist(usuario);
				em.getTransaction().commit();
				        
				// Fechar EntityManager e EntityManagerFactory
				em.close();
				emf.close();
	}


}
