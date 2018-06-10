<%--
  Created by IntelliJ IDEA.
  User: Test
  Date: 08.06.2018
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>Старт</title>
    <style type="text/css">
        .tg td{
            font-size: 30px;
        }
    </style>
</head>
<body bgcolor="#f0f8ff">
<br/>
<br/>
<p align="center" class="tg">${attr}</p>
<h2 align="center">
    <br/>
    <br/>
<a href="<c:url value="/books" />" target="_self" class="tg">Переход на страницу со списком книг из БД</a>
</h2>
</body>
</html>
