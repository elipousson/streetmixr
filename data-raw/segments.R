## code to prepare `DATASET` dataset goes here

components <-
  "https://raw.githubusercontent.com/streetmix/streetmix/main/assets/scripts/segments/components.json"

components <-
  jsonlite::read_json(components, simplifyVector = TRUE)

usethis::use_data(components, overwrite = TRUE)

segment_lookup <-
  "https://raw.githubusercontent.com/streetmix/streetmix/main/assets/scripts/segments/segment-lookup.json"

segment_lookup <-
  jsonlite::read_json(segment_lookup, simplifyVector = TRUE)

people <-
  "https://raw.githubusercontent.com/streetmix/streetmix/main/assets/scripts/segments/people.json"

people <-
  jsonlite::read_json(people, simplifyVector = TRUE)

usethis::use_data(people, overwrite = TRUE)

capacity <-
  "https://raw.githubusercontent.com/streetmix/streetmix/main/assets/scripts/segments/capacity.json"

capacity <-
  jsonlite::read_json(capacity, simplifyVector = TRUE)

complete_streets_rule <-
  "https://raw.githubusercontent.com/d-wasserman/Complete_Street_Rule/main/data/confDashboard-v2-Complete_Street_Scenarios_2020.txt"

complete_streets_rule <-
  jsonlite::read_json(complete_streets_rule, simplifyVector = TRUE)
