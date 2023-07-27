#' 뉴스토마토 뉴스 기사 데이터
#'
#' @description
#' 언론사인 뉴스토마토의 3년치 뉴스 기사와 이중에서 샘플링된 작은 뉴스기사 데이터
#'
#' @details
#' tomato 데이터셋은 뉴스토마토의 2020.01.01 ~ 2022.12.31까지의 3년치 기사 데이터로,
#' 어느 정도 정제된 기사로 HTML 태그 등이 정제되어 있음.
#' cherry_tomato 데이터셋은 정치, 산업, 사회 3개 카테고리 기준으로 뉴스 본문의
#' 길이가 25분위에서 75분위 사이 각각 100개 뉴스기사를 추출함. (300 관측치)
#' 데이터셋의 이름은 작은 크기의 데이터셋이므로 방울토마토(cherry tomato)로 명명함.
#'
#' @format 160,936 관측치와 7개의 변수를 포함하는 tibble 객체임. 변수들은 다음과 같음.:
#' \describe{
#'   \item{title}{뉴스 기사 제목}
#'   \item{url}{뉴스 기사 원본이 게시된 URL 주소}
#'   \item{contents}{어느 정도 정제된 뉴스 기사}
#'   \item{author}{뉴스 기사를 작성한 저자나 기관}
#'   \item{create_dt}{뉴스 기사를 생성한 일시.}
#'   \item{category}{뉴스 기사의 카테고리}
#'   \item{subcategory}{뉴스 기사의 서브 카테고리.}
#' }
#' @docType data
#' @keywords datasets
#' @name tomato
#' @usage data(tomato)
#' @source {
#' "뉴스토마토 뉴스 기사 제공" in <https://www.newstomato.com/>, License : GPL-3
#' }
NULL

# library(tidyverse)
#
# rows <- readxl::read_xlsx(
#   "inst/data-raw/뉴스토마토_데이터_230720.xlsx",
#   range = "R2C2:R164268C11",
#   col_names = c("title", "url", "contents_origin", "contents_2", "contents_3",
#                 "contents", "author", "create_dt", "category", "subcategory"),
#   col_types = rep("text", 10)) |>
#   select(-contents_2, -contents_3)
#
# tomato <- rows |>
#   filter(!author %in% "인포머셜") |>
#   filter(str_detect(create_dt, "-")) |>
#   mutate(create_dt = glue::glue("{create_dt}:00")) |>
#   bind_rows(
#     rows |>
#       filter(!str_detect(create_dt, "-")) |>
#       mutate(create_ymd = janitor::excel_numeric_to_date(as.integer(str_remove(create_dt, "\\.\\w+$")))) |>
#       mutate(create_hms = hms::new_hms(86400 * as.numeric(str_remove(create_dt, "^\\w+")) + 1)) |>
#       mutate(create_hms = paste(substr(create_hms, 1, 5), "00", sep = ":")) |>
#       mutate(create_dt = paste(create_ymd, create_hms)) |>
#       select(-create_ymd, -create_hms)
#   ) |>
#   mutate(create_dt = lubridate::as_datetime(create_dt, tz = "Asia/Seoul")) |>
#   filter(create_dt >= "2020-01-01") |>
#   mutate(title = str_remove_all(title, "&\\w+;")) |>
#   mutate(title = str_squish(title)) |>
#   mutate(contents_origin = contents) |>
#   mutate(contents = str_remove_all(contents, "\\[[[:print:]]*\\]\\s*|&\\w+;")) |>
#   mutate(contents = str_remove(contents, "\\w+ \\w*기자 [0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}")) |>
#   mutate(contents = str_remove(contents, "사진/\\s*(\\w+\\s*){1,5}$")) |>
#   mutate(contents = str_squish(contents)) |>
#   arrange(create_dt)
#
# tomato_origin <- tomato |>
#    select(-contents)
# tomato <- tomato |>
#    select(-contents_origin)
#
# save(tomato, file = "data/tomato.rda", compress = "xz")
# save(tomato_origin, file = "orign_data/tomato_origin.rda", compress = "xz")
#
# tomato |>
#   select(contents) |>
#   filter(row_number() <= 50) |>
#   as.data.frame()
