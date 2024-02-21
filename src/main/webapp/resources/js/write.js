function checkValue() {
    const form = document.boardForm;
    const subject = form.boardSubject.value;
    const content = form.boardContent.value;

    if(!subject){
        alert("제목을 입력해주세요.");
        return false;
    }
    else if(!content){
        alert("내용을 입력해주세요.");
        return false;
    }

}