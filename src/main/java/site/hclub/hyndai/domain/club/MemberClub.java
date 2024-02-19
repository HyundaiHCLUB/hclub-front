package site.hclub.hyndai.domain.club;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;
import site.hclub.hyndai.dto.request.MemberClubCreateRequest;

@Getter
@Setter
@Component
@RequiredArgsConstructor
public class MemberClub {
    private Long memberClubNo;
    private Long memberNo;
    private Long clubNo;
    private String creatorYn;

    @Builder
    public MemberClub(MemberClubCreateRequest memberClubCreateRequest){
        this.memberClubNo = memberClubCreateRequest.getClubNo();
        this.memberNo = memberClubCreateRequest.getMemberNo();
        this.clubNo = memberClubCreateRequest.getClubNo();
        this.creatorYn = memberClubCreateRequest.getCreatorYn();
    }
}
