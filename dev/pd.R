library(devtools)
library(fs)
library(roxygen2)
library(rmarkdown)
library(usethis)
# library(renv)


# install.packages("usethis")

# install.packages("usethis")

## create package
# create_package("C:\\Users\\liuhu\\OneDrive - University of Iowa\\Github\\emreliability")



# use_git()
#
# check()
#
# %>%
#
# load_all()

# install.packages("renv")
# renv::init()
# renv::snapshot()

# 如果有引入新的包，运行 renv::snapshot() 进行 lockfile 的更新；
# 如果想更新所使用的包，运行 renv::update() 进行包本身的更新；
# 如果换了电脑进行开发，运行 renv::restore() 恢复到开发时用的包环境

# install.packages("rmarkdown")


# usethis::use_readme_rmd()





# make all functions avaliable for testing

load_all()

normal_quadra(11,4)


## check package
check()



# change license
use_mit_license("emreliability authors")


# all .rd files
document()

# ?normal_quadra
# ?cronbach_alpha


# build manual

build_manual(pkg = ".")


# install
install()



# read me file
use_readme_rmd()


build_readme()




# install.packages("styler")
library(styler)
# style_file("R\\cronbach-alpha.R")



# install.packages("lintr")

lintr::lint_package()




# test functions
usethis::use_testthat()
usethis::use_test()


# right corner under build to test package




# 升级版本号
usethis::use_version()


# install.packages("pkgdown")

# usethis::use_pkgdown()
#
#
# pkgdown::build_site()



# usethis::use_tidy_github_actions()



Authors@R: c(
  person(given = "Huan",
         family = "Liu",
         role = c("aut", "cre"),
         email = "huan-liu-1@uiowa.edu"),
  person(given = "Won-Chan",
         family = "Lee",
         role = c("aut"),
         email = "won-chan-lee@uiowa.edu"))
