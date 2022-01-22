#' Stratified Feldt's Coefficient
#'
#' @description
#' Compute the stratified Feldt's coefficient
#'
#' @param x A data frame or matrix containing data with rows as subjects and items as columns
#' @param s A vector containing number of items for each strat
#'
#' @details Stratified Feldt's coefficient is one of several estimates of the internal consistency reliability of a test.
#'
#' @return stratified Feldt's coefficient
#'
#' @references
#'
#' @export
#'
#' @examples
#' data(data.m)
#' stratified.feldt(data.m, c(13, 12, 6))
#'
#'
stratified.feldt <- function(x, s) {

  # stratified feldt through csem.compound.binomial
  stratified.feldt <- 1- mean(csem.compound.binomial(x, s)$csem^2)/var(rowSums(x))

  # return
  return(list(stratified.feldt = stratified.feldt))

}
