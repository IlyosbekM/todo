package Repository;

import entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Transactional
public class UserRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public User getUserByLogin(String login) {
        return entityManager.createQuery("SELECT u FROM User u WHERE u.login = :login", User.class)
                .setParameter("login", login)
                .getSingleResult();
    }


}
