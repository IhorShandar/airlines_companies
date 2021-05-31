package ua.com.airlines.airlines_companies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ua.com.airlines.airlines_companies.modules.AirCompany;
import ua.com.airlines.airlines_companies.modules.Airplane;
import ua.com.airlines.airlines_companies.modules.Flight;
import ua.com.airlines.airlines_companies.repository.AirCompanyDao;
import ua.com.airlines.airlines_companies.repository.AirplaneDao;
import ua.com.airlines.airlines_companies.repository.FlightDao;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.stream.Collectors;

@RestController()
public class MainController {

    @Autowired
    private AirplaneDao airplaneDao;

    @Autowired
    private AirCompanyDao airCompanyDao;

    @Autowired
    private FlightDao flightDao;

    @GetMapping("/airplanes")
    public List<Airplane> allAirplanes() {
        return airplaneDao.findAll();
    }

    @GetMapping("/airplane/{id}")
    public Airplane index(@PathVariable int id) { return airplaneDao.findByID(id); }

    @GetMapping("/airCompanies")
    public List<AirCompany> allCompanies() {
        return airCompanyDao.findAll();
    }

    @GetMapping("/airCompany/{id}")
    public AirCompany allCompanies(@PathVariable int id) {
        return airCompanyDao.findByID(id);
    }

    @GetMapping("/flights")
    public List<Flight> allFlights() {
        return flightDao.findAll();
    }

    @GetMapping("/flight/{id}")
    public Flight allFlights(@PathVariable int id) {
        return flightDao.findByID(id);
    }

    @PostMapping("/updateAirplane")
    public Airplane updateAirplane(@RequestBody Airplane airplane){
        Airplane airplaneUpdate = airplaneDao.findByID(airplane.getID());
        AirCompany airCompany = airCompanyDao.findByID(airplane.getAirCompID());
        airplaneUpdate.setAirCompID(airplane.getAirCompID());
        airplaneUpdate.setAirCompany(airCompany);
        airplaneUpdate.setName(airplane.getName());
        airplaneUpdate.setFactory_s_n(airplane.getFactory_s_n());
        airplaneUpdate.setNumberOfFlights(airplane.getNumberOfFlights());
        airplaneUpdate.setFlightDistance(airplane.getFlightDistance());
        airplaneUpdate.setFuelCapacity(airplane.getFuelCapacity());
        airplaneUpdate.setType(airplane.getType());
        airplaneUpdate.setCreatedAt(airplane.getCreatedAt());

        airplaneDao.save(airplaneUpdate);
        return airplaneUpdate;
    }

    @PostMapping("/updateAirCompany")
    public AirCompany updateAirCompany(@RequestBody AirCompany airCompany){
        AirCompany companyUpdate = airCompanyDao.findByID(airCompany.getID());
        companyUpdate.setName(airCompany.getName());
        companyUpdate.setCompanyType(airCompany.getCompanyType());
        companyUpdate.setFoundedAt(airCompany.getFoundedAt());
        airCompanyDao.save(companyUpdate);
        return companyUpdate;
    }

    @PostMapping("/updateFlight")
    public Flight updateFlight(@RequestBody Flight flight){
        Flight flightUpdate = flightDao.findByID(flight.getID());
        flightUpdate.setFlightStatus(flight.getFlightStatus());
        flightUpdate.setDepartureCountry(flight.getDepartureCountry());
        flightUpdate.setDestinationCountry(flight.getDestinationCountry());
        flightUpdate.setDistance(flight.getDistance());
        flightUpdate.setEstimatedFlightTime(flight.getEstimatedFlightTime());
        flightUpdate.setCreatedAt(flight.getCreatedAt());
        flightUpdate.setAirCompID(flight.getAirCompID());
        AirCompany airCompany = airCompanyDao.findByID(flight.getAirCompID());
        flightUpdate.setAirCompany(airCompany);
        flightUpdate.setAirplaneID(flight.getAirplaneID());
        Airplane airplane = airplaneDao.findByID(flight.getAirplaneID());
        flightUpdate.setAirplane(airplane);
        flightDao.save(flightUpdate);
        return flightUpdate;
    }

    @DeleteMapping("/deleteAirplane/{id}")
    public void deleteAirplane(@PathVariable int id){
        airplaneDao.deleteById(id);
    }

    @DeleteMapping("/deleteAirCompany/{id}")
    public void deleteAirCompany(@PathVariable int id){
        airCompanyDao.deleteById(id);
    }

    @DeleteMapping("/deleteFlight/{id}")
    public void deleteFlight(@PathVariable int id){
        flightDao.deleteById(id);
    }

    @PostMapping("/airCompany")
    public List<AirCompany> saveAirCompany(@RequestBody AirCompany airCompany){
        airCompanyDao.save(airCompany);

        return airCompanyDao.findAll();
    }

    @PostMapping("/airplane")
    public List<Airplane> saveAirplane(@RequestBody Airplane airplane){
        AirCompany airCompany = airCompanyDao.findByID(airplane.getAirCompID());
        airplane.setAirCompany(airCompany);
        airplaneDao.save(airplane);
        return airplaneDao.findAll();
    }

    @PostMapping("/flight")
    public List<Flight> saveFlight(@RequestBody Flight flight){
        AirCompany airCompany = airCompanyDao.findByID(flight.getAirCompID());
        flight.setAirCompany(airCompany);
        Airplane airplane = airplaneDao.findByID(flight.getAirplaneID());
        flight.setAirplane(airplane);
        flightDao.save(flight);

        return flightDao.findAll();
    }

    @GetMapping("/flightStatus")
    public List<Flight> findByStatus(@RequestBody Flight flight){
        return flightDao.findAllByFlightStatusAndAirCompany_Name(flight.getFlightStatus(), flight.getAirCompany().getName());
    }

    @GetMapping("/started24HoursAgo")
    public List<Flight> started24HoursAgo(){
        DateTimeFormatter myTime = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
        LocalDateTime currentTime = LocalDateTime.now();
        return flightDao
                .findAllByFlightStatus("ACTIVE")
                .stream().filter(flight -> {
                    LocalDateTime flightTime = LocalDateTime.parse(flight.getCreatedAt(), myTime);
                    long durInDays = ChronoUnit.DAYS.between(flightTime, currentTime);
                    return (durInDays > 0);
                }).collect(Collectors.toList());

    }

    @PostMapping("/moveAirplane")
    public Airplane moveAirplane(@RequestBody Airplane airplane){
        AirCompany airCompany = airCompanyDao.findByID(airplane.getAirCompID());
        Airplane airplaneMove = airplaneDao.findByID(airplane.getID());
        airplaneMove.setAirCompID(airplane.getAirCompID());
        airplaneMove.setAirCompany(airCompany);
        airplaneDao.save(airplaneMove);
        return airplaneMove;
    }

    @PostMapping("/setStatus")
    public Flight setStatus(@RequestBody Flight flight){
        Flight flightNewStatus = flightDao.findByID(flight.getID());
        flightNewStatus.setFlightStatus(flight.getFlightStatus());
        switch (flightNewStatus.getFlightStatus()) {
            case "DELAYED":
                flightNewStatus.setDelayStartedAt(flight.getDelayStartedAt());
                break;
            case "ACTIVE":
                flightNewStatus.setCreatedAt(flight.getCreatedAt());
                flightNewStatus.setEndedAt(null);
                break;
            case "COMPLETED":
                flightNewStatus.setEndedAt(flight.getEndedAt());
                break;
        }
        flightDao.save(flightNewStatus);
        return flightNewStatus;
    }

    @GetMapping("/completedFlight")
    public List<Flight> completedFlight(){
        DateTimeFormatter myTime = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
        DateTimeFormatter myTime1 = DateTimeFormatter.ofPattern("HH:mm");
        return flightDao
                .findAllByFlightStatus("COMPLETED")
                .stream().filter(flight -> {
                    LocalDateTime createdTime = LocalDateTime.parse(flight.getCreatedAt(), myTime);
                    LocalDateTime endedTime = LocalDateTime.parse(flight.getEndedAt(), myTime);
                    LocalTime estimatedFlyTime = LocalTime.parse(flight.getEstimatedFlightTime(), myTime1);
                    long durInMinutes = ChronoUnit.MINUTES.between(createdTime, endedTime);
                    long estTimeInMin = estimatedFlyTime.getHour()*60 + estimatedFlyTime.getMinute();
                    return (durInMinutes > estTimeInMin);
                }).collect(Collectors.toList());

    }

}
