create database players;

create table players.criketers (
playerid int,
name varchar(255)

);

insert into players.criketers(playerid, name) values(1, "John Doe");
insert into players.criketers(playerid, name) values(1, "Jane Doe");

select * from players.criketers;

show databases;