package m4;

public class MovieBean implements java.io.Serializable {
    private String movieTitle;
    private String director;
    private int year;
    private String genre;

    public MovieBean(){}

    public MovieBean(String movieTitle, String director, int year, String genre){
        this.movieTitle = movieTitle;
        this.director = director;
        this.year = year;
        this.genre = genre;
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
}
