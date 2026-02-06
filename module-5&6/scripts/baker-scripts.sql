CREATE USER IF NOT EXISTS 'student1'@'host' IDENTIFIED BY 'pass';

GRANT ALL PRIVILEGES ON zac_movies_data.* TO 'student1'@'host';
FLUSH PRIVILEGES;


CREATE TABLE zac_movies_data(
	movie_id	INT 	PRIMARY KEY		AUTO_INCREMENT,
    movie_name	VARCHAR(75),
    movie_director		VARCHAR(75),
    movie_genre			VARCHAR(50),
    movie_year		INT,
    movie_rating	FLOAT
);

INSERT INTO zac_movies_data(
	movie_name,
    movie_director,
    movie_genre,
    movie_year,
    movie_rating
)
VALUES
	("The Shawshank Redemption", "Frank Darabont", "Drama", 1994, 9.3),
    ("The Godfather", "Francis Ford Coppola", "Crime", 1972, 9.2),
    ("The Dark Knight", "Christopher Nolan", "Action", 2008, 9.0),
    ("Pulp Fiction", "Quentin Tarantino", "Crime", 1994, 8.9),
    ("Forrest Gump", "Robert Zemeckis", "Drama", 1994, 8.8),
    
    ("Inception", "Christopher Nolan", "Sci-Fi", 2010, 8.8),
    ("Fight Club", "David Fincher", "Drama", 1999, 8.8),
    ("The Matrix", "The Wachowskis", "Sci-Fi", 1999, 8.7),
    ("Goodfellas", "Martin Scorsese", "Crime", 1990, 8.7),
    ("Interstellar", "Christopher Nolan", "Sci-Fi", 2014, 8.7);