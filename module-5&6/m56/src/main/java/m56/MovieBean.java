package m56;

public class MovieBean implements java.io.Serializable {
    private String movieTitle;
    private String director;
    private int year;
    private String genre;
    private float rating;

    public MovieBean(){}

    public MovieBean(String movieTitle, String director, int year, String genre, float rating){
        this.movieTitle = movieTitle;
        this.director = director;
        this.year = year;
        this.genre = genre;
        this.rating = rating;
    }

    public void setMovieTitle(String movieTitle){
        this.movieTitle = movieTitle;
    }

    public String getMovieTitle(){
        return movieTitle;
    }

    public void setDirector(String director){
        this.director = director;
    }

    public String getDirector(){
        return director;
    }

    public void setYear(int year){
        this.year = year;
    }

    public int getYear(){
        return year;
    }

    public void setGenre(String genre){
        this.genre = genre;
    }

    public String getGenre(){
        return genre;
    }

    public void setRating(float rating){
        this.rating = rating;
    }

    public float getRating(){
        return rating;
    }
}