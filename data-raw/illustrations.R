library(httr)
library(dplyr)
library(stringr)

get_repo_svg <- function(repo, branch = "main") {
  req <- httr::GET(
    paste0("https://api.github.com/repos/", repo, "/git/trees/", branch, "?recursive=1")
  )

  data.frame(
    "path" = unlist(lapply(content(req)$tree, function(x) x$path))
  ) %>%
    filter(str_detect(path, "\\.svg$")) %>%
    transmute(
      repo = repo,
      name = str_extract(path, "(?<=/)[:graph:]+(?=.svg$)"),
      url = paste0("https://raw.githubusercontent.com/", repo, "/", branch, "/", path)
    )
}

illustrations_repo <- get_repo_svg(repo = "streetmix/illustrations")

illustrations <- illustrations_repo %>%
  filter(!str_detect(name, "_retired")) |>
  tidyr::separate(col = "name", sep = "/", into = c("category", "name"), fill = "left") %>%
  mutate(
    #    category = str_extract(name, ".+(?=/)"),
    side = case_when(
      str_detect(name, "left") ~ "left",
      str_detect(name, "right") ~ "right"
    ),
    direction = case_when(
      str_detect(name, "inbound") ~ "inbound",
      str_detect(name, "outbound") ~ "outbound"
    ),
    orientation = case_when(
      str_detect(name, "parallel") ~ "parallel",
      str_detect(name, "perpendicular") ~ "perpendicular",
      str_detect(name, "sideways") ~ "sideways",
      str_detect(name, "angled") ~ "angled"
    ),
    width_type = case_when(
      str_detect(name, "narrow") ~ "narrow",
      str_detect(name, "wide") ~ "wide"
    )
  )

usethis::use_data(illustrations, overwrite = TRUE)
