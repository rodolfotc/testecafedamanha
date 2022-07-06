package persistence;

import persistence.Usuario;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class InserirUsuario {
	
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
