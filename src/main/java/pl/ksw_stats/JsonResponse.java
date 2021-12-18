package pl.ksw_stats;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JsonResponse {

    private String response;
    private Object object;
    public JsonResponse(String response) {
        this.response = response;
        this.object = null;
    }
}
