#' Generate Gaussian quadrature points and corresponding weights
#'
#' @param nnodes Number of quadrature points
#' @param minmax Absolute value of minumum or maximum of quadrature points
#'
#' @return A list of Gaussian quadrature points and corresponding weights
#' @export
#'
#' @examples
#' normal_quadra(41, 5)
#'
#'
normal_quadra <- function(nnodes, minmax) {

  # set nodes ranging from -5 to 5
  nodes <- seq(-minmax, minmax, length.out = nnodes)

  # unnormalized weights
  weightsUnwtd <- sapply(nodes, FUN = function(x) dnorm(x))

  # normalized weightes
  weightsWtd <- weightsUnwtd / sum(weightsUnwtd)

  # return nodes and normalized weights
  return(list("nodes" = nodes, "weights" = weightsWtd))

}
