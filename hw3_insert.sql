/*==============================================================*/
/* Table: singers                                               */
/*==============================================================*/
insert into singers (singer_name)
values
	('�����������1'),
	('�����������2'),
	('�����������3'),
	('����������� 4'),
	('����������� 5'),
	('����������� 6'),
	('����������� 7'),
	('�����������8');

/*==============================================================*/
/* Table: genres                                                */
/*==============================================================*/
insert into genres (genre_name)
values
	('��������'),
	('��������'),
	('����'),
	('������'),
	('�����');

/*==============================================================*/
/* Table: albums                                                */
/*==============================================================*/
insert into albums (album_name, release_year)
values
	('������1', 2018),
	('������2', 2020),
	('������3', 2016),
	('������4', 2015),
	('������5', 2010),
	('������6', 1990),
	('������7', 2018),
	('������8', 2019);

/*==============================================================*/
/* Table: tracks                                                */
/*==============================================================*/
insert into tracks (track_name, duration, album_id)
values
	('����1', 2, 1),
	('����2', 2, 1),
	('����3', 2, 2),
	('����4', 3, 3),
	('����5 ���', 4, 3),
	('����6', 3, 3),
	('����7', 4, 4),
	('����8', 1, 5),
	('����9', 1, 5),
	('����10', 2, 4),
	('����11', 3, 6),
	('����12', 3, 7),
	('����13', 3, 6),
	('����14', 4, 8),
	('�������15', 5, 8),
	('���� ��� ��������', 2, 1);

/*==============================================================*/
/* Table: collections                                           */
/*==============================================================*/
insert into collections (collection_name, release_year)
values
	('�������1', 2018),
	('�������2', 2022),
	('�������3', 2020),
	('�������4', 2019),
	('�������5', 2000),
	('�������6', 2017),
	('�������7', 2017),
	('�������8', 2017);

/*==============================================================*/
/* Table: singers_genres                                        */
/*==============================================================*/
insert into singers_genres (singer_id, genre_id)
values
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 4),
	(2, 5),
	(3, 4),
	(4, 1),
	(5, 5),
	(6, 3),
	(7, 3),
	(8, 1),
	(8, 3),
	(7, 4),
	(7, 5),
	(4, 2);

/*==============================================================*/
/* Table: singers_albums                                        */
/*==============================================================*/
insert into singers_albums (singer_id, album_id)
values
	(1, 1),
	(2, 1),
	(3,4),
	(4,5),
	(5,6),
	(6,7),
	(7,8),
	(8,2),
	(8,3);

/*==============================================================*/
/* Table: collections_tracks                                    */
/*==============================================================*/
insert into collections_tracks (collection_id, track_id)
values
	(1, 1),
	(1, 2 ),
	(1, 3),
	(2, 4),
	(2, 5),
	(3, 6),
	(3, 7),
	(3, 8),
	(3, 9),
	(4, 10),
	(4, 11),
	(5, 12),
	(5, 13),
	(6, 14),
	(7, 15),
	(7, 14),
	(8, 14);