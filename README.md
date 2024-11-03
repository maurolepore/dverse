
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
#>                                                                                                                                                                              topic
#> 1                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/.print.via.format.html>.print.via.format</a>
#> 2                                                                   <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/Adobe_glyphs.html>Adobe_glyphs</a>
#> 3                                                              <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/AirPassengers.html>AirPassengers</a>
#> 4                                                                          <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/BJsales.html>BJsales</a>
#> 5                                                                                  <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/BOD.html>BOD</a>
#> 6                                                                                  <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/CO2.html>CO2</a>
#> 7                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/CRAN_package_db.html>CRAN_package_db</a>
#> 8                                                                  <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/ChickWeight.html>ChickWeight</a>
#> 9                                                                              <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/DNase.html>DNase</a>
#> 10                                                           <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/EuStockMarkets.html>EuStockMarkets</a>
#> 11                                                               <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/Formaldehyde.html>Formaldehyde</a>
#> 12                                                                      <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/HTMLheader.html>HTMLheader</a>
#> 13                                                                      <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/HTMLheader.html>HTMLheader</a>
#> 14                                                                      <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/HTMLheader.html>HTMLheader</a>
#> 15                                                                      <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/HTMLheader.html>HTMLheader</a>
#> 16                                                               <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/HairEyeColor.html>HairEyeColor</a>
#> 17                                                               <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/Harman23.cor.html>Harman23.cor</a>
#> 18                                                               <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/Harman74.cor.html>Harman74.cor</a>
#> 19                                                                       <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/Indometh.html>Indometh</a>
#> 20                                                               <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/InsectSprays.html>InsectSprays</a>
#> 21                                                           <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/JohnsonJohnson.html>JohnsonJohnson</a>
#> 22                                                                     <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/LakeHuron.html>LakeHuron</a>
#> 23                                                       <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/LifeCycleSavings.html>LifeCycleSavings</a>
#> 24                                                                       <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/Loblolly.html>Loblolly</a>
#> 25                                                                               <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/Nile.html>Nile</a>
#> 26                                                                           <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/Orange.html>Orange</a>
#> 27                                                             <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/OrchardSprays.html>OrchardSprays</a>
#> 28                                                                 <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/PlantGrowth.html>PlantGrowth</a>
#> 29                                                                     <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/Puromycin.html>Puromycin</a>
#> 30                                                                                      <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/QC.html>QC</a>
#> 31                                                                                      <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/QC.html>QC</a>
#> 32                                                                                      <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/QC.html>QC</a>
#> 33                                                                                      <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/QC.html>QC</a>
#> 34                                                                      <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/R_user_dir.html>R_user_dir</a>
#> 35                                                                                  <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/Rcmd.html>Rcmd</a>
#> 36                                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/Rd2HTML.html>Rd2HTML</a>
#> 37                                                              <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/Rd2txt_options.html>Rd2txt_options</a>
#> 38                                                                  <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/RdTextFilter.html>RdTextFilter</a>
#> 39                                                                  <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/RdTextFilter.html>RdTextFilter</a>
#> 40                                                                  <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/RdTextFilter.html>RdTextFilter</a>
#> 41                                                                  <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/RdTextFilter.html>RdTextFilter</a>
#> 42                                                                                <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/Rd_db.html>Rd_db</a>
#> 43                                                                                <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/Rd_db.html>Rd_db</a>
#> 44                                                                                <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/Rd_db.html>Rd_db</a>
#> 45                                                                                <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/Rd_db.html>Rd_db</a>
#> 46                                                                                <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/Rdiff.html>Rdiff</a>
#> 47                                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/Rdindex.html>Rdindex</a>
#> 48                                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/Rdindex.html>Rdindex</a>
#> 49                                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/Rdindex.html>Rdindex</a>
#> 50                                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/Rdindex.html>Rdindex</a>
#> 51                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/SweaveTeXFilter.html>SweaveTeXFilter</a>
#> 52                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/SweaveTeXFilter.html>SweaveTeXFilter</a>
#> 53                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/SweaveTeXFilter.html>SweaveTeXFilter</a>
#> 54                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/SweaveTeXFilter.html>SweaveTeXFilter</a>
#> 55                                                                           <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/Theoph.html>Theoph</a>
#> 56                                                                         <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/Titanic.html>Titanic</a>
#> 57                                                                 <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/ToothGrowth.html>ToothGrowth</a>
#> 58                                                             <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/UCBAdmissions.html>UCBAdmissions</a>
#> 59                                                           <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/UKDriverDeaths.html>UKDriverDeaths</a>
#> 60                                                               <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/UKLungDeaths.html>UKLungDeaths</a>
#> 61                                                                             <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/UKgas.html>UKgas</a>
#> 62                                                                 <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/USAccDeaths.html>USAccDeaths</a>
#> 63                                                                     <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/USArrests.html>USArrests</a>
#> 64                                                           <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/USJudgeRatings.html>USJudgeRatings</a>
#> 65                                             <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/USPersonalExpenditure.html>USPersonalExpenditure</a>
#> 66                                                                       <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/VADeaths.html>VADeaths</a>
#> 67                                                                       <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/WWWusage.html>WWWusage</a>
#> 68                                                                 <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/WorldPhones.html>WorldPhones</a>
#> 69                                                                 <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/ability.cov.html>ability.cov</a>
#> 70                                                                  <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/add_datalist.html>add_datalist</a>
#> 71                                                                       <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/airmiles.html>airmiles</a>
#> 72                                                                   <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/airquality.html>airquality</a>
#> 73                                                                       <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/anscombe.html>anscombe</a>
#> 74                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/assertCondition.html>assertCondition</a>
#> 75                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/assertCondition.html>assertCondition</a>
#> 76                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/assertCondition.html>assertCondition</a>
#> 77                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/assertCondition.html>assertCondition</a>
#> 78                                                                           <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/attenu.html>attenu</a>
#> 79                                                                       <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/attitude.html>attitude</a>
#> 80                                                                         <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/austres.html>austres</a>
#> 81                                                                         <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/beavers.html>beavers</a>
#> 82                                                                          <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/bibstyle.html>bibstyle</a>
#> 83                                                                          <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/bibstyle.html>bibstyle</a>
#> 84                                                                <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/buildVignette.html>buildVignette</a>
#> 85                                                              <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/buildVignettes.html>buildVignettes</a>
#> 86                                                              <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/buildVignettes.html>buildVignettes</a>
#> 87                                                              <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/buildVignettes.html>buildVignettes</a>
#> 88                                                              <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/buildVignettes.html>buildVignettes</a>
#> 89                                                                               <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/cars.html>cars</a>
#> 90                                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkFF.html>checkFF</a>
#> 91                                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkFF.html>checkFF</a>
#> 92                                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkFF.html>checkFF</a>
#> 93                                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkFF.html>checkFF</a>
#> 94                                                                  <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkMD5sums.html>checkMD5sums</a>
#> 95                                                                  <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkPoFiles.html>checkPoFiles</a>
#> 96                                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkRd.html>checkRd</a>
#> 97                                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkRd.html>checkRd</a>
#> 98                                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkRd.html>checkRd</a>
#> 99                                                                            <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkRd.html>checkRd</a>
#> 100                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkRdaFiles.html>checkRdaFiles</a>
#> 101                                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkTnF.html>checkTnF</a>
#> 102                                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkTnF.html>checkTnF</a>
#> 103                                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkTnF.html>checkTnF</a>
#> 104                                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkTnF.html>checkTnF</a>
#> 105                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkVignettes.html>checkVignettes</a>
#> 106                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkVignettes.html>checkVignettes</a>
#> 107                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkVignettes.html>checkVignettes</a>
#> 108                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/checkVignettes.html>checkVignettes</a>
#> 109                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/check_packages_in_dir.html>check_packages_in_dir</a>
#> 110                                                                      <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/chickwts.html>chickwts</a>
#> 111                                                                                <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/co2.html>co2</a>
#> 112                                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/codoc.html>codoc</a>
#> 113                                                                     <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/compactPDF.html>compactPDF</a>
#> 114                                                                        <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/crimtab.html>crimtab</a>
#> 115                                                      <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/datasets-package.html>datasets-package</a>
#> 116                                                                     <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/delimMatch.html>delimMatch</a>
#> 117                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/dependsOnPkgs.html>dependsOnPkgs</a>
#> 118                                                                <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/discoveries.html>discoveries</a>
#> 119                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/encoded_text_to_latex.html>encoded_text_to_latex</a>
#> 120                                                                            <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/esoph.html>esoph</a>
#> 121                                                                              <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/euro.html>euro</a>
#> 122                                                                      <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/eurodist.html>eurodist</a>
#> 123                                                                      <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/faithful.html>faithful</a>
#> 124                                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/file_ext.html>file_ext</a>
#> 125                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/findHTMLlinks.html>findHTMLlinks</a>
#> 126                                                                   <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/find_gs_cmd.html>find_gs_cmd</a>
#> 127                                                                          <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/freeny.html>freeny</a>
#> 128                                                           <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/getVignetteInfo.html>getVignetteInfo</a>
#> 129                                                           <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/getVignetteInfo.html>getVignetteInfo</a>
#> 130                                                           <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/getVignetteInfo.html>getVignetteInfo</a>
#> 131                                                           <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/getVignetteInfo.html>getVignetteInfo</a>
#> 132                                                                          <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/infert.html>infert</a>
#> 133                                                                              <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/iris.html>iris</a>
#> 134                                                                        <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/islands.html>islands</a>
#> 135                                                                                  <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/lh.html>lh</a>
#> 136                                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/loadRdMacros.html>loadRdMacros</a>
#> 137                                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/loadRdMacros.html>loadRdMacros</a>
#> 138                                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/loadRdMacros.html>loadRdMacros</a>
#> 139                                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/loadRdMacros.html>loadRdMacros</a>
#> 140                                                                        <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/longley.html>longley</a>
#> 141                                                                              <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/lynx.html>lynx</a>
#> 142                                                           <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/makeLazyLoading.html>makeLazyLoading</a>
#> 143                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/make_translations_pkg.html>make_translations_pkg</a>
#> 144                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/makevars_user.html>makevars_user</a>
#> 145                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/matchConcordance.html>matchConcordance</a>
#> 146                                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/md5sum.html>md5sum</a>
#> 147                                                                          <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/morley.html>morley</a>
#> 148                                                                          <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/mtcars.html>mtcars</a>
#> 149                                                                          <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/nhtemp.html>nhtemp</a>
#> 150                                                                          <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/nottem.html>nottem</a>
#> 151                                                                                <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/npk.html>npk</a>
#> 152                                                  <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/occupationalStatus.html>occupationalStatus</a>
#> 153                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/package_dependencies.html>package_dependencies</a>
#> 154 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/package_native_routine_registration_skeleton.html>package_native_routine_registration_skeleton</a>
#> 155                                                                     <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/parseLatex.html>parseLatex</a>
#> 156                                                                     <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/parseLatex.html>parseLatex</a>
#> 157                                                                     <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/parseLatex.html>parseLatex</a>
#> 158                                                                     <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/parseLatex.html>parseLatex</a>
#> 159                                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/parse_Rd.html>parse_Rd</a>
#> 160                                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/parse_Rd.html>parse_Rd</a>
#> 161                                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/parse_Rd.html>parse_Rd</a>
#> 162                                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/parse_Rd.html>parse_Rd</a>
#> 163                                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/pkg2HTML.html>pkg2HTML</a>
#> 164                                                                          <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/precip.html>precip</a>
#> 165                                                                  <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/presidents.html>presidents</a>
#> 166                                                                      <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/pressure.html>pressure</a>
#> 167                                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/pskill.html>pskill</a>
#> 168                                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/psnice.html>psnice</a>
#> 169                                                                          <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/quakes.html>quakes</a>
#> 170                                                                            <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/randu.html>randu</a>
#> 171                                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/read.00Index.html>read.00Index</a>
#> 172                                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/read.00Index.html>read.00Index</a>
#> 173                                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/read.00Index.html>read.00Index</a>
#> 174                                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/read.00Index.html>read.00Index</a>
#> 175                                                                          <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/rivers.html>rivers</a>
#> 176                                                                              <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/rock.html>rock</a>
#> 177                                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/showNonASCII.html>showNonASCII</a>
#> 178                                                                            <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/sleep.html>sleep</a>
#> 179                                                                    <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/stackloss.html>stackloss</a>
#> 180                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/startDynamicHelp.html>startDynamicHelp</a>
#> 181                                                                            <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/state.html>state</a>
#> 182                                                            <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/sunspot.month.html>sunspot.month</a>
#> 183                                                              <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/sunspot.year.html>sunspot.year</a>
#> 184                                                                      <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/sunspots.html>sunspots</a>
#> 185                                                                            <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/swiss.html>swiss</a>
#> 186                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/testInstalledPackage.html>testInstalledPackage</a>
#> 187                                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/texi2dvi.html>texi2dvi</a>
#> 188                                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/toHTML.html>toHTML</a>
#> 189                                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/toHTML.html>toHTML</a>
#> 190                                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/toHTML.html>toHTML</a>
#> 191                                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/toHTML.html>toHTML</a>
#> 192                                                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/toRd.html>toRd</a>
#> 193                                                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/toRd.html>toRd</a>
#> 194                                                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/toRd.html>toRd</a>
#> 195                                                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/toRd.html>toRd</a>
#> 196                                                                   <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/toTitleCase.html>toTitleCase</a>
#> 197                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/tools-deprecated.html>tools-deprecated</a>
#> 198                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/tools-package.html>tools-package</a>
#> 199                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/tools-package.html>tools-package</a>
#> 200                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/tools-package.html>tools-package</a>
#> 201                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/tools-package.html>tools-package</a>
#> 202                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/tools-package.html>tools-package</a>
#> 203                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/tools-package.html>tools-package</a>
#> 204                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/tools-package.html>tools-package</a>
#> 205                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/tools-package.html>tools-package</a>
#> 206                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/tools-package.html>tools-package</a>
#> 207                                                                      <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/treering.html>treering</a>
#> 208                                                                            <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/trees.html>trees</a>
#> 209                                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/undoc.html>undoc</a>
#> 210                                                           <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/update_PACKAGES.html>update_PACKAGES</a>
#> 211                                                           <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/update_PACKAGES.html>update_PACKAGES</a>
#> 212                                                           <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/update_PACKAGES.html>update_PACKAGES</a>
#> 213                                                           <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/update_PACKAGES.html>update_PACKAGES</a>
#> 214                                                               <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/update_pkg_po.html>update_pkg_po</a>
#> 215                                                                            <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/uspop.html>uspop</a>
#> 216                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/vignetteEngine.html>vignetteEngine</a>
#> 217                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/vignetteEngine.html>vignetteEngine</a>
#> 218                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/vignetteEngine.html>vignetteEngine</a>
#> 219                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/vignetteEngine.html>vignetteEngine</a>
#> 220                                                                 <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/vignetteInfo.html>vignetteInfo</a>
#> 221                                                                        <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/volcano.html>volcano</a>
#> 222                                                                  <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/warpbreaks.html>warpbreaks</a>
#> 223                                                                            <a href=https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/women.html>women</a>
#> 224                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/write_PACKAGES.html>write_PACKAGES</a>
#> 225                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/write_PACKAGES.html>write_PACKAGES</a>
#> 226                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/write_PACKAGES.html>write_PACKAGES</a>
#> 227                                                             <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/write_PACKAGES.html>write_PACKAGES</a>
#> 228                                                                         <a href=https://www.rdocumentation.org/packages/tools/versions/3.6.2/topics/xgettext.html>xgettext</a>
#>                                                                                                                                                                                                              alias
#> 1                                                                                                                                                                                                .print.via.format
#> 2                                                                                                                                                                                 Adobe_glyphs, charset_to_Unicode
#> 3                                                                                                                                                                                                    AirPassengers
#> 4                                                                                                                                                                                            BJsales, BJsales.lead
#> 5                                                                                                                                                                                                              BOD
#> 6                                                                                                                                                                                                              CO2
#> 7                                                                                  CRAN_package_db, CRAN_check_results, CRAN_check_details, CRAN_check_issues, summarize_CRAN_check_status, R_CRAN_WEB, R_CRAN_SRC
#> 8                                                                                                                                                                                                      ChickWeight
#> 9                                                                                                                                                                                                            DNase
#> 10                                                                                                                                                                                                  EuStockMarkets
#> 11                                                                                                                                                                                                    Formaldehyde
#> 12                                                                                                                                                                                                      HTMLheader
#> 13                                                                                                                                                                                                      HTMLheader
#> 14                                                                                                                                                                                                      HTMLheader
#> 15                                                                                                                                                                                                      HTMLheader
#> 16                                                                                                                                                                                                    HairEyeColor
#> 17                                                                                                                                                                                                    Harman23.cor
#> 18                                                                                                                                                                                                    Harman74.cor
#> 19                                                                                                                                                                                                        Indometh
#> 20                                                                                                                                                                                                    InsectSprays
#> 21                                                                                                                                                                                                  JohnsonJohnson
#> 22                                                                                                                                                                                                       LakeHuron
#> 23                                                                                                                                                                                                LifeCycleSavings
#> 24                                                                                                                                                                                                        Loblolly
#> 25                                                                                                                                                                                                            Nile
#> 26                                                                                                                                                                                                          Orange
#> 27                                                                                                                                                                                                   OrchardSprays
#> 28                                                                                                                                                                                                     PlantGrowth
#> 29                                                                                                                                                                                                       Puromycin
#> 30                                                                                              QC, checkDocFiles, checkDocStyle, checkReplaceFuns, checkS3methods, checkRdContents, nonS3methods, langElts, print
#> 31                                                                                              QC, checkDocFiles, checkDocStyle, checkReplaceFuns, checkS3methods, checkRdContents, nonS3methods, langElts, print
#> 32                                                                                              QC, checkDocFiles, checkDocStyle, checkReplaceFuns, checkS3methods, checkRdContents, nonS3methods, langElts, print
#> 33                                                                                              QC, checkDocFiles, checkDocStyle, checkReplaceFuns, checkS3methods, checkRdContents, nonS3methods, langElts, print
#> 34                                                                                                                                                                                                      R_user_dir
#> 35                                                                                                                                                                                                            Rcmd
#> 36                                                                                                                                                                                Rd2txt, Rd2HTML, Rd2ex, Rd2latex
#> 37                                                                                                                                                                                                  Rd2txt_options
#> 38                                                                                                                                                                                                    RdTextFilter
#> 39                                                                                                                                                                                                    RdTextFilter
#> 40                                                                                                                                                                                                    RdTextFilter
#> 41                                                                                                                                                                                                    RdTextFilter
#> 42                                                                                                                                                                                                           Rd_db
#> 43                                                                                                                                                                                                           Rd_db
#> 44                                                                                                                                                                                                           Rd_db
#> 45                                                                                                                                                                                                           Rd_db
#> 46                                                                                                                                                                                                           Rdiff
#> 47                                                                                                                                                                                                         Rdindex
#> 48                                                                                                                                                                                                         Rdindex
#> 49                                                                                                                                                                                                         Rdindex
#> 50                                                                                                                                                                                                         Rdindex
#> 51                                                                                                                                                                                                 SweaveTeXFilter
#> 52                                                                                                                                                                                                 SweaveTeXFilter
#> 53                                                                                                                                                                                                 SweaveTeXFilter
#> 54                                                                                                                                                                                                 SweaveTeXFilter
#> 55                                                                                                                                                                                                          Theoph
#> 56                                                                                                                                                                                                         Titanic
#> 57                                                                                                                                                                                                     ToothGrowth
#> 58                                                                                                                                                                                                   UCBAdmissions
#> 59                                                                                                                                                                                       UKDriverDeaths, Seatbelts
#> 60                                                                                                                                                                         UKLungDeaths, ldeaths, fdeaths, mdeaths
#> 61                                                                                                                                                                                                           UKgas
#> 62                                                                                                                                                                                                     USAccDeaths
#> 63                                                                                                                                                                                                       USArrests
#> 64                                                                                                                                                                                                  USJudgeRatings
#> 65                                                                                                                                                                                           USPersonalExpenditure
#> 66                                                                                                                                                                                                        VADeaths
#> 67                                                                                                                                                                                                        WWWusage
#> 68                                                                                                                                                                                                     WorldPhones
#> 69                                                                                                                                                                                                     ability.cov
#> 70                                                                                                                                                                                                    add_datalist
#> 71                                                                                                                                                                                                        airmiles
#> 72                                                                                                                                                                                                      airquality
#> 73                                                                                                                                                                                                        anscombe
#> 74                                                                                                                                                                     assertCondition, assertWarning, assertError
#> 75                                                                                                                                                                     assertCondition, assertWarning, assertError
#> 76                                                                                                                                                                     assertCondition, assertWarning, assertError
#> 77                                                                                                                                                                     assertCondition, assertWarning, assertError
#> 78                                                                                                                                                                                                          attenu
#> 79                                                                                                                                                                                                        attitude
#> 80                                                                                                                                                                                                         austres
#> 81                                                                                                                                                                                       beavers, beaver1, beaver2
#> 82                                                                                                                                                                                           bibstyle, getBibstyle
#> 83                                                                                                                                                                                           bibstyle, getBibstyle
#> 84                                                                                                                                                                                                   buildVignette
#> 85                                                                                                                                                                                    buildVignettes, pkgVignettes
#> 86                                                                                                                                                                                    buildVignettes, pkgVignettes
#> 87                                                                                                                                                                                    buildVignettes, pkgVignettes
#> 88                                                                                                                                                                                    buildVignettes, pkgVignettes
#> 89                                                                                                                                                                                                            cars
#> 90                                                                                                                                                                                                  checkFF, print
#> 91                                                                                                                                                                                                  checkFF, print
#> 92                                                                                                                                                                                                  checkFF, print
#> 93                                                                                                                                                                                                  checkFF, print
#> 94                                                                                                                                                                                                    checkMD5sums
#> 95                                                                                                                                                                                       checkPoFile, checkPoFiles
#> 96                                                                                                                                                                                                         checkRd
#> 97                                                                                                                                                                                                         checkRd
#> 98                                                                                                                                                                                                         checkRd
#> 99                                                                                                                                                                                                         checkRd
#> 100                                                                                                                                                                                  checkRdaFiles, resaveRdaFiles
#> 101                                                                                                                                                                                                checkTnF, print
#> 102                                                                                                                                                                                                checkTnF, print
#> 103                                                                                                                                                                                                checkTnF, print
#> 104                                                                                                                                                                                                checkTnF, print
#> 105                                                                                                                                                                                          checkVignettes, print
#> 106                                                                                                                                                                                          checkVignettes, print
#> 107                                                                                                                                                                                          checkVignettes, print
#> 108                                                                                                                                                                                          checkVignettes, print
#> 109 check_packages_in_dir, summarize_check_packages_in_dir_depends, summarize_check_packages_in_dir_results, summarize_check_packages_in_dir_timings, check_packages_in_dir_changes, check_packages_in_dir_details
#> 110                                                                                                                                                                                                       chickwts
#> 111                                                                                                                                                                                                            co2
#> 112                                                                                                                                                                          codoc, codocClasses, codocData, print
#> 113                                                                                                                                                                                             compactPDF, format
#> 114                                                                                                                                                                                                        crimtab
#> 115                                                                                                                                                                                     datasets-package, datasets
#> 116                                                                                                                                                                                                     delimMatch
#> 117                                                                                                                                                                                                  dependsOnPkgs
#> 118                                                                                                                                                                                                    discoveries
#> 119                                                                                                                                                                                          encoded_text_to_latex
#> 120                                                                                                                                                                                                          esoph
#> 121                                                                                                                                                                                               euro, euro.cross
#> 122                                                                                                                                                                                            eurodist, UScitiesD
#> 123                                                                                                                                                                                                       faithful
#> 124                                                                                                                file_ext, file_path_as_absolute, file_path_sans_ext, list_files_with_exts, list_files_with_type
#> 125                                                                                                                                                                                                  findHTMLlinks
#> 126                                                                                                                                                                                      find_gs_cmd, R_GSCMD, GSC
#> 127                                                                                                                                                                                     freeny, freeny.x, freeny.y
#> 128                                                                                                                                                                                                getVignetteInfo
#> 129                                                                                                                                                                                                getVignetteInfo
#> 130                                                                                                                                                                                                getVignetteInfo
#> 131                                                                                                                                                                                                getVignetteInfo
#> 132                                                                                                                                                                                                         infert
#> 133                                                                                                                                                                                                    iris, iris3
#> 134                                                                                                                                                                                                        islands
#> 135                                                                                                                                                                                                             lh
#> 136                                                                                                                                                                                  loadRdMacros, loadPkgRdMacros
#> 137                                                                                                                                                                                  loadRdMacros, loadPkgRdMacros
#> 138                                                                                                                                                                                  loadRdMacros, loadPkgRdMacros
#> 139                                                                                                                                                                                  loadRdMacros, loadPkgRdMacros
#> 140                                                                                                                                                                                                        longley
#> 141                                                                                                                                                                                                           lynx
#> 142                                                                                                                                                                                                makeLazyLoading
#> 143                                                                                                                                                                                          make_translations_pkg
#> 144                                                                                                                                                                                   makevars_user, makevars_site
#> 145                                                                                                            matchConcordance, as.character, as.Rconcordance, Rconcordance, activeConcordance, followConcordance
#> 146                                                                                                                                                                                                         md5sum
#> 147                                                                                                                                                                                                         morley
#> 148                                                                                                                                                                                                         mtcars
#> 149                                                                                                                                                                                                         nhtemp
#> 150                                                                                                                                                                                                         nottem
#> 151                                                                                                                                                                                                            npk
#> 152                                                                                                                                                                                             occupationalStatus
#> 153                                                                                                                                                                                           package_dependencies
#> 154                                                                                                                                                                   package_native_routine_registration_skeleton
#> 155                                                                                                                                                                          parseLatex, deparseLatex, latexToUtf8
#> 156                                                                                                                                                                          parseLatex, deparseLatex, latexToUtf8
#> 157                                                                                                                                                                          parseLatex, deparseLatex, latexToUtf8
#> 158                                                                                                                                                                          parseLatex, deparseLatex, latexToUtf8
#> 159                                                                                                                                                                                  parse_Rd, print, as.character
#> 160                                                                                                                                                                                  parse_Rd, print, as.character
#> 161                                                                                                                                                                                  parse_Rd, print, as.character
#> 162                                                                                                                                                                                  parse_Rd, print, as.character
#> 163                                                                                                                                                                                                       pkg2HTML
#> 164                                                                                                                                                                                                         precip
#> 165                                                                                                                                                                                                     presidents
#> 166                                                                                                                                                                                                       pressure
#> 167                                                                                                        pskill, SIGHUP, SIGINT, SIGQUIT, SIGKILL, SIGTERM, SIGSTOP, SIGTSTP, SIGCONT, SIGCHLD, SIGUSR1, SIGUSR2
#> 168                                                                                                                                                                                                         psnice
#> 169                                                                                                                                                                                                         quakes
#> 170                                                                                                                                                                                                          randu
#> 171                                                                                                                                                                                                   read.00Index
#> 172                                                                                                                                                                                                   read.00Index
#> 173                                                                                                                                                                                                   read.00Index
#> 174                                                                                                                                                                                                   read.00Index
#> 175                                                                                                                                                                                                         rivers
#> 176                                                                                                                                                                                                           rock
#> 177                                                                                                                                                                                 showNonASCII, showNonASCIIfile
#> 178                                                                                                                                                                                                          sleep
#> 179                                                                                                                                                                                 stackloss, stack.loss, stack.x
#> 180                                                                                                                                                                  startDynamicHelp, help.ports, R_DISABLE_HTTPD
#> 181                                                                                                                state, state.abb, state.area, state.center, state.division, state.name, state.region, state.x77
#> 182                                                                                                                                                                                                  sunspot.month
#> 183                                                                                                                                                                                                   sunspot.year
#> 184                                                                                                                                                                                                       sunspots
#> 185                                                                                                                                                                                                          swiss
#> 186                                                                                                         testInstalledPackage, testInstalledPackages, testInstalledBasic, TEST_MC_CORES, standard_package_names
#> 187                                                                                                                                                                                             texi2dvi, texi2pdf
#> 188                                                                                                                                                                                                         toHTML
#> 189                                                                                                                                                                                                         toHTML
#> 190                                                                                                                                                                                                         toHTML
#> 191                                                                                                                                                                                                         toHTML
#> 192                                                                                                                                                                                                           toRd
#> 193                                                                                                                                                                                                           toRd
#> 194                                                                                                                                                                                                           toRd
#> 195                                                                                                                                                                                                           toRd
#> 196                                                                                                                                                                                                    toTitleCase
#> 197                                                                                                                                                                                               tools-deprecated
#> 198                                                                                                                                                                                           tools-package, tools
#> 199                                                                                                                                                                                           tools-package, tools
#> 200                                                                                                                                                                                           tools-package, tools
#> 201                                                                                                                                                                                           tools-package, tools
#> 202                                                                                                                                                                                           tools-package, tools
#> 203                                                                                                                                                                                           tools-package, tools
#> 204                                                                                                                                                                                           tools-package, tools
#> 205                                                                                                                                                                                           tools-package, tools
#> 206                                                                                                                                                                                           tools-package, tools
#> 207                                                                                                                                                                                                       treering
#> 208                                                                                                                                                                                                          trees
#> 209                                                                                                                                                                                                   undoc, print
#> 210                                                                                                                                                                                                update_PACKAGES
#> 211                                                                                                                                                                                                update_PACKAGES
#> 212                                                                                                                                                                                                update_PACKAGES
#> 213                                                                                                                                                                                                update_PACKAGES
#> 214                                                                                                                                                                                                  update_pkg_po
#> 215                                                                                                                                                                                                          uspop
#> 216                                                                                                                                                                                                 vignetteEngine
#> 217                                                                                                                                                                                                 vignetteEngine
#> 218                                                                                                                                                                                                 vignetteEngine
#> 219                                                                                                                                                                                                 vignetteEngine
#> 220                                                                                                                                                                                                   vignetteInfo
#> 221                                                                                                                                                                                                        volcano
#> 222                                                                                                                                                                                                     warpbreaks
#> 223                                                                                                                                                                                                          women
#> 224                                                                                                                                                                                                 write_PACKAGES
#> 225                                                                                                                                                                                                 write_PACKAGES
#> 226                                                                                                                                                                                                 write_PACKAGES
#> 227                                                                                                                                                                                                 write_PACKAGES
#> 228                                                                                                                                                                              xgettext, xngettext, xgettext2pot
#>                                                                  title
#> 1                                                   Printing Utilities
#> 2                             Conversion Tables between Character Sets
#> 3                          Monthly Airline Passenger Numbers 1949-1960
#> 4                                    Sales Data with Leading Indicator
#> 5                                            Biochemical Oxygen Demand
#> 6                                Carbon Dioxide Uptake in Grass Plants
#> 7                                        CRAN Package Repository Tools
#> 8                       Weight versus age of chicks on different diets
#> 9                                                 Elisa assay of DNase
#> 10     Daily Closing Prices of Major European Stock Indices, 1991-1998
#> 11                                       Determination of Formaldehyde
#> 12                          Generate a Standard HTML Header for R Help
#> 13                          Generate a Standard HTML Header for R Help
#> 14                          Generate a Standard HTML Header for R Help
#> 15                          Generate a Standard HTML Header for R Help
#> 16                           Hair and Eye Color of Statistics Students
#> 17                                                  Harman Example 2.3
#> 18                                                  Harman Example 7.4
#> 19                                    Pharmacokinetics of Indomethacin
#> 20                                      Effectiveness of Insect Sprays
#> 21                      Quarterly Earnings per Johnson & Johnson Share
#> 22                                       Level of Lake Huron 1875-1972
#> 23                                Intercountry Life-Cycle Savings Data
#> 24                                       Growth of Loblolly Pine Trees
#> 25                                              Flow of the River Nile
#> 26                                              Growth of Orange Trees
#> 27                                           Potency of Orchard Sprays
#> 28                          Results from an Experiment on Plant Growth
#> 29                          Reaction Velocity of an Enzymatic Reaction
#> 30                           QC Checks for R Code and/or Documentation
#> 31                           QC Checks for R Code and/or Documentation
#> 32                           QC Checks for R Code and/or Documentation
#> 33                           QC Checks for R Code and/or Documentation
#> 34                                                  R User Directories
#> 35                                                   'R CMD' Interface
#> 36                                                       Rd Converters
#> 37                                Set Formatting Options for Text Help
#> 38                                           Select Text in an Rd File
#> 39                                           Select Text in an Rd File
#> 40                                           Select Text in an Rd File
#> 41                                           Select Text in an Rd File
#> 42                                                        Rd Utilities
#> 43                                                        Rd Utilities
#> 44                                                        Rd Utilities
#> 45                                                        Rd Utilities
#> 46                                           Difference R Output Files
#> 47                                        Generate Index from Rd Files
#> 48                                        Generate Index from Rd Files
#> 49                                        Generate Index from Rd Files
#> 50                                        Generate Index from Rd Files
#> 51                                     Strip R Code out of Sweave File
#> 52                                     Strip R Code out of Sweave File
#> 53                                     Strip R Code out of Sweave File
#> 54                                     Strip R Code out of Sweave File
#> 55                                    Pharmacokinetics of Theophylline
#> 56                               Survival of passengers on the Titanic
#> 57              The Effect of Vitamin C on Tooth Growth in Guinea Pigs
#> 58                                   Student Admissions at UC Berkeley
#> 59                            Road Casualties in Great Britain 1969-84
#> 60                         Monthly Deaths from Lung Diseases in the UK
#> 61                                        UK Quarterly Gas Consumption
#> 62                               Accidental Deaths in the US 1973-1978
#> 63                                     Violent Crime Rates by US State
#> 64           Lawyers' Ratings of State Judges in the US Superior Court
#> 65                                           Personal Expenditure Data
#> 66                                      Death Rates in Virginia (1940)
#> 67                                           Internet Usage per Minute
#> 68                                              The World's Telephones
#> 69                                      Ability and Intelligence Tests
#> 70                           Add a 'datalist' File to a Source Package
#> 71                Passenger Miles on Commercial US Airlines, 1937-1960
#> 72                                   New York Air Quality Measurements
#> 73         Anscombe's Quartet of 'Identical' Simple Linear Regressions
#> 74                                          Asserting Error Conditions
#> 75                                          Asserting Error Conditions
#> 76                                          Asserting Error Conditions
#> 77                                          Asserting Error Conditions
#> 78                                   The Joyner-Boore Attenuation Data
#> 79                                  The Chatterjee-Price Attitude Data
#> 80         Quarterly Time Series of the Number of Australian Residents
#> 81                              Body Temperature Series of Two Beavers
#> 82                               Select or Define a Bibliography Style
#> 83                               Select or Define a Bibliography Style
#> 84                                                  Build One Vignette
#> 85                                    List and Build Package Vignettes
#> 86                                    List and Build Package Vignettes
#> 87                                    List and Build Package Vignettes
#> 88                                    List and Build Package Vignettes
#> 89                                Speed and Stopping Distances of Cars
#> 90                                        Check Foreign Function Calls
#> 91                                        Check Foreign Function Calls
#> 92                                        Check Foreign Function Calls
#> 93                                        Check Foreign Function Calls
#> 94                                 Check and Create MD5 Checksum Files
#> 95             Check Translation Files for Inconsistent Format Strings
#> 96                                                  Check an Rd Object
#> 97                                                  Check an Rd Object
#> 98                                                  Check an Rd Object
#> 99                                                  Check an Rd Object
#> 100                 Report on Details of Saved Images or Re-saves them
#> 101                                   Check R Packages or Code for T/F
#> 102                                   Check R Packages or Code for T/F
#> 103                                   Check R Packages or Code for T/F
#> 104                                   Check R Packages or Code for T/F
#> 105                                            Check Package Vignettes
#> 106                                            Check Package Vignettes
#> 107                                            Check Package Vignettes
#> 108                                            Check Package Vignettes
#> 109               Check Source Packages and Their Reverse Dependencies
#> 110                                       Chicken Weights by Feed Type
#> 111                            Mauna Loa Atmospheric CO2 Concentration
#> 112                               Check Code/Documentation Consistency
#> 113                                                  Compact PDF Files
#> 114                                      Student's 3000 Criminals Data
#> 115                                             The R Datasets Package
#> 116                                         Delimited Pattern Matching
#> 117                                          Find Reverse Dependencies
#> 118                            Yearly Numbers of Important Discoveries
#> 119                          Translate non-ASCII Text to LaTeX Escapes
#> 120                          Smoking, Alcohol and (O)esophageal Cancer
#> 121                                Conversion Rates of Euro Currencies
#> 122            Distances Between European Cities and Between US Cities
#> 123                                           Old Faithful Geyser Data
#> 124                                                     File Utilities
#> 125                      Collect HTML Links from Package Documentation
#> 126                                      Find a GhostScript Executable
#> 127                                              Freeny's Revenue Data
#> 128                             Get Information on Installed Vignettes
#> 129                             Get Information on Installed Vignettes
#> 130                             Get Information on Installed Vignettes
#> 131                             Get Information on Installed Vignettes
#> 132                 Infertility after Spontaneous and Induced Abortion
#> 133                                         Edgar Anderson's Iris Data
#> 134                              Areas of the World's Major Landmasses
#> 135                               Luteinizing Hormone in Blood Samples
#> 136                            Load User-defined Rd Help System Macros
#> 137                            Load User-defined Rd Help System Macros
#> 138                            Load User-defined Rd Help System Macros
#> 139                            Load User-defined Rd Help System Macros
#> 140                                 Longley's Economic Regression Data
#> 141                           Annual Canadian Lynx trappings 1821-1934
#> 142                                           Lazy Loading of Packages
#> 143                  Package the Current Translations in the R Sources
#> 144                                User and Site Compilation Variables
#> 145                        Concordance between source and target lines
#> 146                                              Compute MD5 Checksums
#> 147                                      Michelson Speed of Light Data
#> 148                                         Motor Trend Car Road Tests
#> 149                           Average Yearly Temperatures in New Haven
#> 150              Average Monthly Temperatures at Nottingham, 1920-1939
#> 151                             Classical N, P, K Factorial Experiment
#> 152                      Occupational Status of Fathers and their Sons
#> 153               Computations on the Dependency Hierarchy of Packages
#> 154 Write Skeleton for Adding Native Routine Registration to a Package
#> 155                     Experimental Functions to Work with LaTeX Code
#> 156                     Experimental Functions to Work with LaTeX Code
#> 157                     Experimental Functions to Work with LaTeX Code
#> 158                     Experimental Functions to Work with LaTeX Code
#> 159                                                   Parse an Rd File
#> 160                                                   Parse an Rd File
#> 161                                                   Parse an Rd File
#> 162                                                   Parse an Rd File
#> 163                                                      Rd Converters
#> 164                                  Annual Precipitation in US Cities
#> 165                        Quarterly Approval Ratings of US Presidents
#> 166             Vapor Pressure of Mercury as a Function of Temperature
#> 167                                                     Kill a Process
#> 168                    Get or Set the Priority (Niceness) of a Process
#> 169                                  Locations of Earthquakes off Fiji
#> 170                   Random Numbers from Congruential Generator RANDU
#> 171                                           Read 00Index-style Files
#> 172                                           Read 00Index-style Files
#> 173                                           Read 00Index-style Files
#> 174                                           Read 00Index-style Files
#> 175                             Lengths of Major North American Rivers
#> 176                             Measurements on Petroleum Rock Samples
#> 177                                      Pick Out Non-ASCII Characters
#> 178                                               Student's Sleep Data
#> 179                                   Brownlee's Stack Loss Plant Data
#> 180                                 Start the Dynamic HTML Help System
#> 181                                         US State Facts and Figures
#> 182                       Monthly Sunspot Data, from 1749 to "Present"
#> 183                                     Yearly Sunspot Data, 1700-1988
#> 184                                 Monthly Sunspot Numbers, 1749-1983
#> 185           Swiss Fertility and Socioeconomic Indicators (1888) Data
#> 186                                            Test Installed Packages
#> 187                                                Compile LaTeX Files
#> 188                                          Display an Object in HTML
#> 189                                          Display an Object in HTML
#> 190                                          Display an Object in HTML
#> 191                                          Display an Object in HTML
#> 192        Generic Function to Convert Object to a Fragment of Rd Code
#> 193        Generic Function to Convert Object to a Fragment of Rd Code
#> 194        Generic Function to Convert Object to a Fragment of Rd Code
#> 195        Generic Function to Convert Object to a Fragment of Rd Code
#> 196                                       Convert Titles to Title Case
#> 197                              Deprecated Objects in Package 'tools'
#> 198                                      Tools for Package Development
#> 199                                      Tools for Package Development
#> 200                                      Tools for Package Development
#> 201                                      Tools for Package Development
#> 202                                      Tools for Package Development
#> 203                                      Tools for Package Development
#> 204                                      Tools for Package Development
#> 205                                      Tools for Package Development
#> 206                                      Tools for Package Development
#> 207                                  Yearly Tree-Ring Data, -6000-1979
#> 208                 Diameter, Height and Volume for Black Cherry Trees
#> 209                                          Find Undocumented Objects
#> 210                                     Update Existing PACKAGES Files
#> 211                                     Update Existing PACKAGES Files
#> 212                                     Update Existing PACKAGES Files
#> 213                                     Update Existing PACKAGES Files
#> 214                                 Prepare Translations for a Package
#> 215                              Populations Recorded by the US Census
#> 216                            Set or Get a Vignette Processing Engine
#> 217                            Set or Get a Vignette Processing Engine
#> 218                            Set or Get a Vignette Processing Engine
#> 219                            Set or Get a Vignette Processing Engine
#> 220                                 Basic Information about a Vignette
#> 221          Topographic Information on Auckland's Maunga Whau Volcano
#> 222                        The Number of Breaks in Yarn during Weaving
#> 223                     Average Heights and Weights for American Women
#> 224                                            Generate PACKAGES Files
#> 225                                            Generate PACKAGES Files
#> 226                                            Generate PACKAGES Files
#> 227                                            Generate PACKAGES Files
#> 228            Extract Translatable Messages from R Files in a Package
#>                                  concept  package
#> 1                              Utilities    tools
#> 2           Datasets available by data()    tools
#> 3           Datasets available by data() datasets
#> 4           Datasets available by data() datasets
#> 5           Datasets available by data() datasets
#> 6           Datasets available by data() datasets
#> 7                                   <NA>    tools
#> 8           Datasets available by data() datasets
#> 9           Datasets available by data() datasets
#> 10          Datasets available by data() datasets
#> 11          Datasets available by data() datasets
#> 12                             Utilities    tools
#> 13                         Documentation    tools
#> 14                             Utilities    tools
#> 15                         Documentation    tools
#> 16          Datasets available by data() datasets
#> 17          Datasets available by data() datasets
#> 18          Datasets available by data() datasets
#> 19          Datasets available by data() datasets
#> 20          Datasets available by data() datasets
#> 21          Datasets available by data() datasets
#> 22          Datasets available by data() datasets
#> 23          Datasets available by data() datasets
#> 24          Datasets available by data() datasets
#> 25          Datasets available by data() datasets
#> 26          Datasets available by data() datasets
#> 27          Datasets available by data() datasets
#> 28          Datasets available by data() datasets
#> 29          Datasets available by data() datasets
#> 30                             Utilities    tools
#> 31                         Documentation    tools
#> 32                             Utilities    tools
#> 33                         Documentation    tools
#> 34                                  <NA>    tools
#> 35                             Utilities    tools
#> 36                         Documentation    tools
#> 37                         Documentation    tools
#> 38                             Utilities    tools
#> 39                         Documentation    tools
#> 40                             Utilities    tools
#> 41                         Documentation    tools
#> 42                             Utilities    tools
#> 43                         Documentation    tools
#> 44                             Utilities    tools
#> 45                         Documentation    tools
#> 46                             Utilities    tools
#> 47                         Documentation    tools
#> 48                             Utilities    tools
#> 49                         Documentation    tools
#> 50                             Utilities    tools
#> 51                             Utilities    tools
#> 52                         Documentation    tools
#> 53                             Utilities    tools
#> 54                         Documentation    tools
#> 55          Datasets available by data() datasets
#> 56          Datasets available by data() datasets
#> 57          Datasets available by data() datasets
#> 58          Datasets available by data() datasets
#> 59          Datasets available by data() datasets
#> 60          Datasets available by data() datasets
#> 61          Datasets available by data() datasets
#> 62          Datasets available by data() datasets
#> 63          Datasets available by data() datasets
#> 64          Datasets available by data() datasets
#> 65          Datasets available by data() datasets
#> 66          Datasets available by data() datasets
#> 67          Datasets available by data() datasets
#> 68          Datasets available by data() datasets
#> 69          Datasets available by data() datasets
#> 70                             Utilities    tools
#> 71          Datasets available by data() datasets
#> 72          Datasets available by data() datasets
#> 73          Datasets available by data() datasets
#> 74                           Programming    tools
#> 75                        Error Handling    tools
#> 76                           Programming    tools
#> 77                        Error Handling    tools
#> 78          Datasets available by data() datasets
#> 79          Datasets available by data() datasets
#> 80          Datasets available by data() datasets
#> 81          Datasets available by data() datasets
#> 82                              utilties    tools
#> 83                         Documentation    tools
#> 84                         Documentation    tools
#> 85                             Utilities    tools
#> 86                         Documentation    tools
#> 87                             Utilities    tools
#> 88                         Documentation    tools
#> 89          Datasets available by data() datasets
#> 90                           Programming    tools
#> 91                             Utilities    tools
#> 92                           Programming    tools
#> 93                             Utilities    tools
#> 94                             Utilities    tools
#> 95                             Utilities    tools
#> 96                             Utilities    tools
#> 97                         Documentation    tools
#> 98                             Utilities    tools
#> 99                         Documentation    tools
#> 100                            Utilities    tools
#> 101                            Utilities    tools
#> 102                        Documentation    tools
#> 103                            Utilities    tools
#> 104                        Documentation    tools
#> 105                            Utilities    tools
#> 106                        Documentation    tools
#> 107                            Utilities    tools
#> 108                        Documentation    tools
#> 109                            Utilities    tools
#> 110         Datasets available by data() datasets
#> 111         Datasets available by data() datasets
#> 112                        Documentation    tools
#> 113                            Utilities    tools
#> 114         Datasets available by data() datasets
#> 115                    Package Summaries datasets
#> 116 Character Data ("String") Operations    tools
#> 117                            Utilities    tools
#> 118         Datasets available by data() datasets
#> 119                            Utilities    tools
#> 120         Datasets available by data() datasets
#> 121         Datasets available by data() datasets
#> 122         Datasets available by data() datasets
#> 123         Datasets available by data() datasets
#> 124                   Input/Output Files    tools
#> 125                        Documentation    tools
#> 126                                 <NA>    tools
#> 127         Datasets available by data() datasets
#> 128                            Utilities    tools
#> 129                        Documentation    tools
#> 130                            Utilities    tools
#> 131                        Documentation    tools
#> 132         Datasets available by data() datasets
#> 133         Datasets available by data() datasets
#> 134         Datasets available by data() datasets
#> 135         Datasets available by data() datasets
#> 136                            Utilities    tools
#> 137                        Documentation    tools
#> 138                            Utilities    tools
#> 139                        Documentation    tools
#> 140         Datasets available by data() datasets
#> 141         Datasets available by data() datasets
#> 142                            Utilities    tools
#> 143                            Utilities    tools
#> 144                            Utilities    tools
#> 145                                 <NA>    tools
#> 146                            Utilities    tools
#> 147         Datasets available by data() datasets
#> 148         Datasets available by data() datasets
#> 149         Datasets available by data() datasets
#> 150         Datasets available by data() datasets
#> 151         Datasets available by data() datasets
#> 152         Datasets available by data() datasets
#> 153                            Utilities    tools
#> 154                                 <NA>    tools
#> 155                            Utilities    tools
#> 156                        Documentation    tools
#> 157                            Utilities    tools
#> 158                        Documentation    tools
#> 159                            Utilities    tools
#> 160                        Documentation    tools
#> 161                            Utilities    tools
#> 162                        Documentation    tools
#> 163                        Documentation    tools
#> 164         Datasets available by data() datasets
#> 165         Datasets available by data() datasets
#> 166         Datasets available by data() datasets
#> 167                            Utilities    tools
#> 168                              utility    tools
#> 169         Datasets available by data() datasets
#> 170         Datasets available by data() datasets
#> 171                   Input/Output Files    tools
#> 172             Input/Output Connections    tools
#> 173                   Input/Output Files    tools
#> 174             Input/Output Connections    tools
#> 175         Datasets available by data() datasets
#> 176         Datasets available by data() datasets
#> 177                            Utilities    tools
#> 178         Datasets available by data() datasets
#> 179         Datasets available by data() datasets
#> 180                        Documentation    tools
#> 181         Datasets available by data() datasets
#> 182         Datasets available by data() datasets
#> 183         Datasets available by data() datasets
#> 184         Datasets available by data() datasets
#> 185         Datasets available by data() datasets
#> 186                            Utilities    tools
#> 187                            Utilities    tools
#> 188                            Utilities    tools
#> 189                        Documentation    tools
#> 190                            Utilities    tools
#> 191                        Documentation    tools
#> 192                            Utilities    tools
#> 193                        Documentation    tools
#> 194                            Utilities    tools
#> 195                        Documentation    tools
#> 196                                 <NA>    tools
#> 197                        Miscellaneous    tools
#> 198                    Package Summaries    tools
#> 199                          Programming    tools
#> 200                        Documentation    tools
#> 201                    Package Summaries    tools
#> 202                          Programming    tools
#> 203                        Documentation    tools
#> 204                    Package Summaries    tools
#> 205                          Programming    tools
#> 206                        Documentation    tools
#> 207         Datasets available by data() datasets
#> 208         Datasets available by data() datasets
#> 209                        Documentation    tools
#> 210                   Input/Output Files    tools
#> 211                            Utilities    tools
#> 212                   Input/Output Files    tools
#> 213                            Utilities    tools
#> 214                            Utilities    tools
#> 215         Datasets available by data() datasets
#> 216                            Utilities    tools
#> 217                        Documentation    tools
#> 218                            Utilities    tools
#> 219                        Documentation    tools
#> 220                            Utilities    tools
#> 221         Datasets available by data() datasets
#> 222         Datasets available by data() datasets
#> 223         Datasets available by data() datasets
#> 224                   Input/Output Files    tools
#> 225                            Utilities    tools
#> 226                   Input/Output Files    tools
#> 227                            Utilities    tools
#> 228                            Utilities    tools

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
