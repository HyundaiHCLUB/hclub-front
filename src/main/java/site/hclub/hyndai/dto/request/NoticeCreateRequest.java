package site.hclub.hyndai.dto.request;

import lombok.Data;

@Data
public class NoticeCreateRequest {
    private String noticeTitle;
    private String noticeContent;
    private Long clubNo;
}
