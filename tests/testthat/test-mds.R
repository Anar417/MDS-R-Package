test_that("mds function works correctly", {
  # Create example data 1
  example_data <- data.frame(
    Var1 = c(1.2, 3.5, 4.8, 6.1, 5.7),
    Var2 = c(2.1, 3.9, 4.4, 5.6, 5.2),
    Var3 = c(1.9, 3.2, 4.1, 5.8, 5.3)
  )

  scaled_data <- scale(t(example_data), center = TRUE, scale = TRUE)
  distance_method <- "euclidean"
  # Compute distance matrix using the initially specified distance method
  distance_matrix <- dist(scaled_data, method = distance_method)


  # Test that the mds function runs without error
  result <- mds(example_data, k = 2, distance_method = distance_method)
  expect_s3_class(result[[2]], "ggplot")  # Check if the result is a ggplot object

  # Test if output result is qeual to what is also output by R's implemented cmdscale() function
  if (is.null(rownames(cmdscale(distance_matrix, k = 2)))) {
    rownames(result[[1]]) <- NULL
  }
  expect_equal(result[[1]], cmdscale(distance_matrix, k = 2))

  # Check that the number of points in the plot equals the number of columns in the data
  expect_equal(nrow(ggplot_build(result[[2]])$data[[1]]), ncol(example_data))



  # Create example data 2
  example_data <- matrix(rnorm(100), nrow = 10)

  scaled_data <- scale(t(example_data), center = TRUE, scale = TRUE)
  distance_method <- "manhattan"
  # Compute distance matrix using the initially specified distance method
  distance_matrix <- dist(scaled_data, method = distance_method)


  # Test that the mds function runs without error
  result <- mds(example_data, k = 3, distance_method = distance_method)
  expect_s3_class(result[[2]], "ggplot")  # Check if the result is a ggplot object

  # Test if output result is qeual to what is also output by R's implemented cmdscale() function
  if (is.null(colnames(cmdscale(distance_matrix, k = 3)))) {
    rownames(result[[1]]) <- NULL
  }
  expect_equal(result[[1]], cmdscale(distance_matrix, k = 3))

  # Check that the number of points in the plot equals the number of columns in the data
  expect_equal(nrow(ggplot_build(result[[2]])$data[[1]]), ncol(example_data))
})
