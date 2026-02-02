<%@ page import="m4.MovieBean" %>
<%
    MovieBean[] mb_all = new MovieBean[]{
        new MovieBean("The Shawshank Redemption", "Frank Darabont", 1994, "Drama"),
        new MovieBean("The Godfather", "Francis Ford Coppola", 1972, "Crime"),
        new MovieBean("The Dark Knight", "Christopher Nolan", 2008, "Action"),
        new MovieBean("Pulp Fiction", "Quentin Tarantino", 1994, "Crime"),
        new MovieBean("Forest Gump", "Robert Zemeckis", 1994, "Drama"),
    };
%>

<!DOCTYPE html>
<html>
    
    <head>
        <title>CSD-420: Server Side Development</title>
        <link rel="stylesheet" href="style.css" type="text/css">
    </head>
    <body>
        <h1>Zac Baker - Module 3 Assignment</h1>

        <h3>Movies</h3>
        <table>
            <tr>
                <th>Book Title</th>
                <th>Director</th>
                <th>Year</th>
                <th>Genre</th>
            </tr>
            <% for (MovieBean movie : mb_all) { %>
                <tr>
                    <td><%= movie.getMovieTitle() %></td>
                    <td><%= movie.getDirector() %></td>
                    <td><%= movie.getYear() %></td>
                    <td><%= movie.getGenre() %></td>
                </tr>
            <% } %>
        </table>
    </body>
</html>
