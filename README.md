
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dverse

<!-- badges: start -->

[![R-CMD-check](https://github.com/maurolepore/dverse/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/maurolepore/dverse/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/maurolepore/dverse/graph/badge.svg)](https://app.codecov.io/gh/maurolepore/dverse)
<!-- badges: end -->

The goal of dverse is to document a universe. It creates a data frame
containing the metadata associated with the documentation of a
collection of R packages. It allows for linking topic names to their
corresponding documentation online. If you maintain a universe
meta-package, it helps create a comprehensive reference for its website.

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

## Example

``` r
# Use dverse and the universe of packages you want to document
library(dverse)
library(tools)
library(datasets)

universe <- c("datasets", "tools")
url_template <- "https://www.rdocumentation.org/packages/{package}/versions/3.6.2/topics/{topic}.html"

document_universe(universe, url_template = url_template)
#> # A tibble: 228 × 5
#>    topic                                             alias title concept package
#>    <chr>                                             <chr> <chr> <chr>   <chr>  
#>  1 <a href=https://www.rdocumentation.org/packages/… .pri… Prin… Utilit… tools  
#>  2 <a href=https://www.rdocumentation.org/packages/… Adob… Conv… Datase… tools  
#>  3 <a href=https://www.rdocumentation.org/packages/… AirP… Mont… Datase… datase…
#>  4 <a href=https://www.rdocumentation.org/packages/… BJsa… Sale… Datase… datase…
#>  5 <a href=https://www.rdocumentation.org/packages/… BOD   Bioc… Datase… datase…
#>  6 <a href=https://www.rdocumentation.org/packages/… CO2   Carb… Datase… datase…
#>  7 <a href=https://www.rdocumentation.org/packages/… CRAN… CRAN… <NA>    tools  
#>  8 <a href=https://www.rdocumentation.org/packages/… Chic… Weig… Datase… datase…
#>  9 <a href=https://www.rdocumentation.org/packages/… DNase Elis… Datase… datase…
#> 10 <a href=https://www.rdocumentation.org/packages/… EuSt… Dail… Datase… datase…
#> # ℹ 218 more rows
```
