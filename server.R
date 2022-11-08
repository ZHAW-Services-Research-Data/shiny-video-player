# Define server logic that 
# * observes inputs
# * based on changed input, decides which data and objects are affected and need to be recalculated/updated
# * performs all calculations
# * builds and updates the output objects in a list called output

server <- function(input, output, session) {
  # THEME RELATED STUFF -----------------------------------------------------
  
  # switch between light and dark mode
  # use observe if you want to perform an action
  # the code in observe is executed immediately when the used input/reactive objects change
  observe(session$setCurrentTheme(
    if (isTRUE(input$dark_mode)) dark else light
  ))

  # PROCESS INPUTS & DEFINE REACTIVE OBJECTS --------------------------------
  
  # REACTIVE EXPRESSIONS
  # use the reactive expression when you want to calculate a value
  # and the calculation is also consuming other reactive values/expressions (e.g. input, session)
  # using reactiveVal would lead to this error:
  # Can't access reactive value 'url_search' outside of reactive consumer.
  # ref: https://mastering-shiny.org/basic-reactivity.html
  # a reactive expression is like a function, so to access its value, you need to call it like a function
  
  # PERFORMANCE CONSIDERATION
  # don't put things in one reactive expression together that can change independently
  # example: we separate reading the data from redcap from filtering it or changing it according to input
  # in that way, the expensive data access from redcap is performed only once
  # and not repeated with any changes of input elements
  
  # REACTIVE VALUES
  # reactiveVal: define one reactive value
  # reactiveValues: define a list of reactive values similar to the list-like object "input"
  
  # read parameters from the URL, code in R/10_input_functions.R:  get_id
  url_id <- reactive({
    id <- get_id(session)
    if (id == 0) {
      return(77681)
    }
  })
  
  the_id <- reactive({
   if (input$selected_Id != "")
    input$selected_Id
   else
     url_id()
  })
  
  # 
  # load dynamic datasets when a user is accessing the shiny app:
  # if csv/shiny_server is selected, read file from rs connected, otherwise use REDCap
  read_data <- reactive({
   if(input$datasource == "csv") {
     read_data_csv()
   }
    else {
      read_data_redcap()
    }
  })
    
  the_data <- reactive(
    read_data() %>% 
      add_id_to_df() %>%
      clean_columns() %>%
      reverse_items_in_df(BFI_REVERSED_ITEMS, BFI_MAX_VALUE))
  
  filtered_data <- reactive(get_data_for_id(the_data(), the_id()))
  
  filtered_standardized_data <- reactive(filtered_data() %>%
      standardize_bfi(df_bfi_scales, df_bfi_norms))
  
  
  # DEFINE THE OUTPUTS ------------------------------------------------------

  # How to define outputs
  # * the names of the elements of output need to be the same as the names specified in the ui output-elements
  # * each entry to output should contain the output of one of Shiny’s render* functions.
  # render functions: the code inside is executed each time when a user changes a widget (input) that is used inside of the render-function
  # * renderDataTable	creates DataTable
  # * renderImage	creates images (saved as a link to a source file)
  # * renderPlot	creates plots
  # * renderPrint	creates any printed output
  # * renderTable	creates data frame, matrix, other table like structures
  # * renderText	creates character strings
  # * renderUI	  creates a Shiny tag object or HTML
  
  output$dashboard_title <- renderText(paste0("Report for User ID: ", the_id(), " - Number of data points: ", length(the_data()$record_id), " - data used from: ", input$datasource))
  output$text_id_selected <- renderText(ifelse(the_id() == 0, "no user id selected, showing all ansers", ""))
  output$the_data <- renderTable(filtered_data())
  # output$plot_alldata <- renderPlot(create_overview_plot(the_data()))
  output$plot_id <- renderPlot(create_standardized_vertical_plot(filtered_standardized_data()))
}
