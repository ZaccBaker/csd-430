<%@ page import="m56.*, java.util.*" %>
<%
    MovieDao dao = new MovieDao();

    List<MovieBean> movies = dao.getAllMovies();

    String selected = request.getParameter("movieList");
    MovieBean selectedMovie = null;

    if (selected != null){
        selectedMovie = dao.getMovieByName(selected);
    }
%>

<!DOCTYPE html>
<html>
    
    <head>
        <title>CSD-430: Server Side Development</title>
        <link rel="stylesheet" href="style.css" type="text/css">
    </head>
    <body>
        <h1>Zac Baker - Module 5 & 6 Assignment Project Part 1</h1>

        <h3>Select Movie<h3>
        <form>
            <select name="movieList" id="movieList">
                <% for(MovieBean movie : movies){ %>
                    <option value="<%= movie.getMovieTitle() %>">
                        <%= movie.getMovieTitle() %>
                    </option>
                <% } %>
            </select>
            <input type="submit" value="Show Movie">
        </form>
        

        <h3>Movies</h3>
        <table>
            <tr>
                <th>Book Title</th>
                <th>Director</th>
                <th>Year</th>
                <th>Genre</th>
                <th>Rating</th>
            </tr>
            <% if (selectedMovie != null) { %>
                <tr>
                    <td><%= selectedMovie.getMovieTitle() %></td>
                    <td><%= selectedMovie.getDirector() %></td>
                    <td><%= selectedMovie.getYear() %></td>
                    <td><%= selectedMovie.getGenre() %></td>
                    <td><%= selectedMovie.getRating() %></td>
                </tr>
            <% } %>
        </table>
        <h3>Ratings are from IMDB</h3>
    </body>
</html>