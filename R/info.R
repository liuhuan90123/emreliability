#' @title Information for IRT model
#'
#' @description
#' A function to calculate information for IRT model
#'
#' @param theta Ability vector
#' @param ip a dataframe or matrix with item parameters of sequence b, a, and c,
#'           a is on the 1.702 metric
#' @param est estimation method, MLE or EAP
#'
#' @return a data frame containing info
#'
#' @export

info <- function(theta, ip, est){

  if (ncol(ip) == 3){
    names(ip) <- c("b", "a", "c")
  }
  if (ncol(ip) == 2){
    names(ip) <- c("b", "a")
    ip$c <- 0
  }
  if (ncol(ip) == 1){
    names(ip) <- c("b")
    ip$a <- 1
    ip$c <- 0
  }

  # replicate item parameter and theta
  ipRep <-ip[rep(seq_len(nrow(ip)), each = length(theta)),]
  ipRep$theta <- rep(theta, each = 1, length.out = length(theta)*nrow(ip))

  # calculate information by theta 3PL
  ipRep <- within(ipRep, {
    P = c + (1 - c) / (1 + exp(-1.702 * a * (theta - b)))
    Q = 1 - P
    PQ = P * Q
    info = 1.702**2 * a**2 * (Q/P) * (P-c)^2 / (1-c)^2
  })

  # sum information by theta
  ipInfo <- aggregate(ipRep$info, by=list(Category=ipRep$theta), FUN=sum)
  names(ipInfo) <- c("theta", "infoMLE")

  # calculate info for EAP
  ipInfo$infoEAP <- ipInfo$infoMLE + 1 # cobtributed by population

  # return info for each theta
  if (est == "MLE"){
    return(list("theta" = ipInfo$theta, "infoMLE" = ipInfo$infoMLE))
  }else if (est == "EAP"){
    return(list("theta" = ipInfo$theta, "infoEAP" = ipInfo$infoEAP))
  }else{
    warning("Info function only supports MLE and EAP estimation method!")
  }
}
