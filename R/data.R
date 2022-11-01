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
#' @format A data frame with 254 rows and 6 variables:
#' \describe{
#'   \item{`repo`}{repository}
#'   \item{`name`}{illustration name}
#'   \item{`url`}{SVG file url}
#'   \item{`category`}{category/folder}
#'   \item{`side`}{facing side (left or right)}
#'   \item{`direction`}{direction of movement (inbound or outbound)}
#' }
"illustrations"


#' Streetmix CC-BY-SA illustrations of people
#'
#' @format A data frame with 36 rows and 5 variables:
#' \describe{
#'   \item{`id`}{image id}
#'   \item{`width`}{image width}
#'   \item{`name`}{image name}
#'   \item{`disallowFirst`}{logical}
#'   \item{`weight`}{integer}
#' }
"people"


#' Streetmix components
#'
#' @format A length 4 nested list with specifications for lanes, markings,
#'   objects, and vehicles.
"components"

