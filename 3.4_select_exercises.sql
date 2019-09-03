use albums_db;

select * from albums;

-- The name of all albums by Pink Floyd
select name from albums where artist= "Pink floyd";

-- The year Sgt. Pepper's Lonely Hearts Club Band was released
select * from albums; 
select release_date from albums where name = "Sgt. Pepper's Lonely Hearts Club Band";

-- The genre for the album Nevermind
select * from albums;
Select genre from albums where name = "Nevermind";
-- Which albums were released in the 1990s
select * from albums; 
select name from albums where release_date between 1990 and 1999;
-- Which albums had less than 20 million certified sales
select * from albums;
select name from albums where sales>20;
-- All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
select * from albums where genre= "Rock";

