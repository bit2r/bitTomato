
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bitTomato <img src="figures/logo.png" align="right" height="120" width="103.6"/>

bitTomato는 “한글 텍스트 데이터 분석의 학습을 위한 실 데이터를
오픈소스로 제공”한다는 목적에 공감하는 뉴스토마토가 제공한 뉴스 기사를,
한국 R 사용자회가 저작 배포하는 R 패키지입니다.

## 이력

- 2023-06-07: 뉴스토마토와 한국 R 사용자회 “데이터 제공 및 이용에 관한
  협약서” 체결
- 2023-07-07: 뉴스토마토 뉴스 원본 데이터 한국 R 사용자회 전달
- 2023-07-17: GitHub 저장소 생성 (`bit2r/bitTomato`)
- 2023-07-22: bitTomato 패키지 github 최초 공개

## 데이터 현황

- 기간: 2020.01.01 ~ 2022.12.31 (3년치)
- 건수: 164,224
- 기사내용: 기사 제목과 본문
  - 기사 본문은 HTML 태크 등 전처리하지 않은 본문과 전처리한 본문의
    데이터셋으로 분리 배포
  - 전처리하지 않은 본문 데이터셋은 텍스트 전처리 학습으로 활용 가능
- 개별 기사 메타데이터:
  - 기사 원문 URL
  - 기사 작성 일시
  - 기사 작성자
  - 기사 중분류
  - 기사 분류

## 설치

github 리파지토리로부터 다음의 명령어로 패키지를 설치합니다.:

``` r
devtools::install_github("bit2r/bitTomato")
```

## 고마운 분들

bitTomato는 다음 오픈소스 기여자의 리소스를 사용하거나 참조하였습니다.:

- 뉴스토마토
  - <a href="https://www.newstomato.com/" target="_blank">뉴스토마토
    홈페이지</a>

## 도움요청

bitTomato의 발전을 위해서 버그에 대한 리포팅, 기능 개선을 위한
요구사항들은 <a href="https://github.com/bit2r/bitTomato/issues"
target="_blank">여기에</a>에 문제를 제기하거나 요청해주세요. 특히 버그는
최소한의 재현 가능한 예제와 함께 제출바랍니다.

## 기여자 행동 강령

이 프로젝트는
<a href="https://github.com/bit2r/bitTomato/blob/main/CONDUCT.md"
target="_blank">Contributor Code of Conduct(기여자 행동 강령)</a>과 함께
릴리스되었습니다. 이 프로젝트에 참여함으로써 귀하는 해당 조건을 준수하는
데 동의하는 것입니다.
