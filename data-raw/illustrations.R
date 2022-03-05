
library(httr)
library(dplyr)
library(stringr)

get_repo_svg <- function(repo, branch = "main") {
  req <- httr::GET(
    paste0("https://api.github.com/repos/", repo, "/git/trees/", branch, "?recursive=1")
  )

  data.frame(
    "path" = unlist(lapply(content(req)$tree, function(x) x$path))
  ) |>
    filter(str_detect(path, "\\.svg$")) |>
    transmute(
      repo = repo,
      name = str_extract(path, "(?<=/)[:graph:]+(?=.svg$)"),
      url = paste0("https://raw.githubusercontent.com/", repo, "/", branch, "/", path)
    )
}

illustrations <-
  get_repo_svg(repo = "streetmix/illustrations") |>
  tidyr::separate(col = "name", sep = "/", into = c("category", "name"), fill = "left") |>
  mutate(
    #    category = str_extract(name, ".+(?=/)"),
    side = case_when(
      str_detect(name, "left") ~ "left",
      str_detect(name, "right") ~ "right"
    ),
    direction = case_when(
      str_detect(name, "inbound") ~ "inbound",
      str_detect(name, "outbound") ~ "outbound"
    )
  ) |>
  filter(name != "_retired")

usethis::use_data(illustrations, overwrite = TRUE)
