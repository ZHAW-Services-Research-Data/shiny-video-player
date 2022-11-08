# Define UI for application that draws a histogram
ui <- fluidPage(
  theme = light,
  fluidRow(
    column(3,
           img(src = "zhaw_cmyk.jpg", height = 100, width = 100)
    ),
    column(3,
           checkboxInput("dark_mode", "Dark mode"),
    )
  ),
  
  # Application title
  titlePanel("Just Another Shiny Template - Demo"),
  
  # Sidebar: put Input Elements here
  sidebarLayout(
    sidebarPanel( 
      helpText(
        "Note: to use the REDCap dataset",
        "you must provide redcap_url and redcap_api_token",
        "as environment variables."
      ),
      radioButtons(
        inputId = "datasource",
        label = h5("Choose Dataset"),
        choices = list(
          "Use stored dataset" = "csv",
          "Get happiness data from REDCap" = "redcap"
        ),
        selected = "csv"
      ),
      textInput(
        inputId = "selected_Id",
        label = h5("Provide Key of record"),
        placeholder = "key"
      )
      
    ),
    
    # Panel to show all your outputs inside
    # Each of the *Output functions require a single argument: 
    # a character string that Shiny will use as the name of your reactive element. 
    # Your users will not see this name.
    # It is the name that connects output element in the UI and the
    # object that you want to display and that is calculated in the server.R
    # Possible outputs are:
    # dataTableOutput: DataTable
    # htmlOutput:	raw HTML
    # imageOutput:	image
    # plotOutput:	plot
    # tableOutpu:t	table
    # textOutput:	text
    # uiOutput:	raw HTML
    # verbatimTextOutput:	text
    mainPanel(
      tabsetPanel(
        tabPanel("Dashboard",
                 textOutput("dashboard_title"),
                 br(),
                 h3("Data Table"),
                 tableOutput("the_data"),
                 # br(),
                 # h3("Overview Plot"),
                 # plotOutput("plot_alldata"),
                 br(),
                 h3("Compare yourself to others"),
                 textOutput("text_id_selected"),
                 plotOutput("plot_id")
        ),
        tabPanel("All input widgets",
                 # demonstration of all available standard widgets
                 # demonstration here: https://shiny.rstudio.com/gallery/widget-gallery.html
                 
                 h2("All available standard widgets"),
                 
                 fluidRow(
                   column(
                     3,
                     h4("Buttons"),
                     actionButton("action", "Action"),
                     br(),
                     br(),
                     #submitButton(text = "Submit") # currently, switch to dark mode does not work when submitButton present
                   ),
                   
                   column(
                     3,
                     h4("Single checkbox"),
                     checkboxInput("checkbox", "Choice A", value = TRUE)
                   ),
                   
                   column(
                     3,
                     checkboxGroupInput(
                       "checkGroup",
                       h4("Checkbox group"),
                       choices = list(
                         "Choice 1" = 1,
                         "Choice 2" = 2,
                         "Choice 3" = 3
                       ),
                       selected = 1
                     )
                   ),
                   
                   column(3,
                          dateInput("date",
                                    h4("Date input"),
                                    value = "2014-01-01"))
                 ),
                 
                 fluidRow(
                   column(3,
                          dateRangeInput("dates", h4("Date range"))),
                   
                   column(3,
                          fileInput("file", h4("File input"))),
                   
                   column(
                     3,
                     h4("Help text"),
                     helpText(
                       "Note: help text isn't a true widget,",
                       "but it provides an easy way to add text to",
                       "accompany other widgets."
                     )
                   ),
                   
                   column(3,
                          numericInput("num",
                                       h4("Numeric input"),
                                       value = 1))
                 ),
                 
                 fluidRow(
                   column(3,
                          radioButtons(
                            "radio",
                            h4("Radio buttons"),
                            choices = list(
                              "Choice 1" = 1,
                              "Choice 2" = 2,
                              "Choice 3" = 3
                            ),
                            selected = 1
                          )),
                   
                   column(3,
                          selectInput(
                            "select",
                            h4("Select box"),
                            choices = list(
                              "Choice 1" = 1,
                              "Choice 2" = 2,
                              "Choice 3" = 3
                            ),
                            selected = 1
                          )),
                   
                   column(
                     3,
                     sliderInput(
                       "slider1",
                       h4("Sliders"),
                       min = 0,
                       max = 100,
                       value = 50
                     ),
                     sliderInput(
                       "slider2",
                       "",
                       min = 0,
                       max = 100,
                       value = c(25, 75)
                     )
                   ),
                   
                   column(3,
                          textInput("text", h4("Text input"),
                                    value = "Enter text..."))
                 )
        )
      )
    )
    
  )
)