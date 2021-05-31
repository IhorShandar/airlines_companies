package ua.com.airlines.airlines_companies.modules;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode
//@ToString
//@ToString(exclude = {"flightList", "airCompany"})
@ToString(exclude = {"airCompany"})
public class Airplane {

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int ID;
    String name;
    Long factory_s_n;
    int numberOfFlights;
    double flightDistance;
    double fuelCapacity;
    String type;
    String createdAt;
    int airCompID;
    @JsonIgnore
    @OneToMany(mappedBy = "airplane", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
    List<Flight> flightList = new ArrayList<>();
  //  @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    AirCompany airCompany;


    public Airplane(String name, Long factory_s_n, int numberOfFlights, double flightDistance, double fuelCapacity, String type, String createdAt) {
        this.name = name;
        this.factory_s_n = factory_s_n;
        this.numberOfFlights = numberOfFlights;
        this.flightDistance = flightDistance;
        this.fuelCapacity = fuelCapacity;
        this.type = type;
        this.createdAt = createdAt;
    }

    public Airplane(int ID) {
        this.ID = ID;
    }

    public Airplane(String name, Long factory_s_n, int numberOfFlights, double flightDistance, double fuelCapacity, String type, String createdAt, int airCompID) {
        this.name = name;
        this.factory_s_n = factory_s_n;
        this.numberOfFlights = numberOfFlights;
        this.flightDistance = flightDistance;
        this.fuelCapacity = fuelCapacity;
        this.type = type;
        this.createdAt = createdAt;
        this.airCompID = airCompID;
    }
}
