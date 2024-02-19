package site.hclub.hyndai.dto.request;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ClubCreateRequest {
    private String clubName;
    private String clubImage;
    private String clubInfo;
    private String clubLoc;
    private Long categoryId;
}
