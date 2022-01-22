#' Feldt's Coefficient
#'
#' @description
#' Compute the Feldt's coefficient
#'
#' @param x A data frame or matrix containing data with rows as subjects and columns as items
#'
#' @details Feldt's coefficient is one of several estimates of the internal consistency reliability of a test.
#'
#' @return Feldt's coefficient
#'
#' @references Brennan, R. L.(Ed.). (2006). \emph{Educational Measurement} (4th ed.). Westport, CT:Praeger Publishers.
#'
#' @export
#'
#' @examples
#' data(data.u)
#' feldt(data.u)
#'
#'
feldt <- function(x){

  # remove missing values
  x <- na.exclude(x)

  # sum of total variance
  vt <- sum(cov(x))

  # sum of variance of each item
  vi <- sum(diag(cov(x)))

  # sum of covariance
  cov <- sum(rowSums(cov(x))^2)

  # feldt
  feldt <- vt * (vt - vi) / (vt^2 - cov) # EM4
  # feldt <- vt^2 / (vt^2 - cov) * (vt - vi) / vt # Lee notes

  # return
  return(list(feldt = feldt))

}
