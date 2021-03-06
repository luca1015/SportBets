
package sportbets.proyecto.model;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "homeTeam",
    "awayTeam"
})
@Generated("jsonschema2pojo")
public class Penalties {

    @JsonProperty("homeTeam")
    private Object homeTeam;
    @JsonProperty("awayTeam")
    private Object awayTeam;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("homeTeam")
    public Object getHomeTeam() {
        return homeTeam;
    }

    @JsonProperty("homeTeam")
    public void setHomeTeam(Object homeTeam) {
        this.homeTeam = homeTeam;
    }

    @JsonProperty("awayTeam")
    public Object getAwayTeam() {
        return awayTeam;
    }

    @JsonProperty("awayTeam")
    public void setAwayTeam(Object awayTeam) {
        this.awayTeam = awayTeam;
    }

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

}
