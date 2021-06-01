create schema if not exists airlines collate latin1_swedish_ci;

create table if not exists air_company
(
	id int auto_increment
		primary key,
	company_type varchar(255) null,
	founded_at varchar(255) null,
	name varchar(255) null
);

INSERT INTO airlines.air_company (company_type, founded_at, name) VALUES ('transport', '06.04.2003', 'Austrian_Airlines');
INSERT INTO airlines.air_company (company_type, founded_at, name) VALUES ('transport', '07.05.2005', 'British_Airways');
INSERT INTO airlines.air_company (company_type, founded_at, name) VALUES ('transport', '05.04.1995', 'Ryanair');
INSERT INTO airlines.air_company (company_type, founded_at, name) VALUES ('transport', '07.11.1999', 'Eurowings');
INSERT INTO airlines.air_company (company_type, founded_at, name) VALUES ('transport', '06.12.2007', 'Luxair');
INSERT INTO airlines.air_company (company_type, founded_at, name) VALUES ('transport', '21.12.2010', 'LEVEL');
INSERT INTO airlines.air_company (company_type, founded_at, name) VALUES ('transport', '29.10.2001', 'AirAsia');
INSERT INTO airlines.air_company (company_type, founded_at, name) VALUES ('transport', '29.10.2008', 'IndiGo');
INSERT INTO airlines.air_company (company_type, founded_at, name) VALUES ('transport', '11.07.1994', 'Turkish_Airlines');
INSERT INTO airlines.air_company (company_type, founded_at, name) VALUES ('transport', '13.05.1998', 'Emirates');

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

INSERT INTO airlines.airplane (air_compid, created_at, factory_s_n, flight_distance, fuel_capacity, name, number_of_flights, type, air_company_id) VALUES (8, '10.05.2013', 2423424, 243.4, 1200, 'BOEING737', 12, 'Airbus', 8);
INSERT INTO airlines.airplane (air_compid, created_at, factory_s_n, flight_distance, fuel_capacity, name, number_of_flights, type, air_company_id) VALUES (1, '10.05.2012', 3267890, 1300.4, 5000, 'Antonov225', 20, 'Transport', 1);
INSERT INTO airlines.airplane (air_compid, created_at, factory_s_n, flight_distance, fuel_capacity, name, number_of_flights, type, air_company_id) VALUES (8, '09.07.2018', 7592049, 800.4, 1000, 'Cessna172', 6, 'Turboprop_Aircraft', 8);
INSERT INTO airlines.airplane (air_compid, created_at, factory_s_n, flight_distance, fuel_capacity, name, number_of_flights, type, air_company_id) VALUES (10, '11.08.2015', 6745329, 3000.8, 1300, 'An12', 9, 'Transport', 10);
INSERT INTO airlines.airplane (air_compid, created_at, factory_s_n, flight_distance, fuel_capacity, name, number_of_flights, type, air_company_id) VALUES (9, '17.06.2014', 5736891, 2050.1, 1600, 'AIRBUS_A380', 11, 'Transport', 9);
INSERT INTO airlines.airplane (air_compid, created_at, factory_s_n, flight_distance, fuel_capacity, name, number_of_flights, type, air_company_id) VALUES (2, '10.05.2015', 9482750, 1340.1, 900, 'Cy_27', 8, 'Military', 2);
INSERT INTO airlines.airplane (air_compid, created_at, factory_s_n, flight_distance, fuel_capacity, name, number_of_flights, type, air_company_id) VALUES (5, '12.05.2016', 1876093, 1000.1, 800, 'Airbus_A320', 7, 'Transport', 5);
INSERT INTO airlines.airplane (air_compid, created_at, factory_s_n, flight_distance, fuel_capacity, name, number_of_flights, type, air_company_id) VALUES (10, '12.06.2017', 2736091, 1900.4, 1200, 'An_148', 3, 'Transport', 10);
INSERT INTO airlines.airplane (air_compid, created_at, factory_s_n, flight_distance, fuel_capacity, name, number_of_flights, type, air_company_id) VALUES (2, '13.07.2019', 9372835, 1100.4, 800, 'Mig_29', 5, 'Military', 2);
INSERT INTO airlines.airplane (air_compid, created_at, factory_s_n, flight_distance, fuel_capacity, name, number_of_flights, type, air_company_id) VALUES (2, '13.07.2014', 1657389, 1100.3, 700, 'L_39', 29, 'Military', 2);


create table if not exists flight
(
	id int auto_increment
		primary key,
	air_compid int not null,
	airplaneid int not null,
	created_at varchar(255) null,
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

INSERT INTO airlines.flight (air_compid, airplaneid, created_at, delay_started_at, departure_country, destination_country, distance, ended_at, estimated_flight_time, flight_status, air_company_id, airplane_id) VALUES (10, 4, '16-05-2021 15:35', '01:40', 'USA', 'UA', 1354.4, '16-05-2021 22:45', '07:33', 'COMPLETED', 10, 4);
INSERT INTO airlines.flight (air_compid, airplaneid, created_at, delay_started_at, departure_country, destination_country, distance, ended_at, estimated_flight_time, flight_status, air_company_id, airplane_id) VALUES (10, 8, '28-05-2021 15:35', null, 'USA', 'UK', 850.5, '28-05-2021 22:45', '05:35', 'COMPLETED', 10, 8);
INSERT INTO airlines.flight (air_compid, airplaneid, created_at, delay_started_at, departure_country, destination_country, distance, ended_at, estimated_flight_time, flight_status, air_company_id, airplane_id) VALUES (2, 6, '27-05-2021 15:35', null, 'UA', 'UA', 650, '27-05-2021 19:45', '02:35', 'COMPLETED', 2, 6);
INSERT INTO airlines.flight (air_compid, airplaneid, created_at, delay_started_at, departure_country, destination_country, distance, ended_at, estimated_flight_time, flight_status, air_company_id, airplane_id) VALUES (2, 9, '15-05-2021 15:35', null, 'UA', 'UA', 630, '15-05-2021 16:25', '02:05', 'COMPLETED', 2, 9);
INSERT INTO airlines.flight (air_compid, airplaneid, created_at, delay_started_at, departure_country, destination_country, distance, ended_at, estimated_flight_time, flight_status, air_company_id, airplane_id) VALUES (2, 10, '28-05-2021 22:00', null, 'UA', 'UA', 520, null, '01:15', 'ACTIVE', 2, 10);
INSERT INTO airlines.flight (air_compid, airplaneid, created_at, delay_started_at, departure_country, destination_country, distance, ended_at, estimated_flight_time, flight_status, air_company_id, airplane_id) VALUES (3, 3, '24-04-2021 17:25', null, 'UA', 'TR', 2500, null, '06:25', 'PENDING', 3, 3);
INSERT INTO airlines.flight (air_compid, airplaneid, created_at, delay_started_at, departure_country, destination_country, distance, ended_at, estimated_flight_time, flight_status, air_company_id, airplane_id) VALUES (3, 5, '24-03-2021 16:40', null, 'TR', 'RO', 1500, null, '04:30', 'PENDING', 3, 5);
INSERT INTO airlines.flight (air_compid, airplaneid, created_at, delay_started_at, departure_country, destination_country, distance, ended_at, estimated_flight_time, flight_status, air_company_id, airplane_id) VALUES (3, 5, '22-05-2021 16:00', null, 'TR', 'PL', 1800, null, '06:30', 'ACTIVE', 3, 5);
INSERT INTO airlines.flight (air_compid, airplaneid, created_at, delay_started_at, departure_country, destination_country, distance, ended_at, estimated_flight_time, flight_status, air_company_id, airplane_id) VALUES (1, 2, '17-03-2021 13:00', null, 'UA', 'PL', 1000, null, '04:30', 'PENDING', 1, 2);
INSERT INTO airlines.flight (air_compid, airplaneid, created_at, delay_started_at, departure_country, destination_country, distance, ended_at, estimated_flight_time, flight_status, air_company_id, airplane_id) VALUES (1, 2, '20-05-2021 18:00', null, 'PL', 'UA', 1000, null, '04:30', 'ACTIVE', 1, 2);
