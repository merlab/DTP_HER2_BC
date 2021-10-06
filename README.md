# DTP_HER2_BC
Code and data for G0 signature ([Oki et al.](https://doi.org/10.1038/srep04012))  analysis of the lapatinib arm of the NeoALTTO trial. The `data` directory contains all necessary data for the analysis, including G0 signature and scaled NeoALTTO gene expression matrix for corresponding genes. The directory `R` has code for computing score and visualizing the data. For running the code R session information is as follows:

```r
session_info()
```

```r
─ Session info ────────────────────────────────────────────────────
 setting  value                       
 version  R version 4.0.3 (2020-10-10)
 os       Linux Mint 20.2             
 system   x86_64, linux-gnu           
 ui       RStudio                     
 language en_CA                       
 collate  en_CA.UTF-8                 
 ctype    en_CA.UTF-8                 
 tz       America/Toronto             
 date     2021-10-05                  

─ Packages ────────────────────────────────────────────────────────
 package     * version date       lib source        
 abind         1.4-5   2016-07-21 [1] CRAN (R 4.0.2)
 assertthat    0.2.1   2019-03-21 [1] CRAN (R 4.0.2)
 backports     1.2.1   2020-12-09 [1] CRAN (R 4.0.3)
 broom         0.7.8   2021-06-24 [1] CRAN (R 4.0.3)
 car           3.0-11  2021-06-27 [1] CRAN (R 4.0.3)
 carData       3.0-4   2020-05-22 [1] CRAN (R 4.0.2)
 cellranger    1.1.0   2016-07-27 [1] CRAN (R 4.0.2)
 cli           3.0.0   2021-06-30 [1] CRAN (R 4.0.3)
 clipr         0.7.1   2020-10-08 [1] CRAN (R 4.0.3)
 colorspace    2.0-2   2021-06-24 [1] CRAN (R 4.0.3)
 crayon        1.4.1   2021-02-08 [1] CRAN (R 4.0.3)
 curl          4.3.2   2021-06-23 [1] CRAN (R 4.0.3)
 data.table    1.14.0  2021-02-21 [1] CRAN (R 4.0.3)
 DBI           1.1.1   2021-01-15 [1] CRAN (R 4.0.3)
 digest        0.6.27  2020-10-24 [1] CRAN (R 4.0.3)
 dplyr         1.0.7   2021-06-18 [1] CRAN (R 4.0.3)
 ellipsis      0.3.2   2021-04-29 [1] CRAN (R 4.0.3)
 fansi         0.5.0   2021-05-25 [1] CRAN (R 4.0.3)
 farver        2.1.0   2021-02-28 [1] CRAN (R 4.0.3)
 forcats       0.5.1   2021-01-27 [1] CRAN (R 4.0.3)
 foreign       0.8-79  2020-04-26 [4] CRAN (R 4.0.0)
 generics      0.1.0   2020-10-31 [1] CRAN (R 4.0.3)
 ggplot2     * 3.3.5   2021-06-25 [1] CRAN (R 4.0.3)
 ggpubr      * 0.4.0   2020-06-27 [1] CRAN (R 4.0.2)
 ggsci         2.9     2018-05-14 [1] CRAN (R 4.0.2)
 ggsignif      0.6.2   2021-06-14 [1] CRAN (R 4.0.3)
 glue          1.4.2   2020-08-27 [1] CRAN (R 4.0.2)
 gtable        0.3.0   2019-03-25 [1] CRAN (R 4.0.2)
 haven         2.4.1   2021-04-23 [1] CRAN (R 4.0.3)
 hms           1.1.0   2021-05-17 [1] CRAN (R 4.0.3)
 labeling      0.4.2   2020-10-20 [1] CRAN (R 4.0.3)
 lifecycle     1.0.0   2021-02-15 [1] CRAN (R 4.0.3)
 magrittr      2.0.1   2020-11-17 [1] CRAN (R 4.0.3)
 munsell       0.5.0   2018-06-12 [1] CRAN (R 4.0.2)
 openxlsx      4.2.4   2021-06-16 [1] CRAN (R 4.0.3)
 pillar        1.6.1   2021-05-16 [1] CRAN (R 4.0.3)
 pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 4.0.2)
 purrr         0.3.4   2020-04-17 [1] CRAN (R 4.0.2)
 R6            2.5.0   2020-10-28 [1] CRAN (R 4.0.3)
 Rcpp          1.0.7   2021-07-07 [1] CRAN (R 4.0.3)
 readxl        1.3.1   2019-03-13 [1] CRAN (R 4.0.2)
 rio           0.5.27  2021-06-21 [1] CRAN (R 4.0.3)
 rlang         0.4.11  2021-04-30 [1] CRAN (R 4.0.3)
 rstatix       0.7.0   2021-02-13 [1] CRAN (R 4.0.3)
 rstudioapi    0.13    2020-11-12 [1] CRAN (R 4.0.3)
 scales        1.1.1   2020-05-11 [1] CRAN (R 4.0.2)
 sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 4.0.3)
 stringi       1.7.2   2021-07-14 [1] CRAN (R 4.0.3)
 tibble        3.1.2   2021-05-16 [1] CRAN (R 4.0.3)
 tidyr         1.1.3   2021-03-03 [1] CRAN (R 4.0.3)
 tidyselect    1.1.1   2021-04-30 [1] CRAN (R 4.0.3)
 utf8          1.2.1   2021-03-12 [1] CRAN (R 4.0.3)
 vctrs         0.3.8   2021-04-29 [1] CRAN (R 4.0.3)
 withr         2.4.2   2021-04-18 [1] CRAN (R 4.0.3)
 zip           2.2.0   2021-05-31 [1] CRAN (R 4.0.3)

```
