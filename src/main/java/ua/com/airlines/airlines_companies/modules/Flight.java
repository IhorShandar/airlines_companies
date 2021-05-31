package ua.com.airlines.airlines_companies.modules;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode
@ToString(exclude = {"airplane", "airCompany"})
public class Flight {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int ID;
    String flightStatus;
    String departureCountry;
    String destinationCountry;
    double distance;
    String estimatedFlightTime;
    String endedAt;
    String delayStartedAt;
    String createdAt;
    int airCompID;
    int airplaneID;
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    Airplane airplane;
   // @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    AirCompany airCompany;

    public Flight(String flightStatus, String departureCountry, String destinationCountry, double distance, String estimatedFlightTime, String createdAt, int airCompID, int airplaneID) {
        this.flightStatus = flightStatus;
        this.departureCountry = departureCountry;
        this.destinationCountry = destinationCountry;
        this.distance = distance;
        this.estimatedFlightTime = estimatedFlightTime;
        this.createdAt = createdAt;
        this.airCompID = airCompID;
        this.airplaneID = airplaneID;
    }
}
