package site.hclub.hyndai.mapper.club;

import site.hclub.hyndai.domain.club.Club;
import site.hclub.hyndai.domain.club.MemberClub;
import site.hclub.hyndai.dto.request.ClubUpdateRequest;

import java.util.List;
import java.util.Optional;

public interface ClubMapper {
    Long save(Club club);
    void saveMember(MemberClub memberClub);
    List<Club> findAll();
    List<Club> findAllByCategoryId(Long categoryId);
    Optional<Club> findById(Long clubId);

    List<Club> findAllByKeyword(String keyword);

    void update(ClubUpdateRequest clubUpdateRequest);

    void delete(Long clubNo);

}
