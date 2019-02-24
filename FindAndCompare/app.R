library(shiny)

df <- readRDS("/Users/Georgios/Documents/Projects/FindAndCompare/schoolStats.rda")

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("info",
                     "Information:",
                     min = 1,
                     max = 100,
                     value = 70)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        tableOutput('schools')
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   output$schools <- renderTable(df)
}

# Run the application 
shinyApp(ui = ui, server = server)

