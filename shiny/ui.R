library(shiny)
shinyUI(pageWithSidebar(
  headerPanel('HK Budget 2015'),
  sidebarPanel(
      selectInput('fileid', 'Select file', listoffiles),
      textInput("searchtext", label = h3("Search input"), value = "Enter search text...")
  ),
  mainPanel(
      #plotOutput('plot1'),
      p("Keyword Search result - 2014"),
      verbatimTextOutput("rawold"),
      p("Keyword Search result - 2015"),
      verbatimTextOutput("rawnew"),
      p("Year 2015 - Year 2014 Changes"),
      tableOutput("sorteddiff"),
      downloadButton('downloadData', 'Download Data')
  )
))

