#' 방울토마토 - 뉴스토마토 뉴스 기사 샘플 데이터
#'
#' @description
#' 간단한 분석 실습을 위한 뉴스토마토의 뉴스의 샘플 데이터
#'
#' @details
#' 기자가 "인포머셜" 제외하고 정치, 산업, 사회 3개 카테고리 기준으로 뉴스 본문의
#' 길이가 25분위에서 75분위 사이 각각 100개 뉴스기사를 추출함.
#' 데이터셋의 이름은 작은 크기의 데이터셋이므로 방울토마토(cherry tomato)로 명명함.
#'
#' @format 300 관측치와 8개의 변수를 포함하는 tibble 객체임. 변수들은 다음과 같음.:
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
#' @name cherry_tomato
#' @usage data(cherry_tomato)
#' @source {
#' "뉴스토마토 뉴스 기사 샘플링" in <https://www.newstomato.com/>, License : GPL-3
#' }
NULL

# library(tidyverse)
#
# raw <- readxl::read_xlsx(
#   "inst/data-raw/뉴스토마토_데이터_230720.xlsx",
#   range = "R2C2:R164268C11",
#   col_names = c("title", "url", "contents_origin", "contents_2", "contents_3",
#                 "contents", "author", "create_dt", "category", "subcategory")) |>
#   select(-contents_2, -contents_3)
#
# samples <- raw |>
#   filter(author != "인포머셜") |>
#   filter(category %in% c("정치", "산업", "사회"))
#
# samples <- samples |>
#   filter(str_detect(create_dt, "-")) |>
#   mutate(create_dt = glue::glue("{create_dt}:00")) |>
#   bind_rows(
#     samples |>
#       filter(!str_detect(create_dt, "-")) |>
#       mutate(create_dt = str_split(create_dt, "\\.") |>
#                unlist() |>
#                (\(.) glue::glue("{janitor::excel_numeric_to_date(as.integer(.[1]))} {kimisc::seconds.to.hms(86400 * as.numeric(paste0('.', ifelse(is.na(.[2]), 0, .[2]))) + 1)}"))())
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
# desc_stat <- samples |>
#   drop_na() |>
#   mutate(길이 = str_length(contents)) |>
#   summarise(median = median(길이),
#             q25    = quantile(길이, 0.25),
#             q75    = quantile(길이, 0.75))
#
# set.seed(123L)
# cherry_tomato <- samples |>
#   mutate(len_contents = str_length(contents),
#          len_title = str_length(title)) |>
#   filter(len_title > 20) |>
#   filter(len_contents > desc_stat$q25 & len_contents < desc_stat$q75) |>
#   group_by(category) |>
#   slice_sample(n = 100) |>
#   select(-len_contents, -len_title)
#
# save(cherry_tomato, file = "data/cherry_tomato.rda")
