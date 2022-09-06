--1)���������� ������������ � ������ �����
select genre_id, count(distinct singer_id) as singers_cnt
from singers_genres
group by genre_id;

--2)���������� ������, �������� � ������� 2019-2020 �����
select count(distinct t.track_id) as tracks_cnt
from albums a
join tracks t on t.album_id = a.album_id
where a.release_year between 2019 and 2020;

--3)������� ����������������� ������ �� ������� �������
select album_id, round(avg(duration), 2) as duration_avg
from tracks
group by album_id
order by album_id;

--4)��� �����������, ������� �� ��������� ������� � 2020 ����
select s.singer_name
from singers s
where s.singer_id not in (
	--����������� � ��������� 2020 ����
	select sa.singer_id
	from singers_albums sa
	join albums a on a.album_id = sa.album_id and a.release_year = 2020
);

--5)�������� ���������, � ������� ������������ ���������� ����������� (�������� ����)
select distinct c.collection_name
from collections c
join collections_tracks ct on ct.collection_id = c.collection_id
join tracks t on t.track_id = ct.track_id
join albums a on a.album_id = t.album_id
join singers_albums sa on sa.album_id = a.album_id
join singers s on s.singer_id = sa.singer_id and s.singer_id = 7;

--6)�������� ��������, � ������� ������������ ����������� ����� 1 �����
select distinct a.album_name
from albums a
join singers_albums sa on sa.album_id = a.album_id
where sa.singer_id in (
	--����������� ����� ������ �����
	select singer_id
	from singers_genres sg
	group by singer_id
	having count(genre_id) > 1
)
order by a.album_name;

--7)������������ ������, ������� �� ������ � ��������
select t.track_name
from tracks t
left join collections_tracks ct on ct.track_id = t.track_id
where ct.track_id is null;

--8)�����������(-��), ����������� ����� �������� �� ����������������� ���� (������������ ����� ������ ����� ���� ���������)
select distinct s.singer_name
from singers s
join singers_albums sa on sa.singer_id = s.singer_id
join tracks t on t.album_id = sa.album_id
where t.duration = (
	--����� ��������� ����������������� �����
	select min(duration) as duration_min
	from tracks
);

--9)�������� ��������, ���������� ���������� ���������� ������
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
	--���������� ���������� ������
	select min(s.tracks_cnt) as tracks_cnt_min
	from (
		select album_id, count(track_id) as tracks_cnt
		from tracks
		group by album_id
	) s
);