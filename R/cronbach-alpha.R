#' Cronbach's Alpha
#'
#' @description
#' A function to calculate Cronbach's Alpha reliability in CTT
#' @param dat a data frame or matrix containing raw data
#'
#' @return Cronbach's Alpha reliability
#' @export
#'
#' @examples
#'
#'
cronbach_alpha <- function(dat){
  # num of culomns
  numColumn <- ncol(dat)

  # sum of variance of each item
  varItemSum <- sum(diag(cov(dat)))

  # sum of total variance
  varTotal <- sum(cov(dat))

  cronbachAlpha <- numColumn / (numColumn - 1) * (varTotal - varItemSum)/varTotal

  return(cronbachAlpha)
}
