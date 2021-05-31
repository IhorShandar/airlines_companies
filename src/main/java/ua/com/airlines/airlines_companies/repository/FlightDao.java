package ua.com.airlines.airlines_companies.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.airlines.airlines_companies.modules.Flight;

import java.util.List;

public interface FlightDao extends JpaRepository<Flight, Integer> {

    List<Flight> findAllByFlightStatusAndAirCompany_Name(String flightStatus, String name);
    List<Flight> findAllByFlightStatus(String flightStatus);
    List<Flight> findAllByFlightStatusAndAirCompany_ID(String flightStatus, int ID);
    Flight findByID(int ID);

}
