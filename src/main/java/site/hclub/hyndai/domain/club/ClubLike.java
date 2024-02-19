package site.hclub.hyndai.domain.club;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import site.hclub.hyndai.dto.request.LikeRequest;

@Getter
@Component
@RequiredArgsConstructor
public class ClubLike {
    private Long likeNo;
    private String isLiked;
    private Long memberNo;
    private Long clubNo;

    @Builder
    public ClubLike(LikeRequest likeRequest){
        this.isLiked = likeRequest.getIsLiked();
        this.memberNo = likeRequest.getMemberNo();
        this.clubNo = likeRequest.getClubNo();
    }
}
