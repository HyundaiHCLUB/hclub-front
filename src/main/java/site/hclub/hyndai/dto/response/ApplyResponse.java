package site.hclub.hyndai.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class ApplyResponse {
    private Long memberNo;
    private Long clubNo;
    private String creatorYn;
}
