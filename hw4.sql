--1)Количество исполнителей в каждом жанре
select genre_id, count(distinct singer_id) as singers_cnt
from singers_genres
group by genre_id;

--2)Количество треков, вошедших в альбомы 2019-2020 годов
select count(distinct t.track_id) as tracks_cnt
from albums a
join tracks t on t.album_id = a.album_id
where a.release_year between 2019 and 2020;

--3)Средняя продолжительность треков по каждому альбому
select album_id, round(avg(duration), 2) as duration_avg
from tracks
group by album_id
order by album_id;

--4)Все исполнители, которые не выпустили альбомы в 2020 году
select s.singer_name
from singers s
where s.singer_id not in (
	--Исполнители с альбомами 2020 года
	select sa.singer_id
	from singers_albums sa
	join albums a on a.album_id = sa.album_id and a.release_year = 2020
);

--5)Названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
select distinct c.collection_name
from collections c
join collections_tracks ct on ct.collection_id = c.collection_id
join tracks t on t.track_id = ct.track_id
join albums a on a.album_id = t.album_id
join singers_albums sa on sa.album_id = a.album_id
join singers s on s.singer_id = sa.singer_id and s.singer_id = 7;

--6)Название альбомов, в которых присутствуют исполнители более 1 жанра
select distinct a.album_name
from albums a
join singers_albums sa on sa.album_id = a.album_id
where sa.singer_id in (
	--Исполнители более одного жанра
	select singer_id
	from singers_genres sg
	group by singer_id
	having count(genre_id) > 1
)
order by a.album_name;

--7)Наименование треков, которые не входят в сборники
select t.track_name
from tracks t
left join collections_tracks ct on ct.track_id = t.track_id
where ct.track_id is null;

--8)Исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)
select distinct s.singer_name
from singers s
join singers_albums sa on sa.singer_id = s.singer_id
join tracks t on t.album_id = sa.album_id
where t.duration = (
	--Самая маленькая продолжительность трека
	select min(duration) as duration_min
	from tracks
);

--9)Название альбомов, содержащих наименьшее количество треков
with albums_tracks
as (
	select album_id, count(track_id) as tracks_cnt
	from tracks
	group by album_id
)
select a.album_name
from albums_tracks atr
join albums a on a.album_id = atr.album_id
where atr.tracks_cnt = (
	--Наименьшее количество треков
	select min(s.tracks_cnt) as tracks_cnt_min
	from (
		select album_id, count(track_id) as tracks_cnt
		from tracks
		group by album_id
	) s
);