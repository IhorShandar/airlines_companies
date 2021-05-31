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
@ToString(exclude = {"airplaneList", "flightListOfCompany"})
public class AirCompany {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int ID;
    String name;
    String companyType;
    String foundedAt;
    @JsonIgnore
    @OneToMany(mappedBy = "airCompany", fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    List<Airplane> airplaneList = new ArrayList<>();
    @JsonIgnore
    @OneToMany(mappedBy = "airCompany", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
    List<Flight> flightListOfCompany = new ArrayList<>();

    public AirCompany(String name, String companyType, String foundedAt) {
        this.name = name;
        this.companyType = companyType;
        this.foundedAt = foundedAt;
    }

    public AirCompany(int ID) {
        this.ID = ID;
    }
}
