package site.hclub.hyndai.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ClubUpdateReponse {
    private String clubName;
    private String clubImage;
    private String clubInfo;
    private String clubLoc;
    private Long categoryId;
}
