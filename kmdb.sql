-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS roles_membership;


-- Create new tables, according to your domain model
CREATE TABLE movies(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    year_released TEXT,
    rating TEXT,
    director_id INTEGER,
    movie_id INTEGER
);

CREATE TABLE directors(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname TEXT,
    directmovie_id INTEGER
);

CREATE TABLE actors(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname TEXT,
    movie_id INTEGER,
    director_id INTEGER
);

CREATE TABLE roles(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname TEXT;
    role_id INTEGER
);

CREATE TABLE roles_membership(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    movie_id INTEGER,
    role_id INTEGER
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary

INSERT INTO movies(
    title,
    year_released,
    rating,
    director_id,
    movie_id
)
VALUES (
    "Batman Begins",
    2005,
    "PG-13",
    1,
    1
),
 (
    "The Dark Knight",
    2008,
    "PG-13",
    1,
    2
),
 (
    "The Dark Knight Rises",
    2012,
    "PG-13",
    1,
    3
);

INSERT INTO directors(
    fullname,
    directmovie_id
)
VALUES (
    "Christopher Nolan",
    1
),
(
    "Christopher Nolan",
    2
),
(
    "Christopher Nolan",
    3
);

INSERT INTO  actors(
    fullname,
    movie_id,
    director_id
)
VALUES (
    "Christian Bale",
    1,
    1
),
(
    "Michael Caine",
    1,
    1
),
(
    "Liam Neeson",
    1,
    1
),
(
    "Katie Holmes",
    1,
    1
),
(
    "Gary Oldman",
    1,
    1
),
(
    "Christian Bale",
    2,
    1
),
(
    "Heath Ledger",
    2,
    1
),
(
    "Aaron Eckhart",
    2,
    1
),
(
    "Michael Caine",
    2,
    1
),
(
    "Maggie Gyllenhaal",
    2,
    1
),
(
    "Christian Bale",
    3,
    1
),
(
    "Gary Oldman",
    3,
    1
),
(
    "Tom Hardy",
    3,
    1
),
(
    "Joseph Gordon-Levitt",
    3,
    1
),
(
    "Anne Hathaway",
    3,
    1
);

INSERT INTO  roles(
    fullname,
    role_id
)
VALUES (
    "Bruce Wayne",
    1
),
(
    "Alfred",
    2
),
(
    "Ra's Al Ghul",
    3
),
(
    "Rachel Dawes",
    4
),
(
    "Commissioner Gordon",
    5
),
(
    "Joker",
    6
),
(
    "Harvey Dent",
    7
),
(
    "Bane",
    8
),
(
    "John Blake",
    9
),
(
    "Selina Kyle",
    10
);

INSERT INTO roles_membership(
    movie_id,
    role_id
)
VALUES (
    1,
    1
),
(
    1,
    2
),
(
    1,
    3
),
(
    1,
    4
),
(
    1,
    5
),
(
    2,
    1
),
(
    2,
    6
),
(
    2,
    7
),
(
    2,
    2
),
(
    2,
    4
),
(
    3,
    1
),
(
    3,
    5
),
(
    3,
    8
),
(
    3,
    9
),
(
    3,
    10
);

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
SELECT movies.title, movies.year_released, movies.rating, directors.fullname
FROM movies
INNER JOIN directors ON movies.movie_id=directors.directmovie_id;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""

-- The SQL statement for the cast output
SELECT movies.title, movies.year_released, movies.rating, directors.fullname
FROM movies
INNER JOIN directors ON movies.movie_id=directors.directmovie_id;