# %%%%%%%%%%%%% IMDB Movies %%%%%%%%%%%%%% #

-- a) Can you get all data about movies?
select *
from movies;

-- b) How do you get all data about directors?
select * 
from directors;

-- c) Check how many movies are present in IMDB.
select count(uid) as total_movies
from movies;

-- d) Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select * 
from directors 
where name in ("James Cameron", "Luc Besson", "John Woo");

-- e) Find all directors with name starting with Steven.
select * 
from directors
where name like "Steven%" ;

-- f) Count female directors.
 select *
 from directors
 where gender = 1;
 
-- g) Find the name of the 10th first women directors?
select d.name
from directors as d 
join movies as m
on d.id = m.director_id
where d.gender = 1
order by m.release_date asc
limit 1 offset 9;

select *
from directors 
where gender = 1
order by name asc
limit 1 offset 9;

-- h) What are the 3 most popular movies?
 select *
 from movies
 order by popularity desc
 limit 3;

-- i) What are the 3 most bankable movies? 
select *
from movies
order by revenue desc
limit 3;

-- j) What is the most awarded average vote since the January 1st, 2000? 
 select vote_average, sum(vote_count) as total_votes
 from movies
 where release_date > "2000-01-01"
 group by vote_average
 order by total_votes desc
 limit 1;
 
-- k) Which movie(s) were directed by Brenda Chapman?
select m.title
from movies m
join directors d
on m.director_id = d.id
where d.name = "Brenda Chapman";

-- l) Whose director made the most movies?
select D.Name, COUNT(*) AS total_movies from movies M
join directors D ON M.director_ID = D.ID
group by D.Name
order by total_movies desc
limit 1;

-- m) Whose director is the most bankable?
select d.Name, m.revenue from movies m
join directors d ON m.director_ID = d.ID
order by revenue desc
limit 1;






  