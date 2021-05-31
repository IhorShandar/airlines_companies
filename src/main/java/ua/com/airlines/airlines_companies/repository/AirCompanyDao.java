package ua.com.airlines.airlines_companies.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.airlines.airlines_companies.modules.AirCompany;

public interface AirCompanyDao extends JpaRepository<AirCompany, Integer> {

    AirCompany findByID(int ID);
    AirCompany findByName(String name);
}
