
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dverse

<!-- badges: start -->

[![R-CMD-check](https://github.com/maurolepore/dverse/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/maurolepore/dverse/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/maurolepore/dverse/graph/badge.svg)](https://app.codecov.io/gh/maurolepore/dverse)
<!-- badges: end -->

The goal of dverse is to make it easy to create a data frame of the
metadata associated to the documentation of a collection of R packages.

If you maintain an R-package universe, it helps you to easily create a
universe-wide reference for the pkgdown website of your meta-package
(e.g. tidyverse, tidymodels).

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
linked <- document_universe(universe, url_template = url_template)
linked
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

knitr::kable(head(linked))
```

| topic | alias | title | concept | package |
|:---|:---|:---|:---|:---|
| <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/.print.via.format.html>.print.via.format</a> | .print.via.format | Printing Utilities | Utilities | tools |
| <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/Adobe_glyphs.html>Adobe_glyphs</a> | Adobe_glyphs, charset_to_Unicode | Conversion Tables between Character Sets | Datasets available by data() | tools |
| <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/AirPassengers.html>AirPassengers</a> | AirPassengers | Monthly Airline Passenger Numbers 1949-1960 | Datasets available by data() | datasets |
| <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/BJsales.html>BJsales</a> | BJsales, BJsales.lead | Sales Data with Leading Indicator | Datasets available by data() | datasets |
| <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/BOD.html>BOD</a> | BOD | Biochemical Oxygen Demand | Datasets available by data() | datasets |
| <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/CO2.html>CO2</a> | CO2 | Carbon Dioxide Uptake in Grass Plants | Datasets available by data() | datasets |
