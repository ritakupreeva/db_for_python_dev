/*==============================================================*/
/* Table: albums                                                */
/*==============================================================*/
create table albums (
	album_id serial not null,
	album_name varchar(100) not null,
	release_year int4 not null,
	constraint pk_albums primary key (album_id)
);

/*==============================================================*/
/* Table: collections                                           */
/*==============================================================*/
create table collections (
	collection_id serial not null,
	collection_name varchar(100) not null,
	release_year int4 not null,
	constraint pk_collections primary key (collection_id)
);

/*==============================================================*/
/* Table: collections_tracks                                    */
/*==============================================================*/
create table collections_tracks (
	collection_id int4 not null,
	track_id int4 not null,
	constraint pk_collections_tracks primary key (collection_id, track_id)
);

/*==============================================================*/
/* Table: genres                                                */
/*==============================================================*/
create table genres (
	genre_id serial not null,
	genre_name varchar(100) not null,
	constraint pk_genres primary key (genre_id)
);

/*==============================================================*/
/* Table: singers                                               */
/*==============================================================*/
create table singers (
	singer_id serial not null,
	singer_name varchar(100) not null,
	constraint pk_singers primary key (singer_id)
);

/*==============================================================*/
/* Table: singers_albums                                        */
/*==============================================================*/
create table singers_albums (
	singer_id int4 not null,
	album_id int4 not null,
	constraint pk_singers_albums primary key (singer_id, album_id)
);

/*==============================================================*/
/* Table: singers_genres                                        */
/*==============================================================*/
create table singers_genres (
	singer_id int4 not null,
	genre_id int4 not null,
	constraint pk_singers_genres primary key (singer_id, genre_id)
);

/*==============================================================*/
/* Table: tracks                                                */
/*==============================================================*/
create table tracks (
	track_id serial not null,
	track_name varchar(100) not null,
	duration int4 not null,
	album_id int4 not null,
	constraint pk_tracks primary key (track_id)
);

alter table collections_tracks
	add constraint fk_collections_tracks_tracks foreign key (track_id)
		references tracks (track_id);

alter table collections_tracks
	add constraint fk_collections_tracks_collections foreign key (collection_id)
		references collections (collection_id);

alter table singers_albums
	add constraint fk_singers_albums_singers foreign key (singer_id)
		references singers (singer_id);

alter table singers_albums
	add constraint fk_singers_albums_albums foreign key (album_id)
		references albums (album_id);

alter table singers_genres
	add constraint fk_singers_genres_singers foreign key (singer_id)
		references singers (singer_id);

alter table singers_genres
	add constraint fk_singers_genres_genres foreign key (genre_id)
		references genres (genre_id);

alter table tracks
	add constraint fk_tracks_albums foreign key (album_id)
		references albums (album_id);
