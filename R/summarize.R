#' @title Reduces multiple values down to a single value
#' @description Mimics dplyr::summarize using base R and rlang
#' @param .data data.frame
#' @param ... Name-value pairs of summary functions
#' @return data.frame
#' @examples
#' airquality%>%
#'   bplyr::b_group_by(Month)%>%
#'   bplyr::b_summarize(m = mean(Temp),m1 = max(Temp))
#'
#' airquality%>%
#'   bplyr::b_group_by(Month,Day)%>%
#'   bplyr::b_summarize(m = mean(Temp),m1 = max(Temp))
#'
#' airquality%>%
#'   bplyr::b_mutate(Month = factor(Month))%>%
#'   bplyr::b_group_by(Month)%>%
#'   bplyr::b_summarize(m = mean(Temp),m1 = max(Temp))
#' @seealso
#'  \code{\link[rlang]{quotation}}
#' @rdname b_summarize
#' @export
#' @author Jonathan Sidi
#' @importFrom rlang quos quo_squash
b_summarize <- function(.data,...){
  UseMethod("b_summarize")
}

#' @rdname b_summarize
#' @export
b_summarize.default <- function(.data,...){

  FNS <- lapply(rlang::quos(...),rlang::quo_squash)

  EVALS <- lapply(FNS,function(x){
    with(.data,eval(x))
  })

  data.frame(EVALS,stringsAsFactors = FALSE)

}

#' @rdname b_summarize
#' @export
b_summarize.split_df <- function(.data,...){

  bindr(split(.data), b_summarize, .data, ...)

}
