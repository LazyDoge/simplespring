package edu.sky.dao;

import edu.sky.model.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDaoImpl implements BookDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addBook(Book book) {
        Session session = getCurrentSession();
        session.persist(book);

    }

    public void updateBook(Book book) {
        Session session = getCurrentSession();
        session.update(book);

    }

    public void removeBook(int id) {
        Session session = getCurrentSession();
        Book book = session.load(Book.class, id);
        if (book != null) {
            session.delete(book);
        }

    }

    public Book getBookById(int id) {
        return getCurrentSession().get(Book.class, id);
    }


    @SuppressWarnings("unchecked")
    public List<Book> getListOfBooks() {

        return getCurrentSession().createQuery("from Book").list();
    }

    @SuppressWarnings("unchecked")
    public Book findBookByTitle(String title) {

        List<Book> wantedBook = getCurrentSession().createQuery("from Book where TITLE = :title").setParameter("title", title).list();

        if (wantedBook.isEmpty()) {
            return null;
        } else {
            return wantedBook.get(0);
        }

    }

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

}
