<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%--
  Created by IntelliJ IDEA.
  User: Test
  Date: 08.06.2018
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book List Page</title>
    <style type="text/css">
        .tg {

            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;

        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }

        ul.pagination {
            display: inline-block;
            padding: 0;
            margin: 0;
        }

        ul.pagination li {display: inline;}

        ul.pagination li a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
            margin: 0 4px;
        }

        ul.pagination li a.active {
            background-color: #333333;
            color: white;
            border: 1px solid #333333;
        }

        ul.pagination li a:hover:not(.active) {background-color: #ddd;}

        #footer {
            position: fixed;
            text-align: center;
            bottom: 2%;

        }
    </style>
</head>
<body bgcolor="#f0f8ff">
<a href="/index" target="_self" class="tg">Вернутся на стартовую страницу</a>
<br/>
<br/>


<h1 align="center">Книги в базе данных</h1>

<br/>
<br/>

<c:if test="${!empty listBooks}">
    <table class="tg" align="center">
        <tr>
            <th width="80">ID</th>
            <th width="120">Название</th>
            <th width="120">Описание</th>
            <th width="120">Автор</th>
            <th width="100">ISBN</th>
            <th width="100">Год выпуска</th>
            <th width="100">Прочитано?</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>


        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td>${book.id}</td>
                <td><a href="/bookdata/${book.id}" target="_self">${book.title}</a></td>
                <td>${book.description}</td>
                <td>${book.author}</td>
                <td>${book.isbn}</td>
                <td>${book.printYear}</td>
                <td>${book.readAlready}</td>
                <td><a href="<c:url value='/edit/${book.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>


            </tr>

        </c:forEach>

    </table>
    <br/>
    <div id="pagination" align="center">

            <%--<c:url value="/books" var="prev">--%>
            <%--<c:param name="page" value="${page-1}"/>--%>
            <%--</c:url>--%>
            <%--<c:if test="${page > 1}">--%>
            <%--<a href="<c:out value="${prev}"/>" class="pn prev">Пред</a>--%>
            <%--</c:if>--%>

        <ul class="pagination">
            <c:forEach begin="1" end="${numberOfPages}" step="1" varStatus="currentPage">
                <c:choose>
                    <c:when test="${page == currentPage.index}">
                        <li><a class="active">${currentPage.index}</a></li>
                    </c:when>
                    <c:otherwise>
                        <c:url value="/books" var="url">
                            <c:param name="page" value="${currentPage.index}"/>
                        </c:url>
                        <li><a href="<c:out value="${url}"/>">${currentPage.index}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </ul>
            <%--<c:forEach begin="1" end="${numberOfPages}" step="1" varStatus="currentPage">--%>
            <%--<c:choose>--%>
            <%--<c:when test="${page == currentPage.index}">--%>
            <%--<span>${currentPage.index}</span>--%>
            <%--</c:when>--%>
            <%--<c:otherwise>--%>
            <%--<c:url value="/books" var="url">--%>
            <%--<c:param name="page" value="${currentPage.index}"/>--%>
            <%--</c:url>--%>
            <%--<a href="<c:out value="${url}"/>">${currentPage.index}</a>--%>
            <%--</c:otherwise>--%>
            <%--</c:choose>--%>
            <%--</c:forEach>--%>
            <%--<c:url value="/books" var="next">--%>
            <%--<c:param name="page" value="${page+1}"/>--%>
            <%--</c:url>--%>
            <%--<c:if test="${page + 1 <= numberOfPages}">--%>
            <%--<a href="<c:out value="${next}"/>" class="pn next">След</a>--%>
            <%--</c:if>--%>
    </div>
</c:if>


<br/>
<br/>
<br/>

<table align="center">
    <tr>
        <td>
            <c:if test="${empty book.title}">
                <h2 align="center">Добавить книгу</h2>
            </c:if>
            <c:if test="${!empty book.title}">
                <h2 align="center">Редактир. книгу</h2>
            </c:if>
            <c:url var="addAction" value="/books/add"/>
            <form:form action="${addAction}" commandName="book">
                <table>
                    <c:if test="${!empty book.title}">
                        <tr>
                            <td>
                                <form:label path="id" cssClass="tg">
                                    <spring:message text="ID"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="id" readonly="true" size="8" disabled="true" />
                                <form:hidden path="id"/>
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <td>
                            <form:label path="title" cssClass="tg">
                                <spring:message text="Название"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="title"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="description" cssClass="tg">
                                <spring:message text="Описание"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="description" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="author" cssClass="tg">
                                <spring:message text="Автор"/>
                            </form:label>
                        </td>
                        <td>
                            <c:if test="${empty book.title}">
                                <form:input path="author"/>
                            </c:if>
                            <c:if test="${!empty book.title}">
                                <form:input path="author" readonly="true" disabled="true"/>
                                <form:hidden path="author"/>
                            </c:if>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="isbn" cssClass="tg">
                                <spring:message text="ISBN"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="isbn"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="printYear" cssClass="tg">
                                <spring:message text="Год выпуска"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="printYear" />

                        </td>
                    </tr>


                    </tr>
                    <tr>
                        <td colspan="2">
                            <c:if test="${!empty book.title}">
                                <input type="submit"
                                       value="<spring:message text="Принять" />" />
                            </c:if>
                            <c:if test="${empty book.title}">
                                <input type="submit"
                                       value="<spring:message text="Добавить"/>" />
                            </c:if>
                        </td>
                    </tr>
                </table>


            </form:form>
        </td>
        <td width="20%"></td>
        <td>
            <h2 align="center">Поиск книги по названию</h2>


            <c:url value="/search" var="searchAction"/>
            <form:form action="${searchAction}" method="POST">
                <label>
                    <input type="text" name="bookTitle"/>
                </label>
                <input type="submit" value="Найти"/> </form:form>


            <p>${noResult}</p>

        </td>

    </tr>

</table>


<p id="footer">
    Spring MVC Books CRUD. Тестовое задание для стажировки JR.
</p>




</body>
</html>
