<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->

# dverse 0.2.0

* Vignettes now also have links to their counterpart online (#27).
* New `is_online()` helps pick topics that do exist online (#28). This helps drop
topics that appear in the output of `document_universe()` but likely should not
be exposed to users, such as reexported operators.

# dverse 0.1.0

* New CRAN release.
* `document_universe()` now outputs the new column `keyword` and new rows where
`keyword` is "internal" (#20).
* `document_universe()` now outputs the new column `type` (#18). This allows
differentiating help files from vignettes.
* `document_universe()` with older versions of R no longer errors when handling
strings prefixed with "." (#10). This expands the compatible versions of R to >=
3.6.

# dverse v0.0.1

* Initial CRAN release.
