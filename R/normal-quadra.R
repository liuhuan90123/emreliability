#' Gaussian quadrature points and weights
#'
#' @description
#' Generate Gaussian quadrature points and corresponding weights
#'
#' @param n Number of quadrature points
#' @param mm Absolute value of minumum or maximum of quadrature points
#'
#' @return A list of Gaussian quadrature points and corresponding weights
#' @export
#'
#' @examples
#' normal_quadra(41, 5)
#'
#'
normal_quadra <- function(n, mm) {

  # set nodes ranging from -5 to 5
  nodes <- seq(-mm, mm, length.out = n)

  # unnormalized weights
  weightsUnwtd <- sapply(nodes, FUN = function(x) dnorm(x))

  # normalized weightes
  weightsWtd <- weightsUnwtd / sum(weightsUnwtd)

  # return nodes and normalized weights
  return(list("nodes" = nodes, "weights" = weightsWtd))

}
