#' Streetmix CC-BY-SA illustrations
#'
#' @description
#' Last updated: 2024-01-08
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
#' @format A data frame with 273 rows and 8 variables:
#' \describe{
#'   \item{`repo`}{repository}
#'   \item{`name`}{illustration name}
#'   \item{`url`}{SVG file url}
#'   \item{`category`}{category/folder}
#'   \item{`side`}{facing side (left or right)}
#'   \item{`direction`}{direction of movement (inbound or outbound)}
#'   \item{`orientation`}{orientation (parallel, perpendicular, sideways, or angled)}
#'   \item{`width_type`}{building width type (narrow or wide)}
#' }
#' @source <https://github.com/streetmix/illustrations>
"illustrations"

#' Streetmix CC-BY-SA illustrations of people
#'
#' @description
#' Last updated: 2024-01-08
#'
#' @format A data frame with 36 rows and 5 variables:
#' \describe{
#'   \item{`id`}{image id}
#'   \item{`width`}{image width}
#'   \item{`name`}{image name}
#'   \item{`disallowFirst`}{logical}
#'   \item{`weight`}{integer}
#' }
#' @source <https://raw.githubusercontent.com/streetmix/streetmix/main/assets/scripts/segments/people.json>
"people"


#' Streetmix components
#'
#' @description
#' Last updated: 2024-01-08
#'
#' @format A length 5 nested list with specifications for lanes, markings,
#'   objects, and vehicles.
#' @source <https://raw.githubusercontent.com/streetmix/streetmix/main/assets/scripts/segments/components.json>
"components"
