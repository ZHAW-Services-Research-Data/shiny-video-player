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
      return("trial1001")
    }
  })
  
  
  addResourcePath(prefix = "videos", directoryPath = "videos")
  tids <- unique(df_videos$trial_number)
  
  updateSelectizeInput(session, 'tid', choices = tids, server = TRUE)
  
  selected_tid <- reactive({
    if (input$tid != "")
      input$tid
    else
      url_id()
  })
  
  
  name_video1 <- reactive(create_video_source(selected_tid(), "cam3"))
  observe({changeVideo("video1", files=name_video1(), format = VIDEO_FORMAT)})
  
  name_video2 <- reactive(create_video_source(selected_tid(), "cam2")) 
  observe({changeVideo("video2", files=name_video2(), format = VIDEO_FORMAT)})
  
  name_video3 <- reactive(create_video_source(selected_tid(), "cam3")) 
  observe({changeVideo("video3", files=name_video3(), format = VIDEO_FORMAT)})
  
  output$video_list <- renderTable(df_videos)
  
  # ***************** VIDEO 1 **************************
  output$t1 <- renderText(name_video1())
  
  observeEvent(input$cam1_phase0,
               seek_and_play("video1", 0, input$autoplay))
  
  observeEvent(input$cam1_phase1, 
               seek_and_play("video1",
                             get_timing_for_phase(df_videos, selected_tid(), "cam1", "phase1"),
                             input$autoplay))
  observeEvent(input$cam1_phase2, 
               seek_and_play("video1",
                             get_timing_for_phase(df_videos, selected_tid(), "cam1", "phase2"),
                             input$autoplay))
  observeEvent(input$cam1_phase3, 
               seek_and_play("video1",
                             get_timing_for_phase(df_videos, selected_tid(), "cam1", "phase3"),
                             input$autoplay))
  observeEvent(input$cam1_phase4, 
               seek_and_play("video1",
                             get_timing_for_phase(df_videos, selected_tid(), "cam1", "phase4"),
                             input$autoplay))
  observeEvent(input$cam1_phase5, 
               seek_and_play("video1",
                             get_timing_for_phase(df_videos, selected_tid(), "cam1", "phase5"),
                             input$autoplay))
  
  # ***************** VIDEO 3 **************************
  output$t2 <- renderText(name_video2())
  
  observeEvent(input$cam2_phase0,
               seek_and_play("video2", 0, input$autoplay))
  
  observeEvent(input$cam2_phase1, 
               seek_and_play("video2",
                             get_timing_for_phase(df_videos, selected_tid(), "cam2", "phase1"),
                             input$autoplay))
  observeEvent(input$cam2_phase2, 
               seek_and_play("video2",
                             get_timing_for_phase(df_videos, selected_tid(), "cam2", "phase2"),
                             input$autoplay))
  observeEvent(input$cam2_phase3, 
               seek_and_play("video2",
                             get_timing_for_phase(df_videos, selected_tid(), "cam2", "phase3"),
                             input$autoplay))
  observeEvent(input$cam2_phase4, 
               seek_and_play("video2",
                             get_timing_for_phase(df_videos, selected_tid(), "cam2", "phase4"),
                             input$autoplay))
  observeEvent(input$cam2_phase5, 
               seek_and_play("video2",
                             get_timing_for_phase(df_videos, selected_tid(), "cam2", "phase5"),
                             input$autoplay))
  
 
  # ***************** VIDEO 3 **************************
  output$t3 <- renderText(name_video3())
  
  observeEvent(input$cam3_phase0,
               seek_and_play("video3", 0, input$autoplay))
  
  observeEvent(input$cam3_phase1, 
               seek_and_play("video3",
                             get_timing_for_phase(df_videos, selected_tid(), "cam3", "phase1"),
                             input$autoplay))
  observeEvent(input$cam3_phase2, 
               seek_and_play("video3",
                             get_timing_for_phase(df_videos, selected_tid(), "cam3", "phase2"),
                             input$autoplay))
  observeEvent(input$cam3_phase3, 
               seek_and_play("video3",
                             get_timing_for_phase(df_videos, selected_tid(), "cam3", "phase3"),
                             input$autoplay))
  observeEvent(input$cam3_phase4, 
               seek_and_play("video3",
                             get_timing_for_phase(df_videos, selected_tid(), "cam3", "phase4"),
                             input$autoplay))
  observeEvent(input$cam3_phase5, 
               seek_and_play("video3",
                             get_timing_for_phase(df_videos, selected_tid(), "cam3", "phase5"),
                             input$autoplay))
}