package site.hclub.hyndai.repository.club;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;
import site.hclub.hyndai.domain.club.Club;
import site.hclub.hyndai.domain.club.ClubNotice;
import site.hclub.hyndai.dto.request.NoticeCreateRequest;
import site.hclub.hyndai.exception.ClubException;
import site.hclub.hyndai.exception.ClubNoticeException;
import site.hclub.hyndai.mapper.club.ClubMapper;
import site.hclub.hyndai.mapper.club.ClubNoticeMapper;

import java.util.List;

import static site.hclub.hyndai.exception.ClubExceptionType.INVALID_CLUB;
import static site.hclub.hyndai.exception.ClubNoticeExceptionType.INVALID_NOTICE;

@Slf4j
@Repository
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class ClubNoticeRepository {
    private final ClubNoticeMapper clubNoticeMapper;
    private final ClubMapper clubMapper;

    public ClubNotice save(NoticeCreateRequest noticeCreateRequest){
        getClubById(noticeCreateRequest.getClubNo());

        ClubNotice clubNotice = ClubNotice.builder()
                .noticeCreateRequest(noticeCreateRequest)
                .build();

        clubNoticeMapper.save(clubNotice);

        return clubNotice;
    }

    public List<ClubNotice> findAll(Long clubNo){
        getClubById(clubNo);
        return clubNoticeMapper.findAll(clubNo);
    }

    public ClubNotice findById(Long noticeNo){
        clubNoticeMapper.updateViewCount(noticeNo);
        return clubNoticeMapper.findById(noticeNo)
                .orElseThrow(() -> new ClubNoticeException(INVALID_NOTICE)
        );
    }

    private Club getClubById(Long clubNo) {
        return clubMapper.findById(clubNo)
                .orElseThrow(() -> new ClubException(INVALID_CLUB));
    }
}
