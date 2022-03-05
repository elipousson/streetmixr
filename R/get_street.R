#' Get data on a Streetmix street
#'
#'
#' @param url Streetmix url to get data on
#' @param user_id Streetmix user account ID
#' @param street_id Streetmix street ID
#' @param count Count of streets to return
#' @param return Type of data to return based on url: "data", "street",
#'   "location", or "segments". If NULL, return full response.
#' @export
#' @importFrom httr2 url_parse
get_street <- function(url = NULL,
                       user_id = NULL,
                       street_id = NULL,
                       count = NULL,
                       return = "data") {
  if (!is.null(url)) {
    url <- httr2::url_parse(url)
    creatorId <- strsplit(url$path, "/")[[1]][2]
    namespacedId <- strsplit(url$path, "/")[[1]][3]

    data <-
      req_streetmix(
        template = "api/v1/streets/?namespacedId={namespacedId}&creatorId={creatorId}",
        namespacedId = namespacedId,
        creatorId = creatorId
      )

    if (!is.null(return)) {

      return <- match.arg(return, c("data", "street", "location", "segments"))

      data <-
        switch(return,
          "data" = data$data,
          "street" = data$data$street,
          "location" = data$data$street$location,
          "segments" = data$data$street$segments
        )
    }
  } else if (!is.null(user_id)) {
    data <- req_streetmix(
      template = "api/v1/users/{user_id}/streets/",
      user_id = user_id
    )
  } else if (!is.null(street_id)) {
    data <- req_streetmix(
      template = "api/v1/streets/{street_id}/",
      street_id = street_id
    )
  } else if (!is.null(count)) {
    data <- req_streetmix(
      template = "api/v1/streets?count={count}",
      count = count
    )
  }

  return(data)
}

#' Create an HTTP request for the Streetmix API
#'
#' @param base_url Base url for Streetmix API
#' @param template Template to use for request url
#' @param ... Additional parameters passed to httr2::req_template
#' @noRd
#' @importFrom httr2 request req_template req_user_agent req_url_query req_perform resp_body_json
req_streetmix <- function(base_url = "https://streetmix.net",
                          template = NULL,
                          ...) {
  req <-
    httr2::request(base_url) |>
    httr2::req_template(
      template = template,
      ...
    ) |>
    httr2::req_user_agent("streetmixr (https://elipousson.github.io/streetmixr)") |>
    httr2::req_url_query(
      "config.transitional.forcedJSONParsing" = "false",
    ) |>
    httr2::req_perform()

  req |>
    httr2::resp_body_json(simplifyVector = TRUE)
}

