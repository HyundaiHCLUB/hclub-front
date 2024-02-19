package site.hclub.hyndai.exception;

import site.hclub.hyndai.common.advice.BusinessException;
import site.hclub.hyndai.common.advice.BusinessExceptionType;

public class ClubException extends BusinessException {

    public ClubException(BusinessExceptionType exceptionType) {
        super(exceptionType);
    }
}