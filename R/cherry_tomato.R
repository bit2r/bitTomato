#' @docType data
#' @keywords datasets
#' @name tomato
#' @usage data(cherry_tomato)
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
#   mutate(contents = str_remove_all(contents, "\\[[[:print:]]*\\]\\s*|&\\w+;")) |>
#   mutate(contents = str_remove(contents, "\\w+ \\w*기자 [0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}")) |>
#   mutate(contents = str_remove(contents, "사진/\\s*(\\w+\\s*){1,5}$")) |>
#   mutate(contents = str_squish(contents)) |>
#   drop_na() |>
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
#   ungroup() |>
#   select(-contents_origin, -len_contents, -len_title)
#
# save(cherry_tomato, file = "data/cherry_tomato.rda")
