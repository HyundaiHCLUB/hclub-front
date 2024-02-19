package site.hclub.hyndai.domain.club;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Getter
@Component
@RequiredArgsConstructor
public class ClubHistory {
    private Long historyNo;
    private String historyTitle;
    private Long clubNo;

    @Builder
    public ClubHistory(Long clubNo, String title){
        this.clubNo = clubNo;
        this.historyTitle = title;
    }
}
