#' 뉴스토마토 뉴스 기사 데이터
#'
#' @description
#' 언론사인 뉴스토마토의 뉴스 기사로 정제되지 않은 기사와 정제된 기사를 포함
#'
#' @details
#' 2020.01.01 ~ 2022.12.31까지의 3년치 기사 데이터로,
#' tomato_origin 데이터셋의 기사는 정제되지 않은 기사로 HTML 태그 등이 포함되어 있으며,
#' tomato 데이터셋의 기사는 어느 정도 정제된 기사로 HTML 태그 등이 어느 정도 정제되어 있음
#'
#' @format 164224 관측치와 각각 7개의 변수를 포함하는 tibble 객체임. 변수들은 다음과 같음.:
#' \describe{
#'   \item{title}{뉴스 기사 제목}
#'   \item{url}{뉴스 기사 원본이 게시된 URL 주소}
#'   \item{contents_origin}{정제되지 않은 뉴스 기사}
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
#' @usage data(tomato_origin)
#' @source {
#' "뉴스토마토 뉴스 기사 샘플링" in <https://www.newstomato.com/>, License : GPL-3
#' }
NULL

# library(tidyverse)
#
# tomato <- readxl::read_xlsx(
#   "inst/data-raw/뉴스토마토_데이터_230720.xlsx",
#   range = "R2C2:R164268C11",
#   col_names = c("title", "url", "contents_origin", "contents_2", "contents_3",
#                 "contents", "author", "create_dt", "category", "subcategory")) |>
#   select(-contents_2, -contents_3)
#
# tomato <- tomato |>
#   filter(str_detect(create_dt, "-")) |>
#   mutate(create_dt = glue::glue("{create_dt}:00")) |>
#   bind_rows(
#     tomato |>
#       filter(!str_detect(create_dt, "-")) |>
#       mutate(create_dt = str_split(create_dt, "\\.") |>
#                unlist() |>
#                (\(.) glue::glue("{janitor::excel_numeric_to_date(as.integer(.[1]))} {kimisc::seconds.to.hms(86400 * as.numeric(paste0('.', ifelse(is.na(.[2]), 0, .[2]))) + 1)}"))())
#   ) |>
#   mutate(create_dt = lubridate::as_datetime(create_dt, tz = "Asia/Seoul")) |>
#   filter(create_dt >= "2020-01-01") |>
#   arrange(create_dt)
#
# tomato_origin <- tomato |>
#    select(-contents)
# tomato <- tomato |>
#    select(-contents_origin)
#
# save(tomato, file = "data/tomato.rda", compress = "xz")
# save(tomato_origin, file = "data/tomato_origin.rda", compress = "xz")
