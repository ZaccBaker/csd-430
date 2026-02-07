package m56;

import java.sql.*;
import java.util.*;

public class MovieDao {
    private static final String URL = "jdbc:mysql://localhost:3306/CSD430";
    private static final String USER = "student1";
    private static final String PASS = "pass";

    public List<MovieBean> getAllMovies() throws Exception{
        List<MovieBean> movies = new ArrayList<>();

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(URL, USER, PASS);

        String query = "SELECT * FROM zac_movies_data";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

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
    }

    public MovieBean getMovieByName(String name) throws Exception{
        MovieBean movie = null;

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(URL, USER, PASS);
        
        String query = "SELECT * FROM zac_movies_data WHERE movie_name=?";
        PreparedStatement ps = con.prepareStatement(query);
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
    }

}
