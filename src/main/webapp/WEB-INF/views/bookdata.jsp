<%--
  Created by IntelliJ IDEA.
  User: Test
  Date: 09.06.2018
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page session="false" %>

<html>
<head>
    <title>Title</title>
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
    </style>

</head>
<body bgcolor="#f0f8ff">


    <a href="/books" target="_self" >Вернуться на страницу со списком книг</a>

<br/>
<br/><br/>
<br/>
<table class="tg" align="center">
    <tr>
        <th width="80">ID</th>
        <th width="120">Название</th>
        <th width="120">Описание</th>
        <th width="120">Автор</th>
        <th width="100">ISBN</th>
        <th width="100">Год выпуска</th>



    </tr>

    <tr>
        <td>${book.id}</td>
        <td>${book.title}</td>
        <td>${book.description}</td>
        <td>${book.author}</td>
        <td>${book.isbn}</td>
        <td>${book.printYear}</td>



    </tr>


</table>

</body>
</html>
