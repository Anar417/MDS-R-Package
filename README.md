# MDS Package

## Overview

This **MDS Package** is a minimalistic R package designed for performing **Multidimensional Scaling (MDS)** on numerical datasets and was created as a university project. MDS is a powerful dimensionality reduction technique that projects high-dimensional data into a lower-dimensional space (typically 2D or 3D) while preserving the pairwise distances between data points as accurately as possible.

This package implements **Classical MDS (Metric MDS) / Principal Coordinate Analysis (PCoA)** using Euclidean or other customizable distance metric to visualize high-dimensional data in a simple and interpretable manner. The package is user-friendly and provides easily customizable plots of MDS results using `ggplot2`.

* mds() function transforms high-dimensional data into a visually interpretable form within 2 dimensions while retaining the original distances between data points as accurately as possible.

## Algorithms Implemented

### Classical Multidimensional Scaling (MDS)

1. **Compute the pairwise distance matrix** from the data (e.g., Euclidean distance).
2. **Apply double-centering** to the distance matrix to remove its mean.
3. **Perform eigen decomposition** on the centered matrix.
4. **Use the top `k` eigenvalues and eigenvectors** to compute the new coordinates in `k`-dimensional space.

The MDS algorithm attempts to preserve the original distances between points as closely as possible in the reduced space. This is useful for visualizing the underlying structure of the data and finding patterns, clusters, or outliers.

## Installation

Since this package is currently a private project, the recommended way to install it is to download the package and build it locally in R using:

```r
# Install devtools if you haven't already
install.packages("devtools")

setwd("local/path/to/this/package")
devtools::build()
devtools::install()
```

Otherwise, you can try installing it using the install_github() function in R:

```r
install_github("Anar417/MDS-R-Package")
```

