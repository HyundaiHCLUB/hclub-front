package site.hclub.hyndai.dto.request;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class LikeRequest {
    private String isLiked;
    private Long memberNo;
    private Long clubNo;
}
