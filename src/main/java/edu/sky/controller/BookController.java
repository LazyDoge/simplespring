package edu.sky.controller;


import edu.sky.model.Book;
import edu.sky.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class BookController {

    private BookService bookService;

    @Autowired
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }


//    @RequestMapping(value = "books", method = RequestMethod.GET)
//    public String listBooks(Model model) {
//        model.addAttribute("book", new Book());
//        model.addAttribute("listBooks", bookService.getListOfBooks());
//
//        return "books";
//    }

    @RequestMapping(value = "/books", method = RequestMethod.GET)
    public ModelAndView listBooks(@RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("books");
        modelAndView.addObject("book", new Book());
        List<Book> bookList = bookService.getListOfBooks();
        PagedListHolder<Book> pagedListHolder = new PagedListHolder<Book>(bookList);
        pagedListHolder.setPageSize(10);
        int pageCount = pagedListHolder.getPageCount();
        modelAndView.addObject("numberOfPages", pageCount);

        if (page == null || page < 1 || page > pageCount) {
            page = 1;
        }
        modelAndView.addObject("page", page);
        if (page > pageCount) {
            pagedListHolder.setPage(page);
            modelAndView.addObject("listBooks", pagedListHolder.getPageList());
        } else if (page <= pageCount) {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("listBooks", pagedListHolder.getPageList());

        }

        return modelAndView;

    }


    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book) {
        if (book.getId() == 0) {
            bookService.addBook(book);
        } else {
            bookService.updateBook(book);
        }

        return "redirect:/books";
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        bookService.removeBook(id);
        return "redirect:/books";
    }

    @RequestMapping("edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model) {
        Book book = bookService.getBookById(id);
        book.setReadAlready(false);
        model.addAttribute("book", book);
        model.addAttribute("listBooks", bookService.getListOfBooks());

        return "/books";
    }






    @RequestMapping(value = "/bookdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model) {
        Book book = bookService.getBookById(id);
        book.setReadAlready(true);
        bookService.updateBook(book);
        model.addAttribute("book", book);



        return "bookdata";
    }


    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchBook(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        String bookTitle = request.getParameter("bookTitle");

        Book book = bookService.findBookByTitle(bookTitle);
        if (book != null) {
            book.setReadAlready(true);
            bookService.updateBook(book);
            model.addAttribute("book", book);
            return "bookdata";
        } else {

            redirectAttributes.addFlashAttribute("noResult", "Нет такой книги");
            return "redirect:books";
        }
    }
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String openIndex() {
        return "index";
    }





}
