#' Streetmix CC-BY-SA illustrations
#'
#' Data frame with links to SVG files with StreetMix illustrations
#' <https://github.com/streetmix/illustrations>
#'
#' Illustrations available under an attribution-share alike license
#' <https://github.com/streetmix/illustrations/blob/main/LICENSE>
#'
#' For design guidelines and colors see the illustration guide
#' <https://docs.streetmix.net/contributing/illustrations/design-principles>
#'
#' @format A data frame with 257 rows and 6 variables:
#' \describe{
#'   \item{\code{repo}}{repository}
#'   \item{\code{name}}{illustration name}
#'   \item{\code{url}}{SVG file url}
#'   \item{\code{category}}{category/folder}
#'   \item{\code{side}}{facing side (left or right)}
#'   \item{\code{direction}}{direction of movement (inbound or outbound)}
#' }
#' @md
"illustrations"


#' Streetmix CC-BY-SA illustrations of people
#'
#' @format A data frame with 36 rows and 5 variables:
#' \describe{
#'   \item{\code{id}}{image id}
#'   \item{\code{width}}{image width}
#'   \item{\code{name}}{image name}
#'   \item{\code{disallowFirst}}{logical}
#'   \item{\code{weight}}{integer}
#' }
"people"
