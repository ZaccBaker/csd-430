<!DOCTYPE html>
<html>
    <head>
        <Title>Zac Baker: Module 1 Assignment</Title>
    </head>
    <body>
        <h2>Current Date</h2>
        <%
            java.util.Date currentDate = new java.util.Date();
        %>
        <p>
            <%= currentDate.toString() %>
        </p>
    </body>
</html>
