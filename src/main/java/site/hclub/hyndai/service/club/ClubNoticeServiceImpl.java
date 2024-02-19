package site.hclub.hyndai.service.club;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import site.hclub.hyndai.domain.club.ClubNotice;
import site.hclub.hyndai.dto.request.NoticeCreateRequest;
import site.hclub.hyndai.repository.club.ClubNoticeRepository;

import java.util.List;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public class ClubNoticeServiceImpl implements ClubNoticeService{
    private final ClubNoticeRepository clubNoticeRepository;

    public ClubNotice save(NoticeCreateRequest noticeCreateRequest) {

        return clubNoticeRepository.save(noticeCreateRequest);
    }

    public List<ClubNotice> findAll(Long clubNo) {
        return clubNoticeRepository.findAll(clubNo);
    }

    public ClubNotice findById(Long noticeNo) {
        return clubNoticeRepository.findById(noticeNo);
    }
}
