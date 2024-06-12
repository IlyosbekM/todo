package Repository;

import entity.Todo;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

import java.util.List;

@Transactional
public class TodoRepository {

    @PersistenceContext
    static private EntityManager entityManager;

   static   public List<Todo> getAllTodos() {
        return entityManager.createQuery("SELECT t FROM Todo t", Todo.class).getResultList();
    }

    public void add(Todo todo) {
        entityManager.persist(todo);
    }

}
