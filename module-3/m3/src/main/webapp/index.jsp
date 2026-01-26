<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>CSD-430: Server Side Development</title>
        <link rel="stylesheet" href="style.css" type="text/css">
    </head>
    <body>
        <h1>Zac Baker - Module 3 Assignment</h1>
        <h2>Meal & Service Feedback</h2>
        <form action="results.jsp" method="post">
            <table>
                <tbody>
                    <tr>
                        <td>First Name:</td>
                        <td><input type="text" name="first-name" placeholder="First Name" size="50"></td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td><input type="text" name="last-name" placeholder="Last Name" size="50"></td>
                    </tr>
                    <tr>
                        <td>Meal:</td>
                        <td><input type="text" name="meal" placeholder="Meal Feedback" size="100"></td>
                    </tr>
                    <tr>
                        <td>Meal Rating:</td>
                        <td><input type="text" name="meal-rating" placeholder="Meal Rating (1-10)" size="2"></td>
                    </tr>   
                    <tr>
                        <td>Service:</td>
                        <td><input type="text" name="service" placeholder="Service Feedback" size="100"></td>
                    </tr>
                    <tr>
                        <td>Service Rating:</td>
                        <td><input type="text" name="service-rating" placeholder="Service Rating (1-10)" size="2"></td>
                    </tr>
                    <tr>
                        <td>Would You Recommend?</td>
                        <td><input type="text" name="recommend" placeholder="Would You Recommend?" size="100"></td>
                    </tr>
                </tbody>
            </table>

            <div class="form-buttons">
                <button type="submit" id="submit">Submit</button>
                <button type="reset" id="clear">Clear</button>
            </div>
        </form>
    </body>
</html>
