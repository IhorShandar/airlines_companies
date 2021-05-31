create schema if not exists airlines collate latin1_swedish_ci;

create table if not exists air_company
(
	id int auto_increment
		primary key,
	company_type varchar(255) null,
	founded_at varchar(255) null,
	name varchar(255) null
);

create table if not exists airplane
(
	id int auto_increment
		primary key,
	air_compid int not null,
	created_at varchar(255) null,
	factory_s_n bigint null,
	flight_distance double not null,
	fuel_capacity double not null,
	name varchar(255) null,
	number_of_flights int not null,
	type varchar(255) null,
	air_company_id int null,
	constraint FKp9yob98tmyb901cnu35k9uy43
		foreign key (air_company_id) references air_company (id)
);

create table if not exists flight
(
	id int auto_increment
		primary key,
	air_compid int not null,
	airplaneid int not null,
	created_at datetime(6) null,
	delay_started_at varchar(255) null,
	departure_country varchar(255) null,
	destination_country varchar(255) null,
	distance double not null,
	ended_at varchar(255) null,
	estimated_flight_time varchar(255) null,
	flight_status varchar(255) null,
	air_company_id int null,
	airplane_id int null,
	constraint FKb8t4272gfgo1feyyidvscbjm0
		foreign key (airplane_id) references airplane (id),
	constraint FKebvst1vfvhmhgn73mqs1vt8m7
		foreign key (air_company_id) references air_company (id)
);

