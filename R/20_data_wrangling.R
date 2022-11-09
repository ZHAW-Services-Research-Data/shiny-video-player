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


create_video_source <- function(tid, cam_id) { #, t=0) {
  trial_filename <- paste0("trial", tid, "_", cam_id, ".mp4")#t=",t)
  
  return(paste0("videos/trial", tid, "/", trial_filename))
}

get_timing_for_phase <- function(df, tid, cam_id, phase="phase0") {
  if(phase=="phase0") {
    return(0)
  }
  
  df <- df %>%
    filter(trial_number == tid)
  
  return(df[[paste0("cam1_", phase)]])
}

