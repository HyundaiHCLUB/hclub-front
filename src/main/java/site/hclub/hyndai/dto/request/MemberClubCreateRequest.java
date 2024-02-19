package site.hclub.hyndai.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
public class MemberClubCreateRequest {
    private Long memberNo;
    private Long clubNo;
    private String creatorYn;

    public MemberClubCreateRequest(){

    }
}
