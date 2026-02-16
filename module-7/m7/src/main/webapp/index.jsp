<%@ page import="m7.*, java.util.*" %>
<%
    MovieDao dao = new MovieDao();

    List<MovieBean> movies = dao.getAllMovies();

    String selected = request.getParameter("movieList");
    MovieBean selectedMovie = null;

    if (selected != null){
        selectedMovie = dao.getMovieByName(selected);
    }

    String action = request.getParameter("action");
    MovieBean newMovie = null;

    if ("add".equals(action)) {
        newMovie = new MovieBean(
            request.getParameter("movie-name"),
            request.getParameter("movie-director"),
            Integer.parseInt(request.getParameter("movie-year")),
            request.getParameter("movie-genre"),
            Float.parseFloat(request.getParameter("movie-rating"))
        );

        dao.addMovie(newMovie);
        response.sendRedirect(request.getRequestURI());
        return;
    }
%>

<!DOCTYPE html>
<html>
    
    <head>
        <title>CSD-430: Server Side Development</title>
        <link rel="stylesheet" href="style.css" type="text/css">
    </head>
    <body>
        <h1>Zac Baker - Module 7 Assignment Project Part 2</h1>

        <h3>Select Movie</h3>
        <form class="form-select">
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

        <h3>Enter Movie</h3>
        <h3>Test</h3>
        
        <form method="post" action="index.jsp">
            <table>
                <tbody>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="movie-name" placeholder="Movie Name" size="50" required></td>
                    </tr>
                    <tr>
                        <td>Director</td>
                        <td><input type="text" name="movie-director" placeholder="Movie Director" size="50" required></td>
                    </tr>
                    <tr>
                        <td>Genre</td>
                        <td><input type="text" name="movie-genre" placeholder="Movie Genre" size="50" required></td>
                    </tr>
                    <tr>
                        <td>Year</td>
                        <td><input type="text" name="movie-year" placeholder="Movie Year" size="50" required></td>
                    </tr>
                    <tr>
                        <td>Rating</td>
                        <td><input type="text" name="movie-rating" placeholder="Movie Rating" size="50" required></td>
                    </tr>
                </tbody>
            </table>

            <div class="form-buttons">
                <button type="submit" name="action" value="add">Submit</button>
                <button type="reset" id="clear">Clear</button>
            </div>
        </form>

        <h4>Ratings are from IMDB</h4>
    </body>
</html>