#' Stratified Cronbach's Coefficient Alpha
#'
#' @description
#' Compute the stratified Cronbach's coefficient alpha
#'
#' @param x A data frame or matrix containing data with rows as subjects and items as columns
#' @param s A vector containing number of items for each strat
#'
#' @details Stratified alpha is one of several estimates of the internal consistency reliability of a test.
#'
#' @return stratified Cronbach's coefficient alpha
#'
#' @references Cronbach, L. J., Schoenemann, P., & McKie, D. (1965). Alpha coefficient for stratified-parallel
#' tests. \emph{Educational and Psychological Measurement, 25,} 291-312.
#'
#' @export
#'
#' @examples
#' data(data.m)
#' stratified.alpha(data.m, c(13, 12, 6))
#'
#'
stratified.alpha <- function(x, s) {

  # num of strats
  ns <- length(s)

  # vector of reliability and variance
  ri <- c()
  vi <- c()

  # Cronbach's alpha and variance for strat #1
  for (k in 1:1) {
    ri[k] <- alpha(x[,1:s[k]])$alpha
    vi[k] <- sum(cov(x[,1:s[k]]))
  }

  # Cronbach's alpha and variance for strat #2 to #numStrat
  for (k in 2:ns) {
    ri[k] <- alpha(x[,(sum(s[1:k-1])+1):sum(s[1:k])])$alpha
    vi[k] <- sum(cov(x[,(sum(s[1:k-1])+1):sum(s[1:k])]))
  }

  # sum of total variance: variance of composite score
  vt <- sum(cov(x))

  # stratified alpha
  stratified.alpha <- 1 - sum(vi * (1 - as.vector(ri))) / vt

  # return
  return(list(stratified.alpha = stratified.alpha))

}
