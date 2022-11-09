# Define UI for application that draws a histogram
ui <- fluidPage(
  theme = light,
  fluidRow(
    column(3,
           img(src = "zhaw_cmyk.jpg", height = 100, width = 100)
    ),
    column(3,
           br(),
           materialSwitch(
             inputId = "dark_mode",
             label = "Dark mode",
             value = FALSE,
             status = "primary"
           ),
           # alternative to materialSwitch
           # checkboxInput("dark_mode", "Dark mode"),
    )
  ),
  
  # Application title
  titlePanel("Video player"),
  
  # Sidebar: put Input Elements here
  sidebarLayout(
    sidebarPanel( 
      selectizeInput("tid", "Trial Id", choices=NULL),
      materialSwitch(
        inputId = "autoplay",
        label = "Autoplay", 
        value = TRUE,
        status = "primary"
      ),
      # alternative to materialSwitch
      # checkboxInput("autoplay", "Autoplay", value = TRUE),
      width = 2, #sidebarPanel width: 2 out of 12 columns
    ),
    
    # Video panel
    mainPanel(
      tabsetPanel(
        tabPanel("Player",
                 fluidRow(
                   tags$h2("Camera 1"),
                   column(WIDTH_PANEL_COLUMN,
                          inputPanel(
                            actionButton("cam1_phase0", NAME_PHASE0, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam1_phase1", NAME_PHASE1, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam1_phase2", NAME_PHASE2, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam1_phase3", NAME_PHASE3, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam1_phase4", NAME_PHASE4, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam1_phase5", NAME_PHASE5, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                          ),
                   ),
                   column(WIDTH_VIDEO_COLUMN,
                          textOutput("t1"),
                          video(elementId = "video1", 
                                files=c(DEFAULT_VIDEO1),
                                format = c(VIDEO_FORMAT),
                                width=WIDTH_VIDEO,
                          ),
                   ),
                 ),
                 fluidRow(
                   tags$h2("Camera 2"),
                   column(WIDTH_PANEL_COLUMN,
                          inputPanel(
                            actionButton("cam2_phase0", NAME_PHASE0, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam2_phase1", NAME_PHASE1, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam2_phase2", NAME_PHASE2, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam2_phase3", NAME_PHASE3, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam2_phase4", NAME_PHASE4, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam2_phase5", NAME_PHASE5, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                          ),
                   ),
                   column(WIDTH_VIDEO_COLUMN,
                          textOutput("t2"),
                          video(elementId = "video2", 
                                files=c(DEFAULT_VIDEO2),
                                format = c(VIDEO_FORMAT),
                                width=WIDTH_VIDEO,
                          ),
                   ),
                 ),
                 fluidRow(
                   tags$h2("Camera 3"),
                   column(WIDTH_PANEL_COLUMN,
                          inputPanel(
                            actionButton("cam3_phase0", NAME_PHASE0, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam3_phase1", NAME_PHASE1, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam3_phase2", NAME_PHASE2, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam3_phase3", NAME_PHASE3, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam3_phase4", NAME_PHASE4, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                            br(),
                            actionButton("cam3_phase5", NAME_PHASE5, width=ACTION_BUTTON_WIDTH, class=ACTION_BUTTON_CLASS),
                          ),
                   ),
                   column(WIDTH_VIDEO_COLUMN,
                          textOutput("t3"),
                          video(elementId = "video3", 
                                files=c(DEFAULT_VIDEO3),
                                format = c(VIDEO_FORMAT),
                                width=WIDTH_VIDEO,
                          ),
                   )
                 ) # last row
        ),
        tabPanel("Table",
                 fluidRow(
                   h2("Video Timestamp List"),
                 ),
                 fluidRow(
                   tableOutput("video_list"),
                 ),
        )
      )
    )
  )
)