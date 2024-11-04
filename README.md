
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

If you maintain a meta-package, dverse helps create a comprehensive
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
the functions in [glue](https://glue.tidyverse.org/),
[tibble](https://tibble.tidyverse.org/), and several other packages in
the [Tidyverse universe](https://www.tidyverse.org/).

However, meta-packages typically don’t centralize documentation. For
example, the tidyverse website only shows the [documentation the
tidyverse meta-package
itself](https://tidyverse.tidyverse.org/reference/index.html) and does
not show the [documentation for
glue](https://glue.tidyverse.org/reference/index.html),
[tibble](https://tibble.tidyverse.org/reference/index.html), and other
packages in the Tidyverse.

The [dverse](https://maurolepore.github.io/dverse/) package solves this
problem. It creates a data frame containing the metadata associated with
the documentation of any set of packages. This data frame can be easily
used to generate the universe-wide reference for the meta-package
website, for example using [pkgdown](https://pkgdown.r-lib.org/).

## Example

``` r
library(dverse)

library(glue)
library(tibble)
universe <- c("glue", "tibble")

# https://glue.tidyverse.org/reference/as_glue.html
# https://tibble.tidyverse.org/reference/as_tibble.html
url_template <- "https://{package}.tidyverse.org/reference/{topic}.html"

docs <- document_universe(universe, url_template)
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

Typically you would hide the code (`echo = FALSE`) and generate
click-able links with `DT::datatable()` or `knitr::kable()`. For
example, this code to generates the table under “All functions in my
universe”:

``` r
# Picking only a few rows and columns for a short example
pick <- docs[c("topic", "title", "package")]
knitr::kable(head(pick, 3))
```

### All functions in my universe

This is a basic, universe-wide reference generated with dverse.

| topic | title | package |
|:---|:---|:---|
| <a href=https://tibble.tidyverse.org/reference/add_column.html>add_column</a> | Add columns to a data frame | tibble |
| <a href=https://tibble.tidyverse.org/reference/add_row.html>add_row</a> | Add rows to a data frame | tibble |
| <a href=https://glue.tidyverse.org/reference/as_glue.html>as_glue</a> | Coerce object to glue | glue |

For customization ideas see `?DT::datatable()`, `?knitr::kable()`, and
the examples in the [dverse
articles](https://maurolepore.github.io/dverse/articles).
