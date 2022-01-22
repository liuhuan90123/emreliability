#' Spearman-Brown Prophecy Formula
#'
#' @description
#' Compute the new reliability when test length changes given the original test reliability,
#' or the ratio of new test length to original test length when specific reliability is desired.
#'
#' @param rxx a numeric value indicating the original reliability
#' @param input a numeric value indicating the desired reliability or a ratio of
#' new test length to original test length
#' @param type if type = "r", the new test reliability will be computed; if type = "l",
#' the function will return a ratio of the new test length to original test length
#'
#' @details
#'
#' @return the desired reliability or the desired reliability or a ratio of
#' new test length to original test length, depending on the value of argument type
#'
#' @references
#'
#' @export
#'
#' @examples
#' spearman.brown(0.8, 2.25, "r")
#' spearman.brown(0.8, 0.90, "l")
#'
spearman.brown <- function(rxx, input, type = "r"){

  # compute new test reliability with input as ratio
  # of new test length to original test length
  if (type == "r"){

    ryy <- input * rxx / (1 + (input - 1) * rxx)

    return(list(reliability = ryy))

  }

  # compute ratio of new test length to original test length
  # with input as desired test reliability
  if (type == "l"){

    lyy <- input * (1 - rxx) / (rxx * (1 - input))

    return(list(ratio = lyy))

  }
}


