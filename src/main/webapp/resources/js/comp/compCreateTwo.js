// 데이터 로딩
document.addEventListener('DOMContentLoaded', function () {
    // 로컬 스토리지에서 이미지 불러오기
    let base64ImageData = localStorage.getItem('multipartFile');
    if (base64ImageData) {

        let imageElement = document.querySelector('.team-caption-image img');

        imageElement.src = base64ImageData;
    }
    // 팀장 이름 세팅
    const selectedMembers = JSON.parse(localStorage.getItem('selectedMembers'));

    if (selectedMembers && selectedMembers.length > 0) {
        // 첫 번째 멤버의 이름을 가져옵니다.
        const firstMemberName = selectedMembers[0].memberName;
        // .team-captain-name 내의 <p> 태그를 찾아 이름을 설정합니다.
        document.querySelector('.team-captain-name p').textContent = firstMemberName;
    }
});
document.addEventListener("DOMContentLoaded", function () {

    let globalProductData = [];
    const apiUrl = 'https://www.h-club.site/comp/products';
    const container = document.querySelector('.products'); // 제품들을 담을 컨테이너


    fetch(apiUrl)
        .then(response => response.json())
        .then(data => {
            globalProductData = data.data;


            data.data.forEach(product => {
                const productDiv = document.createElement('div'); // 각 제품을 담을 div 생성
                productDiv.classList.add('product-item'); // CSS 클래스 추가

                // Create radio input
                const radioInput = document.createElement('input');
                radioInput.setAttribute('type', 'radio');
                radioInput.setAttribute('name', 'product');
                radioInput.setAttribute('value', product.productId);
                radioInput.setAttribute('id', `product`);

                const label = document.createElement('label');
                label.setAttribute('for', `product` + product.productId);
                label.textContent = product.productName;


                productDiv.appendChild(radioInput);
                productDiv.appendChild(label);


                container.appendChild(productDiv);

                productDiv.addEventListener('click', function () {
                    radioInput.checked = true;
                });
            });
        })
        .catch(error => console.error('Error fetching products:', error));

    $('#goNextButton').click(function () {
        const selectedDate = $('#dateSelectInput').val();
        const selectedTime = $('#timeSelectInput').val();


        const selectedProductId = $('input[name="product"]:checked').val();

        const selectedProduct = globalProductData.find(product => product.productId == selectedProductId);

        if (selectedProduct) {

            const teamProduct = {
                productId: selectedProduct.productId,
                productName: selectedProduct.productName,
                productPrice: selectedProduct.productPrice
            };

            localStorage.setItem('teamProduct', JSON.stringify(teamProduct));
        }


        localStorage.setItem('matchDate', selectedDate);
        localStorage.setItem('matchTime', selectedTime);


    });
});


// 이전 페이지 이동
document.addEventListener('DOMContentLoaded', function () {
    var goBackButton = document.getElementById('goBackButton');
    goBackButton.addEventListener('click', function () {
        window.history.back();
    });
});

// 다음 페이지 이동
document.addEventListener('DOMContentLoaded', function () {
    var goNextButton = document.getElementById('goNextButton');
    goNextButton.addEventListener('click', function () {

        let matchDate = localStorage.getItem("matchDate");
        let matchTime = localStorage.getItem("matchDate");
        let teamProduct = localStorage.getItem("teamProduct");
        if (matchDate === '') {
            alert('날짜를 입력해주세요');
            return;
        }


        window.location.href = '/competition/create/3';
    });
});


$(document).ready(function () {
    // DatePicker & Timepicker
    $('.datepicker')
        .datepicker({
            dateFormat: 'yy-mm-dd'//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
        })
        .on('changeDate', function (e) {
            console.log(e);
            // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다.
        });

    $('#timeSelectInput').timepicker({
        timeFormat: 'HH:mm',
        interval: 15,
        minTime: '00:00',
        maxTime: '23:30',
        defaultTime: '11',
        startTime: '00:00',
        dynamic: true,
        dropdown: true,
        scrollbar: true
    });

    $.datepicker.regional['ko'] = {
        closeText: '닫기',
        prevText: '이전 달',
        nextText: '다음 달',
        currentText: '오늘',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월',
            '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월',
            '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        weekHeader: '주',
        dateFormat: 'yy년 mm월 dd일',
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: '년'
    };
    $.datepicker.setDefaults($.datepicker.regional['ko']);
    let adjustCalendarSize = function (input, inst) {
        let calendar = inst.dpDiv;
        setTimeout(function () {
            let inputWidth = $(input).outerWidth();
            calendar.outerWidth(inputWidth);
            calendar.outerHeight(400); // 예시로 높이를 300px로 설정
        }, 0);
    };

    $('#dateSelectInput').datepicker({
        dateFormat: 'yy년 mm월 dd일',
        onSelect: function (dateText) {
            $(this).val(dateText);
        },
        beforeShow: function (input, inst) {
            adjustCalendarSize(input, inst);
        },
        onChangeMonthYear: function (year, month, inst) {
            adjustCalendarSize(this, inst);
        }
    });
});

