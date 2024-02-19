package site.hclub.hyndai.domain.club;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;
import site.hclub.hyndai.dto.request.NoticeCreateRequest;

@Getter
@Setter
@Component
@RequiredArgsConstructor
public class ClubNotice {
    private Long noticeNo;
    private String noticeTitle;
    private String noticeContent;
    private int noticeView;
    private Long clubNo;

    @Builder
    public ClubNotice(NoticeCreateRequest noticeCreateRequest){
        this.noticeTitle = noticeCreateRequest.getNoticeTitle();
        this.noticeContent = noticeCreateRequest.getNoticeContent();
        this.noticeView = 0;
        this.clubNo = noticeCreateRequest.getClubNo();
    }
}
