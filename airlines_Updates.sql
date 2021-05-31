UPDATE airlines.air_company SET company_type = 'transport', founded_at = '06.04.2003', name = 'Austrian_Airlines' WHERE id = 1;
UPDATE airlines.air_company SET company_type = 'transport', founded_at = '07.05.2005', name = 'British_Airways' WHERE id = 2;
UPDATE airlines.air_company SET company_type = 'transport', founded_at = '05.04.1995', name = 'Ryanair' WHERE id = 3;
UPDATE airlines.air_company SET company_type = 'transport', founded_at = '07.11.1999', name = 'Eurowings' WHERE id = 4;
UPDATE airlines.air_company SET company_type = 'transport', founded_at = '06.12.2007', name = 'Luxair' WHERE id = 5;
UPDATE airlines.air_company SET company_type = 'transport', founded_at = '21.12.2010', name = 'LEVEL' WHERE id = 6;
UPDATE airlines.air_company SET company_type = 'transport', founded_at = '29.10.2001', name = 'AirAsia' WHERE id = 7;
UPDATE airlines.air_company SET company_type = 'transport', founded_at = '29.10.2008', name = 'IndiGo' WHERE id = 8;
UPDATE airlines.air_company SET company_type = 'transport', founded_at = '11.07.1994', name = 'Turkish_Airlines' WHERE id = 9;
UPDATE airlines.air_company SET company_type = 'transport', founded_at = '13.05.1998', name = 'Emirates' WHERE id = 10;
UPDATE airlines.airplane SET air_compid = 8, created_at = '10.05.2013', factory_s_n = 2423424, flight_distance = 243.4, fuel_capacity = 1200, name = 'BOEING737', number_of_flights = 12, type = 'Airbus', air_company_id = 8 WHERE id = 1;
UPDATE airlines.airplane SET air_compid = 1, created_at = '10.05.2012', factory_s_n = 3267890, flight_distance = 1300.4, fuel_capacity = 5000, name = 'Antonov225', number_of_flights = 20, type = 'Transport', air_company_id = 1 WHERE id = 2;
UPDATE airlines.airplane SET air_compid = 8, created_at = '09.07.2018', factory_s_n = 7592049, flight_distance = 800.4, fuel_capacity = 1000, name = 'Cessna172', number_of_flights = 6, type = 'Turboprop_Aircraft', air_company_id = 8 WHERE id = 3;
UPDATE airlines.airplane SET air_compid = 10, created_at = '11.08.2015', factory_s_n = 6745329, flight_distance = 3000.8, fuel_capacity = 1300, name = 'An12', number_of_flights = 9, type = 'Transport', air_company_id = 10 WHERE id = 4;
UPDATE airlines.airplane SET air_compid = 9, created_at = '17.06.2014', factory_s_n = 5736891, flight_distance = 2050.1, fuel_capacity = 1600, name = 'AIRBUS_A380', number_of_flights = 11, type = 'Transport', air_company_id = 9 WHERE id = 5;
UPDATE airlines.airplane SET air_compid = 2, created_at = '10.05.2015', factory_s_n = 9482750, flight_distance = 1340.1, fuel_capacity = 900, name = 'Cy_27', number_of_flights = 8, type = 'Military', air_company_id = 2 WHERE id = 6;
UPDATE airlines.airplane SET air_compid = 5, created_at = '12.05.2016', factory_s_n = 1876093, flight_distance = 1000.1, fuel_capacity = 800, name = 'Airbus_A320', number_of_flights = 7, type = 'Transport', air_company_id = 5 WHERE id = 7;
UPDATE airlines.airplane SET air_compid = 10, created_at = '12.06.2017', factory_s_n = 2736091, flight_distance = 1900.4, fuel_capacity = 1200, name = 'An_148', number_of_flights = 3, type = 'Transport', air_company_id = 10 WHERE id = 8;
UPDATE airlines.airplane SET air_compid = 2, created_at = '13.07.2019', factory_s_n = 9372835, flight_distance = 1100.4, fuel_capacity = 800, name = 'Mig_29', number_of_flights = 5, type = 'Military', air_company_id = 2 WHERE id = 9;
UPDATE airlines.airplane SET air_compid = 2, created_at = '13.07.2014', factory_s_n = 1657389, flight_distance = 1100.3, fuel_capacity = 700, name = 'L_39', number_of_flights = 29, type = 'Military', air_company_id = 2 WHERE id = 10;
UPDATE airlines.flight SET air_compid = 10, airplaneid = 4, created_at = '16-05-2021 15:35', delay_started_at = '01:40', departure_country = 'USA', destination_country = 'UA', distance = 1354.4, ended_at = '16-05-2021 22:45', estimated_flight_time = '07:33', flight_status = 'COMPLETED', air_company_id = 10, airplane_id = 4 WHERE id = 1;
UPDATE airlines.flight SET air_compid = 10, airplaneid = 8, created_at = '28-05-2021 15:35', delay_started_at = null, departure_country = 'USA', destination_country = 'UK', distance = 850.5, ended_at = '28-05-2021 22:45', estimated_flight_time = '05:35', flight_status = 'COMPLETED', air_company_id = 10, airplane_id = 8 WHERE id = 2;
UPDATE airlines.flight SET air_compid = 2, airplaneid = 6, created_at = '27-05-2021 15:35', delay_started_at = null, departure_country = 'UA', destination_country = 'UA', distance = 650, ended_at = '27-05-2021 19:45', estimated_flight_time = '02:35', flight_status = 'COMPLETED', air_company_id = 2, airplane_id = 6 WHERE id = 3;
UPDATE airlines.flight SET air_compid = 2, airplaneid = 9, created_at = '15-05-2021 15:35', delay_started_at = null, departure_country = 'UA', destination_country = 'UA', distance = 630, ended_at = '15-05-2021 16:25', estimated_flight_time = '02:05', flight_status = 'COMPLETED', air_company_id = 2, airplane_id = 9 WHERE id = 4;
UPDATE airlines.flight SET air_compid = 2, airplaneid = 10, created_at = '28-05-2021 22:00', delay_started_at = null, departure_country = 'UA', destination_country = 'UA', distance = 520, ended_at = null, estimated_flight_time = '01:15', flight_status = 'ACTIVE', air_company_id = 2, airplane_id = 10 WHERE id = 5;
UPDATE airlines.flight SET air_compid = 3, airplaneid = 3, created_at = '24-04-2021 17:25', delay_started_at = null, departure_country = 'UA', destination_country = 'TR', distance = 2500, ended_at = null, estimated_flight_time = '06:25', flight_status = 'PENDING', air_company_id = 3, airplane_id = 3 WHERE id = 6;
UPDATE airlines.flight SET air_compid = 3, airplaneid = 5, created_at = '24-03-2021 16:40', delay_started_at = null, departure_country = 'TR', destination_country = 'RO', distance = 1500, ended_at = null, estimated_flight_time = '04:30', flight_status = 'PENDING', air_company_id = 3, airplane_id = 5 WHERE id = 7;
UPDATE airlines.flight SET air_compid = 3, airplaneid = 5, created_at = '22-05-2021 16:00', delay_started_at = null, departure_country = 'TR', destination_country = 'PL', distance = 1800, ended_at = null, estimated_flight_time = '06:30', flight_status = 'ACTIVE', air_company_id = 3, airplane_id = 5 WHERE id = 8;
UPDATE airlines.flight SET air_compid = 1, airplaneid = 2, created_at = '17-03-2021 13:00', delay_started_at = null, departure_country = 'UA', destination_country = 'PL', distance = 1000, ended_at = null, estimated_flight_time = '04:30', flight_status = 'PENDING', air_company_id = 1, airplane_id = 2 WHERE id = 9;
UPDATE airlines.flight SET air_compid = 1, airplaneid = 2, created_at = '20-05-2021 18:00', delay_started_at = null, departure_country = 'PL', destination_country = 'UA', distance = 1000, ended_at = null, estimated_flight_time = '04:30', flight_status = 'ACTIVE', air_company_id = 1, airplane_id = 2 WHERE id = 10;