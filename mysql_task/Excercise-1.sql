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
    mov_id int IDENTITY(1,1) PRIMARY key,
    mov_title varchar(50),
    mov_year int,
    mov_time int,
    mov_lang varchar(30),
    mov_dt_rel date,
    mov_release_country varchar(50)
)

create table movie_genres (
    mov_id int identity(1,1) primary key,
    gen_id int,
    foreign key (gen_id) REFERENCES genre(gen_id)
)

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