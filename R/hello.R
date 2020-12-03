#' Say Hello to my little friend
#'
#' @param name Who you want to say hello to
#'
#' @return Nothing
#' @export
#'
#' @examples
#' hello("Dolly")
hello <- function(name) {
  v <- paste("Hello", name)
  print(v)
  v
}
