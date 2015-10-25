shinyServer(function(input, output, session) {

    # vocab count from python
    mydata <- reactive({
        fileid <- (as.numeric(unlist(gsub("[^0-9]", "", input$fileid, ""))))
        read.csv(sprintf("../output/%03d.csv",fileid))
    })

    # raw text 2015
    myrawtextnew <- reactive({
        fileid <- (as.numeric(unlist(gsub("[^0-9]", "", input$fileid, ""))))
        readLines(sprintf("../parsed/chead%03d_2015.txt",fileid))
    })

    # raw text 2014
    myrawtextold <- reactive({
        fileid <- (as.numeric(unlist(gsub("[^0-9]", "", input$fileid, ""))))
        readLines(sprintf("../parsed/chead%03d_2014.txt",fileid))
    })


    # Table showing Year on Year change
    output$sorteddiff <- renderTable({
        mydata() %>%
            mutate(yearchange=X2015-X2014)%>%
            arrange(desc(yearchange))
    })

    #Search old text
    output$rawold <- renderPrint({
        if(length(input$searchtext)==0)return("Empty")
        (myrawtextold()[grep(input$searchtext,myrawtextold())])
    })

    #Search new text
    output$rawnew <- renderPrint({
        if(length(input$searchtext)==0)return("Empty")
        (myrawtextnew()[grep(input$searchtext,myrawtextnew())])
    })

    #Download button
    output$downloadData <- downloadHandler(
        filename = function() {
            fileid <- (as.numeric(unlist(gsub("[^0-9]", "", input$fileid, ""))))
            sprintf("%03d_2015.csv",fileid)
        },
        content = function(file) {
            write.csv(mydata(), file, row.names=FALSE)
        }
    )
}
            )


