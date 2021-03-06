drop schema if exists jam;

create schema if not exists jam;

create table jam.profiles (
  id serial not null,
  login varchar(16) not null,
  password varchar(16) not null,
  name varchar(16),

  primary key id
);

create unique index profiles_login_idx on jam.profiles login;

create table jam.events (
  id serial not null,
  title varchar(64) not null,
  date date not null,
  profile_id integer not null,

  primary key id,
  foreign key profile_id references jam.profiles
);

create table jam.tracks (
  id serial not null,
  title varchar(64) not null,
  event_id integer not null,

  primary key id,
  foreign key event_id references jam.events
);

create table jam.part_types (
  id serial not null,
  title varchar(64) not null
);

create table jam.parts (
  id serial not null,
  profile_id integer not null,
  track_id integer not null,
  part_type_id integer not null,

  foreign key profile_id references jam.profiles,
  foreign key track_id references jam.tracks,
  foreign key part_type_id references jam.part_types
);

create unique index parts_part_type_id_track_id_idx on jam.parts (part_type_id, track_id);