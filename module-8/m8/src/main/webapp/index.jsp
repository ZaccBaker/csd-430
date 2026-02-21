<%@ page import="m8.*, java.util.*" %>
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
    MovieBean oldMovie = null;

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

    if ("update".equals(action)) {
        oldMovie = new MovieBean(
            request.getParameter("movieName"),
            request.getParameter("update-director"),
            Integer.parseInt(request.getParameter("update-year")),
            request.getParameter("update-genre"),
            Float.parseFloat(request.getParameter("update-rating"))
        );

        dao.updateMovie(oldMovie);
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
        <h1>Zac Baker - Module 8 Assignment Project Part 3</h1>

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

        <h3>Movie Selected</h3>
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
        
        <% if (selectedMovie != null) { %>
            <h3>Update Movie</h3>
            <h4><%= selectedMovie.getMovieTitle() %></h4>
            <form method="post" action="index.jsp">
                <input type="hidden" name="movieName" value="<%= selectedMovie.getMovieTitle() %>">
                <tbody>
                    <table>
                        <tr>
                            <td>Type</td>
                            <td>Current Value</td>
                            <td>Updated Value</td>
                        </tr>
                        <tr>
                            <td>Director</td>
                            <td><%= selectedMovie.getDirector() %></td>
                            <td><input type="text" name="update-director" placeholder="Movie Director Update" size="50" required></td>
                        </tr>
                        <tr>
                            <td>Genre</td>
                            <td><%= selectedMovie.getGenre() %></td>
                            <td><input type="text" name="update-genre" placeholder="Movie Genre Update" size="50" required></td>
                        </tr>
                        <tr>
                            <td>Year</td>
                            <td><%= selectedMovie.getYear() %></td>
                            <td><input type="text" name="update-year" placeholder="Movie Year Update" size="50" required></td>
                        </tr>
                        <tr>
                            <td>Rating</td>
                            <td><%= selectedMovie.getRating() %></td>
                            <td><input type="text" name="update-rating" placeholder="Movie Rating Update" size="50" required></td>
                        </tr>
                    </table>
                </tbody>

                <div class="form-buttons">
                    <button type="submit" name="action" value="update">Update</button>
                    <button type="reset" id="clear">Clear</button>
                </div>
            </form>
        <% } %>

        <h3>Enter New Movie</h3>        
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