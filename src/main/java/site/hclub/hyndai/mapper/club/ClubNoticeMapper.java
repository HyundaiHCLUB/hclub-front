package site.hclub.hyndai.mapper.club;

import site.hclub.hyndai.domain.club.ClubNotice;

import java.util.List;
import java.util.Optional;

public interface ClubNoticeMapper {
    void save(ClubNotice clubNotice);
    List<ClubNotice> findAll(Long clubNo);
    Optional<ClubNotice> findById(Long noticeNo);
    void updateViewCount(Long noticeNo);

}
