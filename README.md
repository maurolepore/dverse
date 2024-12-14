
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
library(dverse)
# demoverse
library(glue)
library(tibble)

demoverse <- c("glue", "tibble")
# Example: "https://tibble.tidyverse.org/reference/as_tibble.html"
manual <- "https://{package}.tidyverse.org/reference/{topic}.html"
docs <- document_universe(demoverse, url_template = manual)
docs
#> # A tibble: 46 × 7
#>    topic                               alias title concept type  keyword package
#>    <chr>                               <chr> <chr> <chr>   <chr> <chr>   <chr>  
#>  1 <a href=https://tibble.tidyverse.o… add_… Add … additi… help  <NA>    tibble 
#>  2 <a href=https://tibble.tidyverse.o… add_… Add … additi… help  <NA>    tibble 
#>  3 <a href=https://glue.tidyverse.org… as_g… Coer… <NA>    help  <NA>    glue   
#>  4 <a href=https://tibble.tidyverse.o… as_t… Coer… <NA>    help  <NA>    tibble 
#>  5 <a href=https://tibble.tidyverse.o… char… Form… vector… help  <NA>    tibble 
#>  6 <a href=https://tibble.tidyverse.o… depr… Depr… <NA>    help  intern… tibble 
#>  7 <a href=https://tibble.tidyverse.o… digi… Comp… <NA>    vign… <NA>    tibble 
#>  8 <a href=https://tibble.tidyverse.o… enfr… Conv… <NA>    help  <NA>    tibble 
#>  9 <a href=https://glue.tidyverse.org… engi… Cust… <NA>    vign… <NA>    glue   
#> 10 <a href=https://tibble.tidyverse.o… exte… Exte… <NA>    vign… <NA>    tibble 
#> # ℹ 36 more rows
```

`knitr::kable()` turns the URLs into clickable links.

``` r
knitr::kable(tail(docs))
```

| topic | alias | title | concept | type | keyword | package |
|:---|:---|:---|:---|:---|:---|:---|
| <a href=https://tibble.tidyverse.org/reference/tribble.html>tribble</a> | tribble | Row-wise tibble creation | NA | help | NA | tibble |
| <a href=https://glue.tidyverse.org/reference/trim.html>trim</a> | trim | Trim a character vector | NA | help | NA | glue |
| <a href=https://tibble.tidyverse.org/reference/trunc_mat.html>trunc_mat</a> | trunc_mat | Legacy printing | NA | help | internal | tibble |
| <a href=https://tibble.tidyverse.org/articles/types.html>types</a> | types | Column types | NA | vignette | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/view.html>view</a> | view | View an object | NA | help | NA | tibble |
| <a href=https://glue.tidyverse.org/articles/wrappers.html>wrappers</a> | wrappers | How to write a function that wraps glue | NA | vignette | NA | glue |

`url_template` can take different templates for the manual and
vignettes.

``` r
manual <- "https://tidyverse.r-universe.dev/{package}/doc/manual.html#{topic}"
vignettes <- "https://tidyverse.r-universe.dev/articles/{package}/{topic}.html"
docs_runiverse <- document_universe(demoverse, url_template = c(manual, vignettes))
docs_runiverse
#> # A tibble: 46 × 7
#>    topic                               alias title concept type  keyword package
#>    <chr>                               <chr> <chr> <chr>   <chr> <chr>   <chr>  
#>  1 <a href=https://tidyverse.r-univer… add_… Add … additi… help  <NA>    tibble 
#>  2 <a href=https://tidyverse.r-univer… add_… Add … additi… help  <NA>    tibble 
#>  3 <a href=https://tidyverse.r-univer… as_g… Coer… <NA>    help  <NA>    glue   
#>  4 <a href=https://tidyverse.r-univer… as_t… Coer… <NA>    help  <NA>    tibble 
#>  5 <a href=https://tidyverse.r-univer… char… Form… vector… help  <NA>    tibble 
#>  6 <a href=https://tidyverse.r-univer… depr… Depr… <NA>    help  intern… tibble 
#>  7 <a href=https://tidyverse.r-univer… digi… Comp… <NA>    vign… <NA>    tibble 
#>  8 <a href=https://tidyverse.r-univer… enfr… Conv… <NA>    help  <NA>    tibble 
#>  9 <a href=https://tidyverse.r-univer… engi… Cust… <NA>    vign… <NA>    glue   
#> 10 <a href=https://tidyverse.r-univer… exte… Exte… <NA>    vign… <NA>    tibble 
#> # ℹ 36 more rows

knitr::kable(tail(docs_runiverse))
```

| topic | alias | title | concept | type | keyword | package |
|:---|:---|:---|:---|:---|:---|:---|
| <a href=https://tidyverse.r-universe.dev/tibble/doc/manual.html#tribble>tribble</a> | tribble | Row-wise tibble creation | NA | help | NA | tibble |
| <a href=https://tidyverse.r-universe.dev/glue/doc/manual.html#trim>trim</a> | trim | Trim a character vector | NA | help | NA | glue |
| <a href=https://tidyverse.r-universe.dev/tibble/doc/manual.html#trunc_mat>trunc_mat</a> | trunc_mat | Legacy printing | NA | help | internal | tibble |
| <a href=https://tidyverse.r-universe.dev/articles/tibble/types.html>types</a> | types | Column types | NA | vignette | NA | tibble |
| <a href=https://tidyverse.r-universe.dev/tibble/doc/manual.html#view>view</a> | view | View an object | NA | help | NA | tibble |
| <a href=https://tidyverse.r-universe.dev/articles/glue/wrappers.html>wrappers</a> | wrappers | How to write a function that wraps glue | NA | vignette | NA | glue |

`DT::datatabe()` also provides a search box. See [Get
started](https://maurolepore.github.io/dverse/articles/dverse.html).
