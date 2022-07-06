package persistence;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class AutenticarUsuario {
	
	public List<Usuario> autenticar(Usuario usuario) {
		// TODO Auto-generated method stub

				// Criar EntityManagerFactory
				EntityManagerFactory emf = Persistence.createEntityManagerFactory("minha-persistence-unit");

				// Criar EntityManager
				EntityManager em = emf.createEntityManager();
				

		        em.getTransaction().begin();

		        String jpql = ("select u from Usuario u where u.nome = :pNome and u.senha = :pSenha ");

		        Query query = em.createQuery(jpql);


		        query.setParameter("pNome", usuario.getNome());
		        query.setParameter("pSenha", usuario.getSenha());
		        


		        List<Usuario> lista = query.getResultList();

				        
				// Fechar EntityManager e EntityManagerFactory
				em.close();
				emf.close();
				
				return lista;
				
				
	}
	
	public List<Usuario> autenticarCpf(Usuario usuario) {
		// TODO Auto-generated method stub

				// Criar EntityManagerFactory
				EntityManagerFactory emf = Persistence.createEntityManagerFactory("minha-persistence-unit");

				// Criar EntityManager
				EntityManager em = emf.createEntityManager();
				

		        em.getTransaction().begin();

		        String jpql = ("select u from Usuario u where u.cpf = :pCpf ");

		        Query query = em.createQuery(jpql);


		        query.setParameter("pCpf", usuario.getCpf());
		        


		        List<Usuario> lista = query.getResultList();

				        
				// Fechar EntityManager e EntityManagerFactory
				em.close();
				emf.close();
				
				return lista;
				
				
	}

}
