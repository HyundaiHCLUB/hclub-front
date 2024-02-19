package site.hclub.hyndai.service.club;

import org.springframework.web.multipart.MultipartFile;
import site.hclub.hyndai.dto.request.HistoryCreateRequest;
import site.hclub.hyndai.dto.response.ClubHistoryGetResponse;
import site.hclub.hyndai.dto.response.ClubHistoryResponse;

import java.util.List;

public interface ClubHistoryService {
    ClubHistoryResponse save(Long clubNo, List<MultipartFile> image, HistoryCreateRequest historyCreateRequest);
    List<ClubHistoryGetResponse> findAll(Long clubNo);
    void delete(Long clubNo);
}
