# parallelplot_id <- function(df, the_id) {
#   other_text <- ifelse(the_id == 0, "all", "the others")
#    df %>%
#     select(id, happiness, activity) %>%
#     pivot_longer(!id, names_to = "variable") %>%
#     mutate(Legend = factor(ifelse(id == the_id, "you", other_text))) %>%
#     #mutate(is_id = factor(ifelse(id == the_id), "YOU", "others")) %>%
#     ggplot(aes(x=variable, y=value, colour=Legend, group=factor(id))) +
#     geom_path(position = "identity") +
#     geom_point()
# }
# 
# 
# create_overview_plot <- function(df) {
#   df %>%
#     select(happiness, activity) %>%
#     pivot_longer(everything(), names_to = "variable") %>%
#     ggplot(aes(x=variable, y=value)) + 
#     geom_boxplot()
# }


  

create_standardized_vertical_plot <- function(standardized_scales){
  g <- ggplot(data=standardized_scales) + 
    geom_path(aes(y=20:1, x=value))+
    geom_point(aes(x=value, y=scale), stat = "identity")+ 
    scale_y_discrete(limits=rev, name="Facets")+
    annotate("rect", xmin=-1,xmax=1, ymin=0, ymax=21, alpha=0.3, fill="grey80") 
  
  return(g)
}