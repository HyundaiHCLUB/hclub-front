package site.hclub.hyndai.common.advice;
import org.springframework.http.HttpStatus;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
@Getter
@RequiredArgsConstructor(access = AccessLevel.PRIVATE)
public enum CommonExceptionType implements BusinessExceptionType {
    /**
     * 400 Bad Request
     */
    REQUEST_VALIDATION_EXCEPTION(HttpStatus.BAD_REQUEST, "형식적 유효성 검사에 올바르지 않는 요청 값입니다"),
    HEADER_REQUEST_MISSING_EXCEPTION(HttpStatus.BAD_REQUEST, "요청에 필요한 헤더값이 존재하지 않습니다."),
    VALIDATION_WRONG_HTTP_REQUEST(HttpStatus.BAD_REQUEST, "허용되지 않는 문자열이 입력되었습니다."),
    UNSUPPORTED_IMAGE_EXTENSION(HttpStatus.BAD_REQUEST, "이미지 확장자는 jpg, png, webp만 가능합니다."),
    UNSUPPORTED_IMAGE_SIZE(HttpStatus.BAD_REQUEST, "이미지 사이즈는 5MB를 넘을 수 없습니다."),

    /**
     * 401 Unauthorized
     */
    FAIL_TO_AUTHENTICATE_JWT_TOKEN(HttpStatus.UNAUTHORIZED, "내부 인증 필터를 거치는 데 실패한 액세스 토큰입니다"),
    TOKEN_NOT_CONTAINS_USER_ID(HttpStatus.UNAUTHORIZED, "리프레시 토큰은 유저 아이디를 담고있지 않습니다."),

    /**
     * 405 Method Not Allowed
     */
    INVALID_HTTP_METHOD(HttpStatus.METHOD_NOT_ALLOWED, "지원되지 않는 HTTP Method 요청입니다.")
    /**
     * 500 Internal Server Error
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
