#' CSEM with Compound Binomial Model
#'
#' @description
#' Compute the CSEM using compound binomial model
#'
#' @param x A data frame or matrix containing data with rows as subjects and items as columns
#' @param s A vector containing number of items for each strat
#'
#' @details
#'
#' @return a list containing raw scores and corresponding CSEM using compound bimonial model
#'
#' @references
#'
#' @export
#'
#' @examples
#' data(data.m)
#' csem.compound.binomial(data.m, c(13, 12, 6))
#'
csem.compound.binomial <- function(x, s){

  # num of strats
  ns <- length(s)

  # create vector to store csem
  csemx <- c()

  # for loop to calculate prob for each true score
  for (i in 1:nrow(x)){

    # create vector to store error variance for each strat
    vk <- c()

    # error variance for strat #1
    for (k in 1:1) {
      vk[k] <- sum(x[i, 1:s[1]])*(s[1]-sum(x[i, 1:s[1]]))/(s[1]-1)
    }

    # error variance for strat #2 to #ns
    for (k in 2:ns) {
      vk[k] <- sum(x[i,(sum(s[1:k-1])+1):sum(s[1:k])])*(s[k]-sum(x[i,(sum(s[1:k-1])+1):sum(s[1:k])]))/(s[k]-1)
    }

    # csem compound binomial /CSEM Strat Feldt for each examinee
    csemx[i] <- sqrt(sum(vk))

  }

  # return raw score and Feldt strat csem
  return(list(x = rowSums(x), csem = csemx))

}
