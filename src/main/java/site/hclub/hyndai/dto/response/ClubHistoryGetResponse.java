package site.hclub.hyndai.dto.response;

import lombok.Builder;
import lombok.Data;


@Data
@Builder
public class ClubHistoryGetResponse {
    private Long historyNo;
    private String title;
    private String imageUrl;
    private Long clubNo;
}
