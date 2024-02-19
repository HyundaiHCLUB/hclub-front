package site.hclub.hyndai.exception;

import site.hclub.hyndai.common.advice.BusinessException;
import site.hclub.hyndai.common.advice.BusinessExceptionType;

public class ClubNoticeException  extends BusinessException {
    public ClubNoticeException(BusinessExceptionType exceptionType) {
        super(exceptionType);
    }
}