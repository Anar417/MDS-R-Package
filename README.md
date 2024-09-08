# MDS Package

## Overview

This **MDS Package** is a minimalistic R package designed for performing **Multidimensional Scaling (MDS)** on numerical datasets and has been created as part of an a university project. MDS is a powerful dimensionality reduction technique that projects high-dimensional data into a lower-dimensional space (typically 2D or 3D) while preserving the pairwise distances between data points as accurately as possible. This is useful for visualizing the underlying structure of the data and finding patterns, clusters, or outliers.

**Classical MDS (Metric MDS) / Principal Coordinate Analysis (PCoA)** has been implemented here using Euclidean or other distance metrics as shown below to visualize high-dimensional data in a simple and easily interpretable manner. The package is user-friendly and provides plots of MDS results using `ggplot2`.

* mds() function performs multidimensional scaling by computing the pairwise distances between variables in a dataset, and then using eigenvalue decomposition to project the data onto a lower-dimensional space for visualization. The plot in this case, has is being returned, has two dimensions.

## Algorithms Implemented

### Classical Multidimensional Scaling (MDS)

1. **Compute the pairwise distance matrix** from the data. Distance metrics to chosen from for usage:
   * The Euclidean distance between two vectors x and y: $\sqrt{\sum_{i} (x_i - y_i)^2}\$
   * The Maximum distance between two components of x and y
   * The Manhattan distance being the absolute distance between the two vectors
   * The Canberra  distance between two vectors x and y: $\sum_{i} \left| x_i - y_i \right| \div (\left| x_i \right| + \left| y_i \right|) \$
   * The Minkowski distance being the p-th root of the sum of the p-th powers of the differences of the components
2. **Apply double-centering** to the distance matrix $D = (d_{ij}), i,j = 1,...,n$ using the centering matrix $H = I_n - \frac{1}{n} * 1_n * 1_n ^T$ by computing $B = -\frac{1}{2} * H * D^2 *H$
4. **Perform eigen decomposition** on the centered matrix B.
5. **Use the top k positive eigenvalues and eigenvectors** to compute the new coordinates in a k-dimensional space.


## Installation

Since this package is currently a private project, the recommended way to install it is to download the package and build it locally in R using:

```r
# Install devtools if you haven't already
install.packages("devtools")

setwd("local/path/to/this/package")
devtools::build()
devtools::install()
```

Otherwise, you can try installing it using the install_github() function:

```r
devtools::install_github("Anar417/MDS-R-Package")
```


## Usage

```r
# Load the necessary library
library(MDS)

# Create a sample data matrix
data_matrix <- data.frame(
  A = c(1.0, 1.2, 0.9, 1.1),
  B = c(0.8, 0.7, 0.9, 1.0),
  C = c(1.1, 1.0, 0.8, 0.9),
  D = c(0.9, 0.8, 1.1, 1.0)
)

# Apply the mds function to the sample data
mds(data_matrix, k = 2, distance_method = "euclidean")
```
