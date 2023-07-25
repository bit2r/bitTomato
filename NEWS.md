# bitTomato 0.2.1.9000

## NEW FEATURES

* "방울 토마토" 데이터셋 추가 (#12, thanks to @statkclee)
    - 정치, 산업, 사회 3개 카테고리의 각 100개 샘플링 뉴스기사

## MAJOR CHANGES

* 정제 전후 데이터의 기준 변경 (#13)
    - 기존의 정제 전 기사 본문 제거하고 (사용하지 않고),
    - 기존의 정제 후 기사 본문을
        - tomato_origin로,
    - 기존의 정제 후 기사 본문 추가로 정제해서
        - tomato로 배포
    
## BUG FIX

* 데이터에서 기사 제목 및 기사 내용 정제 (#11, thanks to @statkclee)
    - 중복되는 화이트스페이스
    - 일부 HTML 코드
    - 기사와 무관한 본문의 기자정보 및 기자 이메일 주소, 사진 출처
    
* 2022년 7월 8월 기사 누락 건 수정 (#14, thanks to @sens5900r)


    
# bitTomato 0.1.0

## NEW FEATURES

* 기사 작성일자 오류 수정 (#9)
    - 기사 작성일이 2020년도 미만의 기사 43건 제거
    - 포맷 오류로 미인식되던 작성일자 9,283건 인식
        
        
        
# bitTomato 0.0.2

## NEW FEATURES

* 데이터 용량 이슈로 인한 데이터셋 분리 (#8)
    - 기사 정제 전 데이터 셋: 98MB
        - tomato_origin
    - 기사 정제 후 데이터 셋: 87MB
        - tomato

# bitTomato 0.0.1

## NEW FEATURES

* Original news R data

