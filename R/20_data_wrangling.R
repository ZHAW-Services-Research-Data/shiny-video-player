# put here functions that transform your data

# examples are

#' add_id_to_df
#'
#' @param df dataframe with columns key and record_id
#'
#' @return dataframe with additional id column
#' @export
#'
#' @examples
add_id_to_df <- function(df) {
  df <- df %>%
    mutate(id = create_id(key, record_id))
  return(df)
}

#' clean_columns
#' transform numeric columns to integer columns
#'
#' @param df dataframe
#'
#' @return dataframe with all numeric columns converted to integer columns
#' @export
#'
#' @examples
clean_columns <- function(df) {
  df <- df %>%
    mutate_if(is.numeric, as.integer)
  return(df)
}

#' get_data_for_id
#' filter for a specific id
#'
#' @param df dataframe with id column
#' @param the_id the id to filter for
#'
#' @return
#' @export
#'
#' @examples
get_data_for_id <- function(df, the_id) {
  if (the_id == 0)
    return(df)
  
  df <- df %>% 
    filter(id == the_id)
  return(df)
}

reverse_items_in_df <- function(df, reversed_items, max_value){
  # x <- matrix(ncol = length(reversed_items), nrow= 1)
  # colnames(x) <- reversed_items
  # df_bfi <- cbind(df_bfi, x)
  # for (i in 1:length(reversed_items)){
  #   df_bfi[,reversed_items[i]] <- max_value- df_bfi[,original_to_reverse[i]]
  # }
  
  # tidyverse version
  df_res <- df %>%
    mutate_at(reversed_items, reverse_item, max_value)
  
  return(df_res)
}

standardize_bfi <- function(df_bfi, df_bfi_scales, df_bfi_norms) {
  # scale values - z-transformation
  # [klav] ideally, this should be done with dplyr
  x <- matrix(ncol = dim(df_bfi_scales)[1], nrow= dim(df_bfi)[1])
  colnames(x) <- df_bfi_scales$Scale
  df_bfi <- cbind(df_bfi, x)
  for (i in 1:dim(df_bfi_scales)[1]){
    my_command <- paste0("df_bfi$", df_bfi_scales[i,"Scale"], " <- apply(select(df_bfi,", df_bfi_scales[i,"Item"], "),1,mean, na.rm=TRUE)")
    eval(parse(text=my_command)) # is there a way to do this without eval??
  }
  names_scale <- df_bfi_norms[["Scale"]]
  
  vector_scales <- df_bfi[,names_scale]
  standardized_scales <- (vector_scales - df_bfi_norms$M_All)/df_bfi_norms$SD_All
  standardized_scales <- data.frame(scale = df_bfi_norms$EN, value = unlist(standardized_scales))
  standardized_scales$scale <- factor(standardized_scales$scale, levels = df_bfi_norms$EN)
  
  return(standardized_scales)
}