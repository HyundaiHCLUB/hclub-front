package site.hclub.hyndai.domain.club;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;
import site.hclub.hyndai.dto.request.ClubCreateRequest;

import java.time.LocalDateTime;

@Getter
@Setter
@Component
@RequiredArgsConstructor
public class Club {
    private Long clubNo;
    private String clubName;
    private String clubImage;
    private String clubInfo;
    private String clubLoc;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
    private String useYn;
    private Long categoryId;

    @Builder
    public Club(ClubCreateRequest clubCreateRequest){
        clubName = clubCreateRequest.getClubName();
        clubImage = clubCreateRequest.getClubImage();
        clubInfo = clubCreateRequest.getClubInfo();
        clubLoc = clubCreateRequest.getClubLoc();
        categoryId = clubCreateRequest.getCategoryId();
        createdAt = LocalDateTime.now();
        useYn = "N";
    }

}
