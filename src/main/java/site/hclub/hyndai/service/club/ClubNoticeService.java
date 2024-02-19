package site.hclub.hyndai.service.club;

import site.hclub.hyndai.domain.club.ClubNotice;
import site.hclub.hyndai.dto.request.NoticeCreateRequest;

import java.util.List;

public interface ClubNoticeService {
    ClubNotice save(NoticeCreateRequest noticeCreateRequest);
    List<ClubNotice> findAll(Long clubNo);

    ClubNotice findById(Long noticeNo);

}
