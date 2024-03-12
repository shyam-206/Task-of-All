create table actor  (
    act_id int IDENTITY(1,1) PRIMARY key,
    act_fname varchar(50),
    act_lname varchar(50),
    act_gender varchar(10)
)

create table genre(
    gen_id int identity(1,1) primary key,
    gen_title varchar(50)
)
create table director(
    dir_id int IDENTITY(1,1) PRIMARY key,
    dir_fname varchar(50),
    dir_lname varchar(50)
)

create table movie(
    mov_id int PRIMARY key,
    mov_title varchar(50),
    mov_year int,
    mov_time int,
    mov_lang varchar(30),
    mov_dt_rel date,
    mov_release_country varchar(50)
)


create table movie_genres (
    mov_id int primary key,
    gen_id int,
    foreign key (gen_id) REFERENCES genre(gen_id),
    foreign key (mov_id) REFERENCES movie(mov_id)
)   

alter table movie_genres alter column mov_id int

create table movie_direction (
    mov_id int,
    dir_id int,
    foreign key (mov_id) references movie(mov_id),
    foreign key (dir_id) references director(dir_id)
)   

create table reviewer(
    rev_id int identity(1,1) primary key,
    rev_name varchar(50)
)

create table rating (
    mov_id int,
    rev_id int,
    rev_stars float,
    num_of_rating int,
    foreign key (mov_id) REFERENCES movie(mov_id),
    foreign key (rev_id) references reviewer(rev_id)

)

create table movie_cast(
    act_id int,
    mov_id int,
    role varchar(50),
    foreign key (act_id) REFERENCES actor(act_id),
    foreign key (mov_id) REFERENCES movie(mov_id),
)

-- insert the actor data
INSERT INTO actor (act_fname, act_lname, act_gender) 
VALUES  ('Shahrukh', 'Khan', 'Male'),
        ('Deepika', 'Padukone', 'Female'),
        ('Amitabh', 'Bachchan', 'Male'),
        ('Aishwarya', 'Rai', 'Female'),
        ('Ranbir', 'Kapoor', 'Male'),
        ('Priyanka', 'Chopra', 'Female'),
        ('Tom', 'Hanks', 'Male'),
        ('Leonardo', 'DiCaprio', 'Male'),
        ('Emma', 'Stone', 'Female'),
        ('Shahrukh', 'Khan', 'Male'),
        ('Deepika', 'Padukone', 'Female'),
        ('Prabhas', NULL, 'Male'),
        ('Christian', 'Bale', 'Male'),
        ('Aamir', 'Khan', 'Male'),
        ('Rajinikanth', NULL, 'Male'),
        ('Mohanlal', NULL, 'Male');


-- insert data into genre table 
INSERT INTO genre (gen_title) 
VALUES  ('Bollywood'),
        ('Drama'),
        ('Romance'),
        ('Action'),
        ('Comedy'),
        ('Drama'),
        ('Thriller'),
        ('Romance'),
        ('Musical');


--insert data into director table
INSERT INTO director (dir_fname, dir_lname) 
VALUES  ('Sanjay', 'Leela Bhansali'),
        ('Karan', 'Johar'),
        ('Rajkumar', 'Hirani'),
        ('Aamir', 'Khan'),
        ('Anurag', 'Kashyap'),
        ('Imtiaz', 'Ali'),
        ('Steven', 'Spielberg'),
        ('Christopher', 'Nolan'),
        ('Karan', 'Johar'),
        ('SS', 'Rajamouli'),
        ('James', 'Cameron'),
        ('Rajkumar', 'Hirani'),
        ('Sanjay', 'Leela Bhansali'),
        ('Rohit', 'Shetty'),
        ('Gautham', 'Menon'),
        ('Jeethu', 'Joseph');


-- insert data into movie table
INSERT INTO movie
VALUES  (901, '3 Idiots', 2009, 170, 'Hindi', '2009-12-25', 'India'),
        (902, 'Padmaavat', 2018, 164, 'Hindi', '2018-01-25', 'India'),
        (903, 'Dilwale Dulhania Le Jayenge', 1995, 189, 'Hindi', '1995-10-20', 'India'),
        (904, 'Lagaan', 2001, 224, 'Hindi', '2001-06-15', 'India'),
        (905, 'Gully Boy', 2019, 153, 'Hindi', '2019-02-14', 'India'),
        (906, 'Jab We Met', 2007, 138, 'Hindi', '2007-10-26', 'India'),
        (907, 'Inception', 2010, 148, 'English', '2010-07-16', 'USA'),
        (908, 'Titanic', 1997, 195, 'English', '1997-12-19', 'USA'),
        (909, 'Forrest Gump', 1994, 142, 'English', '1994-07-06', 'USA'),
        (910, 'My Name Is Khan', 2010, 165, 'Hindi', '2010-02-12', 'India'),
        (911, 'Dilwale Dulhania Le Jayenge', 1995, 189, 'Hindi', '1995-10-20', 'India'),
        (912, 'Baahubali: The Beginning', 2015, 159, 'Telugu', '2015-07-10', 'India'),
        (913, 'The Dark Knight', 2008, 152, 'English', '2008-07-18', 'USA'),
        (914, 'PK', 2014, 153, 'Hindi', '2014-12-19', 'India'),
        (915, 'Avatar', 2009, 162, 'English', '2009-12-18', 'USA'),
        (916, 'Lagaan', 2001, 224, 'Hindi', '2001-06-15', 'India'),
        (917, 'Inglourious Basterds', 2009, 153, 'English', '2009-08-21', 'USA'),
        (918, 'Petta', 2019, 171, 'Tamil', '2019-01-10', 'India'),
        (919, 'Interstellar', 2014, 169, 'English', '2014-11-07', 'USA'),
        (920, 'Drishyam', 2013, 160, 'Malayalam', '2013-12-19', 'India')

-- INSERT DATA INTO MOVIE_GENRES TABLE
INSERT INTO movie_genres (mov_id, gen_id)
VALUES  (901, 1),
        (902, 2),
        (903, 3),
        (904, 1),
        (905, 2),
        (906, 3),
        (907, 4), 
        (908, 5),
        (909, 3), 
        (910, 3), 
        (910, 5), 
        (911, 5),
        (911, 6), 
        (912, 1), 
        (912, 3), 
        (913, 1),
        (913, 4),
        (914, 2), 
        (914, 3), 
        (915, 1), 
        (915, 5),
        (916, 3), 
        (916, 5), 
        (917, 1), 
        (917, 4), 
        (918, 1), 
        (918, 3), 
        (919, 1), 
        (919, 3),
        (920, 4)

-- INSERT DATA INTO MOVIE_DIRECTION TABLE
INSERT INTO movie_direction (mov_id, dir_id)
VALUES  (901, 3),
        (902, 1),
        (903, 1),
        (904, 4),
        (905, 5),
        (906, 6),
        (907, 2), -- Inception (Christopher Nolan)
        (908, 5), -- Titanic (James Cameron)
        (909, 1), -- Forrest Gump (Steven Spielberg)
        (910, 3), -- My Name Is Khan (Karan Johar)
        (911, 4), -- Dilwale Dulhania Le Jayenge (Aditya Chopra)
        (912, 4), -- Baahubali: The Beginning (SS Rajamouli)
        (913, 2), -- The Dark Knight (Christopher Nolan)
        (914, 6), -- PK (Rajkumar Hirani)
        (915, 11), -- Avatar (James Cameron)
        (916, 12), -- Lagaan (Ashutosh Gowariker)
        (917, 11), -- Inglourious Basterds (Quentin Tarantino)
        (918, 10), -- Petta (Karthik Subbaraj)
        (919, 2), -- Interstellar (Christopher Nolan)
        (920, 13); -- Drishyam (Jeethu Joseph)


-- INSERT DATA INTO REVIWER TABLE
INSERT INTO reviewer (rev_name)
VALUES  ('Priya'),
        ('Rahul'),
        ('Anjali'),
        ('Ishaan'),
        ('Neha'),
        ('Kunal'),
        ('John Smith'),
        ('Emily Johnson'),
        ('Michael Brown'),
        ('Sarah Wilson'),
        ('David Jones');

-- INSERT DATA INTO RATING TABLE
INSERT INTO rating (mov_id, rev_id, rev_stars, num_of_rating)
VALUES  (901, 1, 4, 180),
        (902, 2, 6.5, 160),
        (903, 3, 7.5, 150),
        (904, 4, 5, 200),
        (905, 5, 6, 220),
        (906, 6, 8, 180),
        (907, 1, 4.5, 100),
        (908, 2, 8, 150),
        (909, 3, 7, 120),
        (910, 4, 5, 200),
        (911, 5, 6, 180),
        (912, 1, 9, 250),
        (913, 2, 7, 300),
        (914, 3, 8.4, 280),
        (915, 4, 4.6, 320),
        (916, 5, 4.5, 270),
        (917, 1, 7.4, 400),
        (918, 2, 5.4, 350),
        (919, 3, 6, 380),
        (920, 4, 4.5, 360)


-- INSERT DATA INTO MOVIE_CAST TABLE
INSERT INTO movie_cast (act_id, mov_id, role)
VALUES  (1, 903, 'Raj'),
        (2, 901, 'Pia'),
        (3, 902, 'Khilji'),
        (4, 904, 'Gauri'),
        (5, 905, 'Murad'),
        (6, 906, 'Geet'),
        (1, 907, 'Cobb'),
        (2, 907, 'Arthur'),
        (3, 908, 'Rose'),
        (4, 910, 'Rizvan Khan'),
        (5, 911, 'Simran'),
        (6, 912, 'Baahubali'),
        (7, 913, 'Joker'),
        (8, 914, 'PK'),
        (9, 915, 'Jake Sully'),
        (10, 916, 'Bhuvan'),
        (11, 917, 'Aldo Raine'),
        (10, 918, 'Kaali'),
        (12, 919, 'Cooper'),
        (13, 920, 'Georgekutty')



select * from actor
select * from director
select * from movie
select * from genre
select * from movie_genres
select * from movie_direction
select * from reviewer 
select * from rating
select * from movie_cast


-- Inserting sample data into the 'actor' table
INSERT INTO actor (act_fname, act_lname, act_gender) VALUES 
('Tom', 'Hanks', 'Male'),
('Leonardo', 'DiCaprio', 'Male'),
('Emma', 'Stone', 'Female'),
('Shahrukh', 'Khan', 'Male'),
('Deepika', 'Padukone', 'Female'),
('Prabhas', NULL, 'Male'),
('Christian', 'Bale', 'Male'),
('Aamir', 'Khan', 'Male'),
('Rajinikanth', NULL, 'Male'),
('Mohanlal', NULL, 'Male');

-- Inserting sample data into the 'genre' table
INSERT INTO genre (gen_title) VALUES 
('Action'),
('Comedy'),
('Drama'),
('Thriller'),
('Romance'),
('Musical');

-- Inserting sample data into the 'director' table
INSERT INTO director (dir_fname, dir_lname) VALUES 
('Steven', 'Spielberg'),
('Christopher', 'Nolan'),
('Karan', 'Johar'),
('SS', 'Rajamouli'),
('James', 'Cameron'),
('Rajkumar', 'Hirani'),
('Sanjay', 'Leela Bhansali'),
('Rohit', 'Shetty'),
('Gautham', 'Menon'),
('Jeethu', 'Joseph');

-- Inserting sample data into the 'movie' table
INSERT INTO movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_release_country) VALUES 
(907, 'Inception', 2010, 148, 'English', '2010-07-16', 'USA'),
(908, 'Titanic', 1997, 195, 'English', '1997-12-19', 'USA'),
(909, 'Forrest Gump', 1994, 142, 'English', '1994-07-06', 'USA'),
(910, 'My Name Is Khan', 2010, 165, 'Hindi', '2010-02-12', 'India'),
(911, 'Dilwale Dulhania Le Jayenge', 1995, 189, 'Hindi', '1995-10-20', 'India'),
(912, 'Baahubali: The Beginning', 2015, 159, 'Telugu', '2015-07-10', 'India'),
(913, 'The Dark Knight', 2008, 152, 'English', '2008-07-18', 'USA'),
(914, 'PK', 2014, 153, 'Hindi', '2014-12-19', 'India'),
(915, 'Avatar', 2009, 162, 'English', '2009-12-18', 'USA'),
(916, 'Lagaan', 2001, 224, 'Hindi', '2001-06-15', 'India'),
(917, 'Inglourious Basterds', 2009, 153, 'English', '2009-08-21', 'USA'),
(918, 'Petta', 2019, 171, 'Tamil', '2019-01-10', 'India'),
(919, 'Interstellar', 2014, 169, 'English', '2014-11-07', 'USA'),
(920, 'Drishyam', 2013, 160, 'Malayalam', '2013-12-19', 'India');

-- Inserting sample data into the 'movie_genres' table
INSERT INTO movie_genres (mov_id, gen_id) VALUES 
(907, 4), -- Inception (Thriller)
(908, 5), -- Titanic (Romance)
(909, 3), -- Forrest Gump (Drama)
(910, 3), -- My Name Is Khan (Drama)
(910, 5), -- My Name Is Khan (Romance)
(911, 5), -- Dilwale Dulhania Le Jayenge (Romance)
(911, 6), -- Dilwale Dulhania Le Jayenge (Musical)
(912, 1), -- Baahubali: The Beginning (Action)
(912, 3), -- Baahubali: The Beginning (Drama)
(913, 1), -- The Dark Knight (Action)
(913, 4), -- The Dark Knight (Thriller)
(914, 2), -- PK (Comedy)
(914, 3), -- PK (Drama)
(915, 1), -- Avatar (Action)
(915, 5), -- Avatar (Romance)
(916, 3), -- Lagaan (Drama)
(916, 5), -- Lagaan (Romance)
(917, 1), -- Inglourious Basterds (Action)
(917, 4), -- Inglourious Basterds (Thriller)
(918, 1), -- Petta (Action)
(918, 3), -- Petta (Drama)
(919, 1), -- Interstellar (Action)
(919, 3), -- Interstellar (Drama)
(920, 4); -- Drishyam (Thriller)

-- Inserting sample data into the 'movie_direction' table
INSERT INTO movie_direction (mov_id, dir_id) VALUES 
(907, 2), -- Inception (Christopher Nolan)
(908, 5), -- Titanic (James Cameron)
(909, 1), -- Forrest Gump (Steven Spielberg)
(910, 3), -- My Name Is Khan (Karan Johar)
(911, 4), -- Dilwale Dulhania Le Jayenge (Aditya Chopra)
(912, 4), -- Baahubali: The Beginning (SS Rajamouli)
(913, 2), -- The Dark Knight (Christopher Nolan)
(914, 6), -- PK (Rajkumar Hirani)
(915, 11), -- Avatar (James Cameron)
(916, 12), -- Lagaan (Ashutosh Gowariker)
(917, 11), -- Inglourious Basterds (Quentin Tarantino)
(918, 10), -- Petta (Karthik Subbaraj)
(919, 2), -- Interstellar (Christopher Nolan)
(920, 13); -- Drishyam (Jeethu Joseph)

-- Inserting sample data into the 'reviewer' table
INSERT INTO reviewer (rev_name) VALUES 
('John Smith'),
('Emily Johnson'),
('Michael Brown'),
('Sarah Wilson'),
('David Jones');

-- Inserting sample data into the 'rating' table
INSERT INTO rating (mov_id, rev_id, rev_stars, num_of_rating) VALUES 
(907, 1, 4.5, 100),
(908, 2, 4.8, 150),
(909, 3, 4.7, 120),
(910, 4, 4.5, 200),
(911, 5, 4.6, 180),
(912, 1, 4.9, 250),
(913, 2, 4.7, 300),
(914, 3, 4.8, 280),
(915, 4, 4.6, 320),
(916, 5, 4.5, 270),
(917, 1, 4.7, 400),
(918, 2, 4.9, 350),
(919, 3, 4.6, 380),
(920, 4, 4.7, 360);

-- Inserting sample data into the 'movie_cast' table
INSERT INTO movie_cast (act_id, mov_id, role) VALUES 
(1, 907, 'Cobb'),
(2, 907, 'Arthur'),
(3, 908, 'Rose'),
(4, 910, 'Rizvan Khan'),
(5, 911, 'Simran'),
(6, 912, 'Baahubali'),
(7, 913, 'Joker'),
(8, 914, 'PK'),
(9, 915, 'Jake Sully'),
(10, 916, 'Bhuvan'),
(11, 917, 'Aldo Raine'),
(10, 918, 'Kaali'),
(12, 919, 'Cooper'),
(13, 920, 'Georgekutty');

-- 1. From the following table, write a SQL query to find the name and year of the movies. Return movie title, movie release year
select mov_title,mov_year from movie

-- 2. From the following table, write a SQL query to find when the movie specific released. Return movie release year
select mov_year from movie

-- 3. From the following table, write a SQL query to find the movie that was released in 1999. Return movie title.
select mov_title from movie where mov_year = 2001

-- 4. From the following table, write a SQL query to find those movies, which were released before 1998. Return movie title.
select mov_title from movie where mov_year < 1998

-- 5. From the following tables, write a SQL query to find the name of all reviewers and movies together in a single list.
select movie.mov_title,reviewer.rev_name from movie inner join rating on movie.mov_id = rating.mov_id join reviewer on rating.rev_id = reviewer.rev_id

-- 6. From the following table, write a SQL query to find all reviewers who have rated seven or more stars to their rating. Return reviewer name. 
select reviewer.rev_name from reviewer inner join rating on reviewer.rev_id = rating.rev_id where rating.rev_stars >= 7

-- 7. From the following tables, write a SQL query to find the movies without any rating. Return movie title.
select movie.mov_title from movie inner join rating on movie.mov_id = rating.mov_id join reviewer on rating.rev_id = reviewer.rev_id where rating.rev_stars is null

-- 8. From the following table, write a SQL query to find the movies with ID 905 or 907 or 917. Return movie title.
select mov_title from movie where mov_id in(905,906,917)

-- 9. From the following table, write a SQL query to find the movie titles that contain the specific word. 
-- Sort the result-set in ascending order by movie year. Return movie ID, movie title and movie release year. 
    select mov_id,mov_title,mov_year from movie where mov_title like '%we%' or mov_title like '%boy%' order by mov_year asc

-- 10. From the following table, write a SQL query to find those actors with the first name 'Woody' and the last name 'Allen'. Return actor ID
select act_id from actor where act_fname = 'Woody' and act_lname = 'Allen'

-- 11. get directors who have directed movies with avrage rating higher then 5
select director.dir_fname , director.dir_lname from director left join movie_direction on director.dir_id = movie_direction.dir_id join rating on movie_direction.mov_id = rating.mov_id where rating.rev_stars > 4

-- 12. get all actors who have worked for movies that were directed by specific director
select distinct actor.act_fname,actor.act_lname from actor inner join movie_cast on actor.act_id = movie_cast.act_id join movie_direction on movie_cast.mov_id = movie_direction.mov_id join director on movie_direction.dir_id = director.dir_id where director.dir_fname = 'Aamir' and director.dir_lname = 'Khan'

-- 13. create a stored proc to get list of movies which is 3 years old and having rating greater than 5
-- create proc latest_movie 
-- as
-- begin 
--     select movie.mov_title from movie inner join rating on movie.mov_id = rating.mov_id where mov_year <= (year(getdate() - 3)) and rev_stars > 5
-- end;
 
exec letest_movie

-- 14. create a stored proc to get list of all directors who have directed more then 2 movies
-- create proc getListDirector
-- as
-- begin 
--     select director.dir_fname,director.dir_lname from director inner join director.dir_id = movie_direction.dir_id group by dir_fname,dir_lname having count(movie_direction.dir_id) >= 2
-- end 

exec getListDirector

-- 15. create a stored proc to get list of all directors which have directed a movie which have rating greater than 3.
-- create proc getListDirectorByRating
-- as
-- begin
--     select distinct dir_fname,dir_lname from director inner join movie_direction on director.dir_id = movie_direction.dir_id join rating on movie_direction.mov_id = rating.mov_id where rev_stars >= 3
-- end

exec getListDirectorByRating

-- 16. create a function to get worst director according to movie rating

-- 17.  create a function to get worst actor according to movie rating

-- 18. create a parameterized stored procedure which accept genre and give movie accordingly

-- create proc getMovieByGenre @genTitle varchar(50)
-- as
-- begin
-- 	select m.mov_title,m.mov_year,m.mov_lang 
-- 	from movie as m inner join movie_genres as mg 
-- 	on m.mov_id = mg.mov_id 
-- 	inner join genre as g on mg.gen_id = g.gen_id 
-- 	where g.gen_title = @genTitle
-- end

exec getMovieByGenre @genTitle = 'Drama'

-- 19. get list of movies that start with 'a' and end with letter 'e' and movie released before 2015
select distinct mov_title from movie where mov_title like 'a%e' and mov_year < 2015

-- 20. get a movie with highest movie cast
select mov_title from movie inner join movie_cast on movie.mov_id = movie_cast.mov_id  group by mov_title having count(act_id) > 1

-- 21. create a function to get reviewer that has rated highest number of movies


-- 22. From the following tables, write a query in SQL to generate a report, which contain the fields movie title, name of the female actor, year of the movie, role, movie genres, the director, date of release, and rating of that movie.


-- 23. From the following tables, write a SQL query to find the years when most of the ‘Mystery Movies’ produced. Count the number of generic title and compute their average rating. Group the result set on movie release year, generic title. Return movie year, generic title, number of generic title and average rating.

-- 24.  From the following tables, write a SQL query to find the highest-rated ‘Mystery Movies’. Return the title, year, and rating

-- 25. create a function which accepts genre and suggests best movie according to ratings 

-- 26. create a function which accepts genre and suggests best director according to ratings. 

-- 27. create a function that accepts a genre and give random movie according to genre

   