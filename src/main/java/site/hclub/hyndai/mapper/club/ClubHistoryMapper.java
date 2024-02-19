package site.hclub.hyndai.mapper.club;

import site.hclub.hyndai.domain.club.ClubHistory;
import site.hclub.hyndai.dto.response.ClubHistoryGetResponse;

import java.util.List;
import java.util.Map;

public interface ClubHistoryMapper {
    void saveTitle(ClubHistory clubHistory);
    void saveImage(Map<String, Object> parameterMap);
    List<ClubHistoryGetResponse> findAll(Long clubNo);
    void deleteTitle(Long clubNo);
    void deleteImage(Long clubNo);

}
