package ua.com.airlines.airlines_companies.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.airlines.airlines_companies.modules.Airplane;

public interface AirplaneDao extends JpaRepository<Airplane, Integer> {

    Airplane findByID(int ID);

}
