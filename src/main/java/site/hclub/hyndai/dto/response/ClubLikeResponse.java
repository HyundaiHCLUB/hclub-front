package site.hclub.hyndai.dto.response;

import lombok.Data;

@Data
public class ClubLikeResponse {
    private Long clubNo;
    private String clubName;
    private String clubImage;
    private String clubLoc;
    private Long categoryId;
    private int likeCount;
}
