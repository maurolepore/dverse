
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

- `dverse::document_universe()` creates a data frame with the
  documentation of a collection of packages.
- `url_template` links each `{topic}` in each `{package}` with its
  corresponding documentation online.

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

You may generate a clickable table is with `knitr::kable()`.

``` r
knitr::kable(docs)
```

| topic | alias | title | concept | package |
|:---|:---|:---|:---|:---|
| <a href=https://tibble.tidyverse.org/reference/add_column.html>add_column</a> | add_column | Add columns to a data frame | addition | tibble |
| <a href=https://tibble.tidyverse.org/reference/add_row.html>add_row</a> | add_row, add_case | Add rows to a data frame | addition | tibble |
| <a href=https://glue.tidyverse.org/reference/as_glue.html>as_glue</a> | as_glue | Coerce object to glue | NA | glue |
| <a href=https://tibble.tidyverse.org/reference/as_tibble.html>as_tibble</a> | as_tibble, as_tibble_row, as_tibble_col | Coerce lists, matrices, and more to data frames | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/char.html>char</a> | char, set_char_opts | Format a character vector | vector classes | tibble |
| <a href=https://tibble.tidyverse.org/reference/digits.html>digits</a> | digits | Comparing display with data frames | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/enframe.html>enframe</a> | enframe, deframe | Converting vectors to data frames, and vice versa | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/extending.html>extending</a> | extending | Extending tibble | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/formats.html>formats</a> | formats | Column formats | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/formatting.html>formatting</a> | formatting, print, format, print.tbl_df, format.tbl_df | Printing tibbles | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/frame_matrix.html>frame_matrix</a> | frame_matrix | Row-wise matrix creation | NA | tibble |
| <a href=https://glue.tidyverse.org/reference/glue.html>glue</a> | glue, glue_data | Format and interpolate a string | NA | glue |
| <a href=https://glue.tidyverse.org/reference/glue_col.html>glue_col</a> | glue_col, glue_data_col | Construct strings with color | NA | glue |
| <a href=https://glue.tidyverse.org/reference/glue_collapse.html>glue_collapse</a> | glue_collapse, glue_sql_collapse | Collapse a character vector | NA | glue |
| <a href=https://glue.tidyverse.org/reference/glue_safe.html>glue_safe</a> | glue_safe, glue_data_safe | Safely interpolate strings | NA | glue |
| <a href=https://glue.tidyverse.org/reference/glue_sql.html>glue_sql</a> | glue_sql, glue_data_sql | Interpolate strings with SQL escaping | NA | glue |
| <a href=https://glue.tidyverse.org/reference/identity_transformer.html>identity_transformer</a> | identity_transformer | Parse and Evaluate R code | NA | glue |
| <a href=https://tibble.tidyverse.org/reference/invariants.html>invariants</a> | invariants | Invariants: Comparing behavior with data frames | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/is_tibble.html>is_tibble</a> | is_tibble | Test if the object is a tibble | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/lst.html>lst</a> | lst | Build a list | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/new_tibble.html>new_tibble</a> | new_tibble, validate_tibble | Tibble constructor and validator | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/num.html>num</a> | num, set_num_opts | Format a numeric vector | vector classes | tibble |
| <a href=https://tibble.tidyverse.org/reference/numbers.html>numbers</a> | numbers | Controlling display of numbers | NA | tibble |
| <a href=https://glue.tidyverse.org/reference/quoting.html>quoting</a> | quoting, single_quote, double_quote, backtick | Quoting operators | NA | glue |
| <a href=https://tibble.tidyverse.org/reference/rownames.html>rownames</a> | rownames, has_rownames, remove_rownames, rownames_to_column, rowid_to_column, column_to_rownames | Tools for working with row names | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/subsetting.html>subsetting</a> | subsetting, \$, \[\[, \[, \$\<-, \[\[\<-, \[\<- | Subsetting tibbles | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/tbl_df-class.html>tbl_df-class</a> | tbl_df-class, tbl_df | ‘tbl_df’ class | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/tibble.html>tibble</a> | tibble, tibble_row | Build a data frame | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/tibble.html>tibble</a> | tibble, tibble_row | Tibbles | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/tibble-package.html>tibble-package</a> | tibble-package | tibble: Simple Data Frames | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/tibble_options.html>tibble_options</a> | tibble_options | Package options | Datasets available by data() | tibble |
| <a href=https://tibble.tidyverse.org/reference/tribble.html>tribble</a> | tribble | Row-wise tibble creation | NA | tibble |
| <a href=https://glue.tidyverse.org/reference/trim.html>trim</a> | trim | Trim a character vector | NA | glue |
| <a href=https://tibble.tidyverse.org/reference/types.html>types</a> | types | Column types | NA | tibble |
| <a href=https://tibble.tidyverse.org/reference/view.html>view</a> | view | View an object | NA | tibble |
