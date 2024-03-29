test_that("imdb dataset works", {

  tmp <- tempfile()

  dataset <- imdb_dataset(
    root = tmp,
    download = TRUE,
    num_words = 5000
  )

  expect_equal(length(dataset), 25000)

  # can used the cached dataset
  dataset <- imdb_dataset(
    root = tmp,
    download = TRUE,
    num_words = 3000,
    maxlen = 2500
  )

  expect_equal(length(dataset), 25000)
  expect_equal(dataset[1]$x[1], 1)
  expect_equal(length(dataset[1]$x), 2500)

  # can load a batch of obs
  dl <- torch::dataloader(dataset, batch_size = 32)
  x <- coro::collect(dl, 1)[[1]]

  expect_tensor_shape(x$x, c(32, 2500))
  expect_tensor_shape(x$y, c(32))

  # can load tests dataset
  dataset <- imdb_dataset(
    root = tmp,
    download = TRUE,
    num_words = 5000,
    split = "test"
  )

  expect_equal(length(dataset), 25000)

})
