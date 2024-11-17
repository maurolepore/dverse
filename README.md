
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dverse

<!-- badges: start -->

[![R-CMD-check](https://github.com/maurolepore/dverse/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/maurolepore/dverse/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/maurolepore/dverse/graph/badge.svg)](https://app.codecov.io/gh/maurolepore/dverse)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/dverse)](https://CRAN.R-project.org/package=dverse)
<!-- badges: end -->

The goal of dverse is to document a universe. It creates a data frame
containing the metadata associated with the documentation of a
collection of R packages. It allows for linking topic names to their
corresponding documentation online.

If you have a meta-package, dverse helps you to create a comprehensive
reference for its website.

## Installation

Install from CRAN:

``` r
install.packages("dverse")
```

or get a development version from GitHub:

``` r
# install.packages("pak")
pak::pak("maurolepore/dverse")
```

## Motivation

The [Tidyverse](https://www.tidyverse.org/) popularized the idea of a
“universe of packages.” The typical universe has a meta-package that
centralizes access to functions and data across all its packages. For
example, with `library(tidyverse)` the [tidyverse
meta-package](https://tidyverse.tidyverse.org/) centralizes access to
the functions in [dplyr](https://dplyr.tidyverse.org/),
[ggplot2](https://ggplot2.tidyverse.org/), and several other packages in
the [Tidyverse universe](https://www.tidyverse.org/).

However, meta-packages typically don’t centralize documentation. For
example, the tidyverse website only shows the [documentation for the
tidyverse meta-package
itself](https://tidyverse.tidyverse.org/reference/index.html) but does
not show the [documentation for
dplyr](https://dplyr.tidyverse.org/reference/index.html),
[ggplot2](https://ggplot2.tidyverse.org/reference/index.html), and other
packages in the Tidyverse.

The [dverse](https://maurolepore.github.io/dverse/) package solves this
problem. It creates a data frame containing the metadata associated with
the documentation of any set of packages. This data frame can be easily
used to generate the universe-wide reference for the meta-package
website, for example using [pkgdown](https://pkgdown.r-lib.org/).

## Example

`document_universe()` creates a data frame with documentation metadata
of one or more packages.

``` r
library(glue)
library(tibble)

packages <- c("glue", "tibble")
url_template <- "https://{package}.tidyverse.org/reference/{topic}.html"
docs <- dverse::document_universe(packages, url_template)

docs
#> # A tibble: 35 × 5
#>    topic                                             alias title concept package
#>    <chr>                                             <chr> <chr> <chr>   <chr>  
#>  1 <a href=https://tibble.tidyverse.org/reference/a… add_… Add … additi… tibble 
#>  2 <a href=https://tibble.tidyverse.org/reference/a… add_… Add … additi… tibble 
#>  3 <a href=https://glue.tidyverse.org/reference/as_… as_g… Coer… <NA>    glue   
#>  4 <a href=https://tibble.tidyverse.org/reference/a… as_t… Coer… <NA>    tibble 
#>  5 <a href=https://tibble.tidyverse.org/reference/c… char… Form… vector… tibble 
#>  6 <a href=https://tibble.tidyverse.org/reference/d… digi… Comp… <NA>    tibble 
#>  7 <a href=https://tibble.tidyverse.org/reference/e… enfr… Conv… <NA>    tibble 
#>  8 <a href=https://tibble.tidyverse.org/reference/e… exte… Exte… <NA>    tibble 
#>  9 <a href=https://tibble.tidyverse.org/reference/f… form… Colu… <NA>    tibble 
#> 10 <a href=https://tibble.tidyverse.org/reference/f… form… Prin… <NA>    tibble 
#> # ℹ 25 more rows
```

`knitr::kable()` turns the URLs into clickable links.

``` r
knitr::kable(head(docs, 3))
```

| topic | alias | title | concept | package |
|:---|:---|:---|:---|:---|
| <a href=https://tibble.tidyverse.org/reference/add_column.html>add_column</a> | add_column | Add columns to a data frame | addition | tibble |
| <a href=https://tibble.tidyverse.org/reference/add_row.html>add_row</a> | add_row, add_case | Add rows to a data frame | addition | tibble |
| <a href=https://glue.tidyverse.org/reference/as_glue.html>as_glue</a> | as_glue | Coerce object to glue | NA | glue |

`DT::datatabe()` also provides a search box. See [Get
started](https://maurolepore.github.io/dverse/articles/dverse.html).
