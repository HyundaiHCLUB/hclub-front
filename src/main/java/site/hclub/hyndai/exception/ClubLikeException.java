package site.hclub.hyndai.exception;

import site.hclub.hyndai.common.advice.BusinessException;
import site.hclub.hyndai.common.advice.BusinessExceptionType;

public class ClubLikeException extends BusinessException {
    public ClubLikeException(BusinessExceptionType exceptionType) {
        super(exceptionType);
    }
}
