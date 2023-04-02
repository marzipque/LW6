<%@ page import="app.entities.User" %><%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 20.03.2023
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>База данных</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body class="w3-light-gray">
        <div class="w3-container w3-blue-grey w3-opacity w3-right-align">
            <h1>База данных</h1>
        </div>
        <%
            User user = (User) request.getAttribute("findedUser");
            if (user != null) {
                out.println("<div class=\"w3-panel w3-green w3-display-container w3-card-4 w3-round\">\n" +
                        "   <span onclick=\"this.parentElement.style.display='none'\"\n" +
                        "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-green w3-border w3-border-green w3-hover-border-grey\">×</span>\n" +
                        "   <h5>Запись найдена!\n\n'" + String.format("Id: %d\nЗначение: %s", user.getId(), user.getName()) + "'</h5>\n" +
                        "</div>");
            }
        %>
        <div class="w3-container w3-padding">
            <div class="w3-card-4">
                <div class="w3-container w3-center w3-purple">
                    <h2>Поиск и замена</h2>
                </div>
                <form method="post" class="w3-selection w3-light-grey w3-padding">
                    ID или Имя пользователя:
                    <input type="text" name="id" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 20%"/><br>
                    <input type="submit" name="btnSearch" value="Найти" style="width: 100px"
                               class="w3-btn w3-purple w3-round-large w3-margin-bottom"/><br>
                    Заменить на:
                    <input type="text" name="newValue" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 20%"><br>
                    <input type="submit" name="btnReplace" value="Заменить" style="width: 100px"
                            class="w3-btn w3-purple w3-round-large w3-margin-bottom"/>
                </form>
            </div>
        </div>
        <div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
            <button class="w3-btn w3-round-large" onclick="location.href='/'">Назад</button>
        </div>
    </body>
</html>
h