<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 20.03.2023
  Time: 0:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Список пользователей</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>

    <body class="w3-light-grey">
    <div class="w3-container w3-blue-grey w3-opacity w3-right-align">
        <h1>База данных</h1>
    </div>

    <div class="w3-container w3-center w3-margin-bottom w3-padding">
        <div class="w3-card-4">
            <div class="w3-container w3-light-blue">
                <h2>Список пользователей</h2>
            </div>
                <%
                    List<String> names = (List<String>)request.getAttribute("userNames");

                    if (names != null && !names.isEmpty()) {
                        out.println("<ul class=\"w3-ul\">");
                        for (String s : names) {
                            out.println("<li class=\"w3-hover-sand\">" + s + "</li>");
                        }
                        out.println("</ul>");

                    } else out.println("<div class=\"w3-panel w3-red w3-display-container w3-card-3 w3-round\">\n"
                            +
                            "   <span onclick=\"this.parentElement.style.display='none'\"\n" +
                            "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-red w3-border w3-border-red w3-hover-border-grey\">×</span>\n" +
                            "   <h5>Нет добавленных пользователей!</h5>\n" +
                            "</div>");
                %>
        </div>
    </div>

    <div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
        <button class="w3-btn w3-round-large" onclick="location.href='/'">Назад</button>
    </div>
    </body>
</html>
