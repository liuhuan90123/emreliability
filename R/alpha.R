#' Cronbach's Coefficient Alpha
#'
#' @description
#' Compute the popular Cronbach's coefficient alpha and associated SEM
#'
#' @param x A data frame or matrix containing data with rows as subjects and columns as items
#'
#' @details Alpha is one of several estimates of the internal consistency reliability of a test.
#'
#' @return Cronbach's coefficient alpha and associated SEM
#'
#' @references Cronbach, L. J. (1951). Coefficient alpha and the internal structure of tests. \emph{Psychometrika, 6,} 297-334.
#'
#' @export
#'
#' @examples
#' data(data.u)
#' alpha(data.u)
#'
#'
alpha <- function(x) {

  # remove missing values
  x <- na.exclude(x)

  # num of items
  ni <- ncol(x)

  # sum of variance of each item
  vi <- sum(diag(cov(x)))

  # sum of total variance
  vt <- sum(cov(x))

  # alpha
  alpha <- ni / (ni - 1) * (vt - vi) / vt

  # SEM
  sem <- sd(rowSums(x)) * sqrt(1 - alpha)

  # return
  return(list(alpha = alpha, sem = sem))

}
