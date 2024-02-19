package site.hclub.hyndai.dto.request;

import lombok.Data;

@Data
public class ClubRequest {
    private String clubName;
    private String clubImage;
    private String clubInfo;
    private String clubLoc;
    private Long categoryId;
    private Long memberNo;
    private String creatorYn;
}
