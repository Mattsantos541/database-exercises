###mysql practice
show databases;
-- mysql.user means use the mysql database and read from the user table
select * from mysql.user;
-- select the user and host columns from the user table
select user, host from mysql.user;


-- seleect all columns from the help_topic on the mysql databases
SELECT * From mysql.help_topic;


Select help_topic_id, help_category_id, url FROM mysql.help_topic
