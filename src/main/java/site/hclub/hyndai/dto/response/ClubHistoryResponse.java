package site.hclub.hyndai.dto.response;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class ClubHistoryResponse {
    private Long historyNo;
    private String title;
    private List<String> imageUrl;
    private Long clubNo;
}
