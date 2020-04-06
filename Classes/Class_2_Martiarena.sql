drop database if exists imdb;
create database imdb;
use imsb;
create table film(
	film_id int auto_increment primary key,
	title varchar(100),
 	description varchar(500),
	release_year date);


create table actor(
	actor_id int auto_increment primary key,
	first_name varchar(40),
	last_name varchar(40));

create table film_actor(
	actor_id int ,
	film_id int ,
	foreign key (film_id) references film (film_id) );

alter table film add last_update date;
alter table actor add last_update date;
alter table film_actor add foreign key (actor_id) references actor (actor_id);

insert into actor(first_name,last_name) values ('Keanu','Reeves');
insert into actor(first_name,last_name) values ('Laurence','Fishburne');
insert into actor(first_name,last_name) values ('Tom','Hanks');

insert into film(title,description,release_year) values ('Matrix','Follow the white rabbit','1999-06-10');
insert into film(title,description,release_year) values ('El codigo Da vinci','Mistery','2006-05-18');
insert into film(title,description,release_year) values ('John Wick','Action','2015-01-15');

insert into film_actor(actor_id,film_id) values (1,1);
insert into film_actor(actor_id,film_id) values (1,3);
insert into film_actor(actor_id,film_id) values (2,1);
insert into film_actor(actor_id,film_id) values (3,2);


