package site.hclub.hyndai.exception;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import site.hclub.hyndai.common.advice.BusinessExceptionType;

@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public enum ClubLikeExceptionType  implements BusinessExceptionType {

    /**
     * 400 Bad Request
     */
    NOT_IS_LIKED(HttpStatus.BAD_REQUEST, "좋아요를 한 적이 없는 동아리입니다."),

    /**
     * 404 Not Found
     */


    /**
     * 409 CONFLICT
     */
    ALREADY_EXIST_LIKE(HttpStatus.CONFLICT, "이미 좋아요를 한 동아리입니다.")

    ;
    private final HttpStatus status;
    private final String message;

    @Override
    public HttpStatus status() {
        return this.status;
    }

    @Override
    public String message() {
        return this.message;
    }
}

