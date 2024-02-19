package site.hclub.hyndai.common.response;
import org.springframework.http.HttpStatus;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public enum SuccessType {
    /**
     * 200 Ok
     */

    GET_CLUB_BY_CATEGORY_SUCCESS(HttpStatus.OK, "카테고리별 동아리 리스트 조회에 성공했습니다."),
    GET_CLUB_LIST_SUCCESS(HttpStatus.OK, "동아리 전체 리스트 조회에 성공했습니다."),
    UPDATE_CLUB_SUCCESS(HttpStatus.OK, "동아리 수정에 성공했습니다."),
    DELETE_CLUB_SUCCESS(HttpStatus.OK, "동아리 개설 취소에 성공했습니다."),
    SEARCH_CLUB_SUCCESS(HttpStatus.OK, "동아리 검색에 성공했습니다."),

    GET_CLUB_NOTICE_SUCCESS(HttpStatus.OK, "동아리 공지사항 리스트 조회에 성공했습니다."),
    GET_CLUB_DETAIL_NOTICE_SUCCESS(HttpStatus.OK, "동아리 공지사항 상세 조회에 성공했습니다."),

    GET_CLUB_HISTORY_SUCCESS(HttpStatus.OK, "동아리 기록 리스트 조회에 성공했습니다."),
    DELETE_CLUB_HISTORY_SUCCESS(HttpStatus.OK, "동아리 기록 삭제에 성공했습니다."),

    DELETE_LIKE_SUCCESS(HttpStatus.OK, "동아리 좋아요 취소에 성공했습니다."),
    GET_CLUB_ORDER_BY_LIKE(HttpStatus.OK, "좋아요순으로 동아리 리스트 조회에 성공했습니다"),



    /**
     * 201 Created
     */
    CREATE_CLUB_SUCCESS(HttpStatus.CREATED, "동아리 개설에 성공했습니다."),
    CREATE_CLUB_NOTICE_SUCCESS(HttpStatus.CREATED, "동아리 공지사항 등록에 성공했습니다."),
    APPLY_CLUB_SUCCESS(HttpStatus.CREATED, "동아리 신청에 성공했습니다."),
    CREATE_CLUB_HISTORY_SUCCESS(HttpStatus.CREATED, "동아리 기록에 성공했습니다."),
    CREATE_LIKE_SUCCESS(HttpStatus.CREATED, "동아리 좋아요 추가에 성공했습니다")
    ;

    private final HttpStatus httpStatus;
    private final String message;

    public int getHttpStatusCode() {
        return httpStatus.value();
    }
}
