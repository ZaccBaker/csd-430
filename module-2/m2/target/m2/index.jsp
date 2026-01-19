<%@ page import="java.util.Map,java.util.HashMap" %>
<%!
    Map<String, String[]> movies = new HashMap<String, String[]>();
    {
        movies.put("The Shawshank Redemption", new String[]{"Frank Darabont", "1994", "Drama"});
        movies.put("The Godfather", new String[]{"Francis Ford Coppola", "1972", "Crime"});
        movies.put("The Dark Knight", new String[]{"Christopher Nolan", "2008", "Action"});
        movies.put("Pulp Fiction", new String[]{"Quentin Tarantino", "1994", "Crime"});
        movies.put("Forrest Gump", new String[]{"Robert Zemeckis", "1994", "Drama"});
    }
%>

<!DOCTYPE html>
<html>
    
    <head>
        <title>CSD-420: Server Side Development</title>
        <link rel="stylesheet" href="style.css" type="text/css">
    </head>
    <body>
        <h1>Zac Baker - Module 2 Assignment</h1>

        <h3>Movies</h3>
        <table>
            <tr>
                <th>Book Title</th>
                <th>Director</th>
                <th>Year</th>
                <th>Genre</th>
            </tr>
            <% for (Map.Entry<String, String[]> entry : movies.entrySet()) { %>
                <tr>
                    <td><%= entry.getKey() %></td>
                    <td><%= entry.getValue()[0] %></td>
                    <td><%= entry.getValue()[1] %></td>
                    <td><%= entry.getValue()[2] %></td>
                </tr>
            <% } %>
        </table>
    </body>
</html>
