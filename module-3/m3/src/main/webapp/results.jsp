<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    String firstName = request.getParameter("first-name");
    String lastName = request.getParameter("last-name");
    String meal = request.getParameter("meal");
    String mealRating = request.getParameter("meal-rating");
    String service = request.getParameter("service");
    String serviceRating = request.getParameter("service-rating");
    String recommend = request.getParameter("recommend");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>CSD-430: Server Side Development</title>
        <link rel="stylesheet" href="style.css" type="text/css">
    </head>
    <body>
        <h1>Zac Baker - Module 3 Assignment</h1>
        <h2>Feedback Submitted</h2>

        <table>
            <tbody>
                <tr>
                    <td>First Name:</td>
                    <td><%= firstName %></td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><%= lastName %></td>
                </tr>
                <tr>
                    <td>Meal:</td>
                    <td><%= meal %></td>
                </tr>
                <tr>
                    <td>Meal Rating:</td>
                    <td><%= mealRating %></td>
                </tr>
                <tr>
                    <td>Service:</td>
                    <td><%= service %></td>
                </tr>
                <tr>
                    <td>Service Rating:</td>
                    <td><%= serviceRating %></td>
                </tr>
                <tr>
                    <td>Would You Recommend:</td>
                    <td><%= recommend %></td>
                </tr>
            </tbody>
        </table>
        <div class="form-buttons">
            <a href="index.jsp"><button type="button" id="new-feedback">Return to Form</button></a>
        </div>
    </body>
</html>