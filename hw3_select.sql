--1)Название и год выхода альбомов, вышедших в 2018 году
select album_name, release_year
from albums
where release_year = 2018;

--2)Название и продолжительность самого длительного трека
select track_name, duration
from tracks
order by duration desc
limit 1;

--3)Название треков, продолжительность которых не менее 3,5 минуты
select track_name
from tracks
where duration >= 3.5;

--4)Названия сборников, вышедших в период с 2018 по 2020 год включительно
select collection_name
from collections
where release_year between 2018 and 2020;

--5)Исполнители, чье имя состоит из 1 слова
select singer_name
from singers
where singer_name not like '% %';

--6)Название треков, которые содержат слово "мой"/"my"
select *
from tracks
where lower(track_name) like '%мой%';