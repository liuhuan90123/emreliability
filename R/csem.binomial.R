#' CSEM and CSSEM with Binomial Model
#'
#' @description
#' Compute the CSEM and CSSEM using binomial model
#'
#' @param ni a numeric value indicating the number of items
#' @param ct A data frame or matrix containing conversion table with the first column
#' as raw scores and the second column as scale scores
#'
#' @details
#'
#' @return a list containing raw scores and corresponding CSEM using bimonial model,
#' and CSSEM if the conversion table is provided
#'
#' @references
#'
#' @export
#'
#' @examples
#' csem.binomial(40)
#' csem.binomial(40, ct.u)
#'
csem.binomial <- function(ni, ct = NULL) {

  # create vectors to store csem
  csemx <- c()
  csems <- c()

  # for loop to calculate prob for each true score
  for (k in 0:ni){

    # take raw score as true score
    pi = k / ni

    # set raw score
    r <- c(0:ni)

    # prob for each true score
    p <- choose(ni, r) * (pi)^r * (1 - pi)^(ni-r)

    # SEM formula (13) in Lee's notes CH5
    csemxk <- sqrt(ni / (ni-1)) * sqrt(sum(r^2 * p) - sum(r * p)^2)

    # save, note, k+1 here, not k
    csemx[k+1] <- csemxk

    if(!is.null(ct)){

      # SEM formula (14) in Lee's notes CH5
      csemsk <- sqrt(ni / (ni-1)) * sqrt(sum(ct[,2]^2 * p) - sum(ct[,2] * p)^2)

      # save, note, k+1 here, not k
      csems[k+1] <- csemsk
    }
  }

  # return
  if(!is.null(ct)){return(list(x = 0:ni, csem = csemx, cssem = csems))}

  return(list(x = 0:ni, csem = csemx))
}




