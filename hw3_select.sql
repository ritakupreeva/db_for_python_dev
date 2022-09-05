--1)�������� � ��� ������ ��������, �������� � 2018 ����
select album_name, release_year
from albums
where release_year = 2018;

--2)�������� � ����������������� ������ ����������� �����
select track_name, duration
from tracks
order by duration desc
limit 1;

--3)�������� ������, ����������������� ������� �� ����� 3,5 ������
select track_name
from tracks
where duration >= 3.5;

--4)�������� ���������, �������� � ������ � 2018 �� 2020 ��� ������������
select collection_name
from collections
where release_year between 2018 and 2020;

--5)�����������, ��� ��� ������� �� 1 �����
select singer_name
from singers
where singer_name not like '% %';

--6)�������� ������, ������� �������� ����� "���"/"my"
select *
from tracks
where lower(track_name) like '%���%';