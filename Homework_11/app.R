library(shiny)
library(gapminder)
library(plotly)

# Calculate the mean values for life expectancy, GDP per capita, and population
mean_lifeExp <- gapminder %>%
  group_by(continent, year) %>%
  summarise(mean_value = mean(lifeExp))

mean_gdpPercap <- gapminder %>%
  group_by(continent, year) %>%
  summarise(mean_value = mean(gdpPercap))

mean_population <- gapminder %>%
  group_by(continent, year) %>%
  summarise(mean_value = mean(pop))

# Define UI for the application that draws a plot
ui <- fluidPage(
  
  # Application title
  titlePanel("Homework_11"),
  
  # Sidebar with select inputs for continent and variable
  sidebarLayout(
    sidebarPanel(
      selectInput("continent",
                  label = "Select a continent",
                  choices = unique(gapminder$continent),
                  selected = "Africa"),
      selectInput("variable",
                  label = "Select a variable",
                  choices = c("Life expectancy at birth", "Population", "GDP per capita (in dollars)"),
                  selected = "Life expectancy at birth"),
      helpText("*Mean value")
    ),
    
    # Show a plotly plot
    mainPanel(
      plotlyOutput("gapminder")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  output$gapminder <- renderPlotly({
    # Filter data based on selected continent
    filtered_data <- switch(input$variable,
                            "Life expectancy at birth" = mean_lifeExp,
                            "Population" = mean_population,
                            "GDP per capita (in dollars)" = mean_gdpPercap) %>%
      filter(continent == input$continent)
    
    # Create the plotly plot
    plot <- plot_ly(filtered_data, x = ~year, y = ~mean_value, type = "scatter", mode = "lines") %>%
      layout(xaxis = list(title = "Year"), yaxis = list(title = input$variable))
    
    # Return the plot
    plot
  })
}

# Run the app
shinyApp(ui = ui, server = server)
