package site.hclub.hyndai.dto.request;

import lombok.Data;

@Data
public class ClubUpdateRequest {
    private Long clubNo;
    private String clubName;
    private String clubImage;
    private String clubInfo;
    private String clubLoc;
    private Long categoryId;
}
