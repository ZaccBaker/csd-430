package m8;

import java.sql.*;
import java.util.*;

public class MovieDao {
    private static final String URL = "jdbc:mysql://localhost:3306/CSD430";
    private static final String USER = "student1";
    private static final String PASS = "pass";


    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }


    public List<MovieBean> getAllMovies() throws Exception{
        List<MovieBean> movies = new ArrayList<>();
        String query = "SELECT * FROM zac_movies_data";

        try (
            Connection con = getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
        ) {
            while (rs.next()) {
                movies.add(new MovieBean(
                    rs.getString("movie_name"),
                    rs.getString("movie_director"),
                    rs.getInt("movie_year"),
                    rs.getString("movie_genre"),
                    rs.getFloat("movie_rating")
                ));
            }

            rs.close();
            st.close();
            con.close();

            return movies;

        } catch (Exception e) {
            throw new RuntimeException("Error getting all movies", e);
        }   
    }


    public MovieBean getMovieByName(String name) throws Exception{
        MovieBean movie = null;
        String query = "SELECT * FROM zac_movies_data WHERE movie_name=?";

        try (
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query); 
        ) {
            ps.setString(1, name);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                movie = new MovieBean(
                    rs.getString("movie_name"),
                    rs.getString("movie_director"),
                    rs.getInt("movie_year"),
                    rs.getString("movie_genre"),
                    rs.getFloat("movie_rating")
                );
            }

            rs.close();
            ps.close();
            con.close();

            return movie;
            
        } catch (Exception e) {
            throw new RuntimeException("Error getting movie by name", e);
        }
    }
    

    public void addMovie(MovieBean newMovie){
        String query = """
            INSERT INTO zac_movies_data (movie_name, movie_director, movie_year, movie_genre, movie_rating)
            VALUES
                (?, ?, ?, ?, ?)
        """;

        try (
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)
        ) {
            ps.setString(1, newMovie.getMovieTitle());
            ps.setString(2, newMovie.getDirector());
            ps.setInt(3, newMovie.getYear());
            ps.setString(4, newMovie.getGenre());
            ps.setDouble(5, newMovie.getRating());

            ps.executeUpdate();
            
        } catch (Exception e) {
            throw new RuntimeException("Error adding movie", e);
        }
    }


    public void updateMovie(MovieBean oldMovie){
        String query = """
            UPDATE zac_movies_data
            SET movie_director = ?, movie_year = ?, movie_genre = ?, movie_rating = ?
            WHERE movie_name = ?
        """;

        try (
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query);
        ) {
            ps.setString(1, oldMovie.getDirector());
            ps.setInt(2, oldMovie.getYear());
            ps.setString(3, oldMovie.getGenre());
            ps.setDouble(4, oldMovie.getRating());

            ps.setString(5, oldMovie.getMovieTitle());

            ps.executeUpdate();
            
        } catch (Exception e) {
            throw new RuntimeException("Error inserting movie", e);
        }
    }
}
