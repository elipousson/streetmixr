test_that("get_street works", {
  test_url <- "https://streetmix.net/eli.pousson/7/n-conkling-street-north-of-eastern-avenue"
  test_user_id <- "eli.pousson"
  test_street_id <- "b26529c0-c1ad-11ec-877c-abfad556cfc6"
  test_count <- 2

  expect_type(get_street(url = test_url), "list")
  expect_type(get_street(url = test_url, return = "data"), "list")
  expect_type(get_street(url = test_url, return = "street"), "list")
  expect_type(get_street(url = test_url, return = "location"), "list")
  expect_s3_class(get_street(url = test_url, return = "segments"), "data.frame")
  expect_type(get_street(user_id = test_user_id), "list")
  expect_type(get_street(street_id = test_street_id), "list")
  # expect_type(get_street(count = test_count), "list")
})
