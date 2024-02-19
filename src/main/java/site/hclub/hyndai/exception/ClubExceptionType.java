package site.hclub.hyndai.exception;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import site.hclub.hyndai.common.advice.BusinessExceptionType;

@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public enum ClubExceptionType implements BusinessExceptionType {

    /**
     * 400 Bad Request
     */
    INVALID_CLUB(HttpStatus.BAD_REQUEST, "유효하지 않는 동아리입니다.")

    /**
     * 404 Not Found
     */


    /**
     * 409 CONFLICT
     */

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
