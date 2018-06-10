package edu.sky.service;

import edu.sky.dao.BookDao;
import edu.sky.model.Book;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class BookServiceImpl implements BookService {

    private BookDao bookDao;


    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }


    @Transactional
    public void addBook(Book book) {
        bookDao.addBook(book);
    }

    @Transactional
    public void updateBook(Book book) {
        bookDao.updateBook(book);
    }

    @Transactional
    public void removeBook(int id) {
        bookDao.removeBook(id);
    }

    @Transactional
    public Book getBookById(int id) {
        return bookDao.getBookById(id);
    }

    @Transactional
    public List<Book> getListOfBooks() {
        return bookDao.getListOfBooks();
    }

    @Transactional
    public Book findBookByTitle(String title) {
        return bookDao.findBookByTitle(title);
    }
}
