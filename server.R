function(input, output, session){
  
  i_prog <- 1
  tot_step <- 25
  
  login = FALSE
  USER <- reactiveValues(login = login)

 observe({ 
    if (USER$login == FALSE) {
      if (!is.null(input$login)) {
        if (input$login > 0) {
          Username <- isolate(input$userName)
          Password <- isolate(input$passwd)
          if(length(which( login_credentials$username_id == Username)) == 1) { 
            pasmatch  <- login_credentials["password_text"][which( login_credentials$username_id == Username),]
            pasverify <- password_verify(pasmatch, Password)
            if(pasverify) {
              USER$login <- TRUE
            } else {
              toggle(id = "nomatch", anim = TRUE, time = 1, animType = "fade")
              delay(3000,toggle(id = "nomatch", anim = TRUE, time = 1, animType = "fade"))
            }
          } else {
            toggle(id = "nomatch", anim = TRUE, time = 1, animType = "fade")
            delay(3000, toggle(id = "nomatch", anim = TRUE, time = 1, animType = "fade"))
          }
        } 
      }
    }    
  })
  
  

  output$logoutbtn <- renderUI({
    req(USER$login)
    tags$li(a(icon("fa fa-sign-out"), "Logout", 
              href="javascript:window.location.reload(true)"),
            class = "fa fa-sign-out", 
            style = "background-color: #881946 !important;font-weight:bold;font-family:Lato;margin:5px;padding:15px;color:#FFFFF;")
         
  })

  #################################################################################################
  
  
  output$sidebarpanel <- renderUI({
    if (USER$login == TRUE ){ 
      sidebarMenu(
       menuItem(text = "About the Project", tabName = "About",selected=TRUE),
       menuItem(tabName = "SurveyProgress", text = "Survey Progress"),
       menuItem(tabName = "KeySurveyQuestions", text = "Key Survey Questions"),
       menuItem(tabName = "DataQualityControl", text = "Data Quality Control"),
       menuItem(tabName = "Dataset", text = "Dataset"),
       menuItem(tabName = "Questionnaire", text = "Questionnaire"),
       menuItem(tabName = "Methodology", text = "Methodology")
       
                 
        )
        

  
    }
  })

  output$body <- renderUI({
    if (USER$login == TRUE ) {
      if (login_credentials[,"permission"][which(login_credentials$username_id==input$userName)]=="advanced"){
        
      }
      
      tabItems(tabItem(tabName = "About", class = "active",box(HTML(paste0("<br><br>

<p id ='timer2'></p>
                          
                          <script>
                          // Set the date we're counting down to
                          var countDownDate = new Date('Dec 31, 2022 24:00:00').getTime(); //Only change this
                          
                          // Update the count down every 1 second
                          var x = setInterval(function() {
                          
                          // Get today's date and time
                          var now = new Date().getTime();
                          
                          // Find the distance between now and the count down date
                          var distance = countDownDate - now;
                          
                          // Time calculations for days, hours, minutes and seconds
                          var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                          var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                          var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                          var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                          
                          // Display the result in the element with id='timer2'
                          document.getElementById('timer2').innerHTML = 'Countdown:   ' + days + '   Days   ' + hours + '  Hours   '
                          + minutes + '  Minutes   ' + seconds + '  Seconds  !!!';
                          
                          // If the count down is finished, write some text
                          if (distance < 0) {
                          clearInterval(x);
                          document.getElementById('timer2').innerHTML = 'Project Endeded';
                          }
                          }, 1000);
                          </script>
                          <br><br> </script><style> #timer2{padding-left: 50px;text-align: right; background-color:white;font-family: Lato;font-weight:bold; font-size: 17px; color: #00a7cc;}</style>", about_project)), downloadButton("aboutdoc", "Download Detailed Description", 
                                                                                                  icon = icon("download",lib = "font-awesome"), class = "button"), class = "homepage", height = "100%", width = "100%"), tags$style(
        ".homepage {background-color:white;font-size:20px;font-weight:bold
        width: 100%; min-height: 100vh;text-align:center;color:black;}")),
      
      tabItem(tabName = "ActivitiesUpdates",
                       
                               fluidRow(infoBoxOutput("value1", width = 3) %>% withSpinner(color = "#871946"),
                                        infoBoxOutput("value2", width = 3) %>% withSpinner(color = "#871946"),
                                        infoBoxOutput("value3", width = 3) %>% withSpinner(color = "#871946"),
                                        infoBoxOutput("value4", width = 3) 
                               ),
                               
                              fluidRow(box(downloadButton("field", "Generate report for field updates", 
                              icon = icon("download",lib = "font-awesome"), class = "button"), 
                              tags$head(tags$style(".button{background-color:#881946 !important;color: white !important;}")) 
                              ))
                       
                             
                                
                         ),
               tabItem(tabName = "SurveyProgress",
                       fluidRow(HTML("<h2>Daily and Cumulative Updates of Data Collection</h2><br><br><p>This section provides both the daily and cumulative updates of data collection.
                        The updates entail the trends,targets vs achievements, map updates, quotas and more. The trainds entail both cumulative and daily. Cumulative provides cumulative updates for data
                                     collection to date. Daily trends provides insights of data collected for each day. Both trends are also dissagregated by useful categories such as gender of respondents
                                     and urban rural. Achievement provides breakdown based on demographic variables.Maps provides insights on specific areas the data was collected and quotas provides the updates on targets, achieved and deficits</p><br>"),width = "80%"),
                       fluidRow(HTML("<h2>Trends of Data Collection</h2>")),
                       fluidRow(plotOutput("cump1"), height=450, width = "80%"),
                       
                       fluidRow(plotOutput("cump2"), height=450, width = "80%"),
                       fluidRow(plotOutput("cump3"), height=450, width = "80%"),
                       div( id = 'message_to_show_more',
                            tags$hr(),
                            tags$h3( "Click on the 'Show more details' button to display additional information on survey progress." ),
                            actionButton("btn_show_more",
                                         paste0(' Show more details'),
                                         icon = icon('chevron-circle-down'),
                                         style='padding-top:3px; padding-bottom:3px;padding-left:5px;padding-right:5px;font-size:120%;color:#881946;'
                            ) 
                       ),
                       
                       div( id = "show_more_detail" ) ,
                       
                       shinyjs::hidden( div( id = "load_more_message",
                                             tags$hr(),
                                             tags$h1("Loading...", align = "center")  )
                       )
                       
                    
                       
        
  ),
                 
             
      tabItem(tabName = "KeySurveyQuestions",
             
              fluidRow(HTML(KeySurveyQuestionsIntro)),
              fluidRow(column = 6, box(plotOutput("plot2",height = 310), height=330),column = 6, box(plotOutput("plot21",height = 310),height=330)),
              fluidRow(box(plotOutput("plot1", height = 400),height=450, width = "100%")),
              
              fluidRow(box(plotOutput("plot22"), height=450, width = "100%")),
             
              fluidRow(box(plotOutput("plot3"), height = 450, width = "80%")),

              div( id = 'message_to_show_more1',
                   tags$hr(),
                   tags$h3( "Click on the 'Show more details' button to display additional details on Key Questions." ),
                   actionButton("btn_show_more1",
                                paste0(' Show more details'),
                                icon = icon('chevron-circle-down'),
                                style='padding-top:3px; padding-bottom:3px;padding-left:5px;padding-right:5px;font-size:120%;color:#881946;'
                   ) 
              ),
              
              div( id = "show_more_detail1" ) ,
              
              shinyjs::hidden( div( id = "load_more_message1",
                                    tags$hr(),
                                    tags$h1("Loading...", align = "center")  )
              )
                   
                       
      ),
  
  tabItem(tabName = "DataQualityControl",
          
          fluidRow(box(HTML(Introduction), width = "100%"))
          ),
  
  
      
      tabItem(tabName = "Dataset",
                       
                         fluidRow(box(downloadButton("download_data", "Download data set", class="button"), width = 800)),
                         fluidRow(box(title = h1("Dataset"),DT::dataTableOutput("datatab") %>% withSpinner(color = "#871946"),height = 800, width=100))),
               
               
               ###############GIS
      
      tabItem(tabName = "Questionnaire",
              fluidRow(box(title = h1("Data Collection Tool"),uiOutput("tooldoc"),
              height = 900, width = "100%"))),
      
      tabItem(tabName = "Methodology",
              fluidRow(box(title = h1("Methodology"),uiOutput("metdoc"),
              height = 900, width = "100%")))
      )
               
      
    } else{
      loginpage
    }})
  
  
  draw_value1 <- function(){
     formatC(nrow(dat),format = "f", digits = 0, big.mark = ",")
  }
  
  
  output$value1<- renderInfoBox({
    infoBox(
      "Respondents",draw_value1() , icon = icon("users", lib = "font-awesome"),
      fill = TRUE,color = "blue", width = 3
    )
  })
  
  
  draw_value2 <- function(){
    # phone <- table(dat$C5_10)
    smartPhones <- 2000
    formatC(smartPhones,format = "f", digits = 0, big.mark = ",")
  }
  
  output$value2<- renderInfoBox({
    infoBox(
      "Error Logs Sent",draw_value2(), icon = icon("times", lib = "font-awesome"),
      fill = TRUE,color = "blue",width = 3
    )
  })
  
  
  
  draw_value3 <- function(){
    bank <- 1021
    formatC(bank,format = "f", digits = 0, big.mark = ",")
  }
  
  output$value3<- renderInfoBox({
    infoBox(
      "Corrected error logs", draw_value3(), icon = icon("check-circle", lib = "font-awesome"),
      fill = TRUE,color = "blue", width = 3
    )
  })
  

  draw_value4 <- function(){
    bank <- 30
    formatC(bank,format = "f", digits = 0, big.mark = ",")
   }
  
  output$value4<- renderInfoBox({
    infoBox(
      "Callbacks",draw_value4() , icon = icon("phone", lib = "font-awesome"),
      fill = TRUE,color = "blue",width = 3
    )
  })
  
  ###################End of Infoboxes
  
  
  
  output$plot1 <- renderPlot({
    plot1()
  })
  
  plot1 <- function(){
    draw_plot1
  }
  output$plot21 <- renderPlot({
    plot21()
  })
  
  plot21 <- function(){
    draw_plot21
  }
  
  output$plot22 <- renderPlot({
    plot22()
  })
  
  plot22 <- function(){
    draw_plot22
  }
  
  output$plot2 <- renderPlot({
    plot2()
  })
  
  plot2 <- function(){
    draw_plot2
  }
  
  
  
  observeEvent(input$btn_show_more1,
               {
                 
                 ## disable the buttone ---
                 shinyjs::disable("btn_show_more1")
                 ## --- hide message to show more -----
                 shinyjs::hide(id = 'message_to_show_more1')
                 ## --- show loading message ---
                 shinyjs::show( id = "load_more_message1" )
                 
                 # 4. Treemap key export commodity and services ------------------------------------
                 withProgress(message = 'Loading...', value = (i_prog-1)/tot_step, {
                   # Increment the progress bar, and update the detail text.
                   incProgress( i_prog/tot_step, detail = NULL)
                   ##Sys.sleep(0.1)
                   
                 })
                 i_prog <- i_prog + 1
                 
                 
                 output$plot8 <- renderPlot({
                   plot8()
                 })
                 
                 plot8 <- function(){
                   draw_plot8
                 }
                 
                 output$plot8a <- renderPlot({
                   plot8a()
                 })
                 
                 plot8a <- function(){
                   draw_plot8a
                 }
                 
                 
                 output$plot9 <- renderPlot({
                   plot9()
                 })
                 
                 plot9 <- function(){
                   draw_plot9
                 }
                 
                 output$plot9a <- renderPlot({
                   plot9a()
                 })
                 
                 plot9a <- function(){
                   draw_plot9a
                 }
                 
                 output$plot6_6 <- renderPlot({
                   plot6_6()
                 })
                 
                 plot6_6 <- function(){
                   draw_plot6_6
                 }
                 
                 output$plot6_6a <- renderPlot({
                   plot6_6a()
                 })
                 
                 plot6_6a <- function(){
                   draw_plot6_6a
                 }
                 
                 output$plotC84 <- renderPlot({
                   plotC84()
                 })
                 
                 plotC84 <- function(){
                   draw_plotC84
                 }
                 
                 output$plotC84_B2 <- renderPlot({
                   plotC84_B2()
                 })
                 
                 plotC84_B2 <- function(){
                   draw_plot_C84_B2
                 }
                 
                 
                 
                 insertUI(
                   selector = '#show_more_detail1',
                   ui = div( id = 'conents_for_more_detail1',
                             
                             fluidRow(plotOutput("plot8")%>% withSpinner(color = "#871946"), height=600, width = "100%"),
                             fluidRow(plotOutput("plot8a")%>% withSpinner(color = "#871946"), height=600, width = "100%"),
                             fluidRow(plotOutput("plot9")%>% withSpinner(color = "#871946"), height=600, width = "100%"),
                             fluidRow(plotOutput("plot9a")%>% withSpinner(color = "#871946"), height=600, width = "100%"),
                             fluidRow(plotOutput("plot6_6")%>% withSpinner(color = "#871946"), height=600, width = "100%"),
                             fluidRow(plotOutput("plot6_6a")%>% withSpinner(color = "#871946"), height=600, width = "100%"),
                             fluidRow(plotOutput("plotC84")%>% withSpinner(color = "#871946"), height=600, width = "100%"),
                             fluidRow(plotOutput("plotC84_B2")%>% withSpinner(color = "#871946"), height=600, width = "100%")
                             
                             
                   ))
                 shinyjs::hide( id = "load_more_message1" )
                 
              
 } )
  
  
  
  output$plot23 <- renderPlot({
    plot23()
  })
  
  plot23 <- function(){
    draw_plot23
  }
  
  output$plot24 <- renderPlot({
    plot24()
  })
  
  plot24 <- function(){
    draw_plot24
  }
  
  output$plot3 <- renderPlot({
    plot3()
  })
  
  plot3 <- function(){
    draw_plot3
  }
  
  output$plot4 <- renderPlot({
    plot4()
  })
  
  plot4 <- function(){
    draw_plot4
  }
  
  output$plot5 <- renderPlot({
    plot5()
  })
  
  plot5 <- function(){
    draw_plot5
  }
  
  output$plot6 <- renderPlot({
    plot6()
  })
  
  plot6 <- function(){
    draw_plot6
  }
  
  output$plot6_3 <- renderPlot({
    plot6_3()
  })
  
  plot6_3 <- function(){
    draw_plot6_3
  }
  
  output$plot6_4 <- renderPlot({
    plot6_4()
  })
  
  plot6_4 <- function(){
    draw_plot6_4
  }
  

  
  
  output$plot6_2 <- renderPlot({
    plot6_2()
  })
  
  plot6_2 <- function(){
    draw_plot6_2
  }
  
  output$plot6_5 <- renderPlot({
    plot6_5()
  })
  
  plot6_5 <- function(){
    draw_plot6_5
  }
  
  
  
  
  output$plot6_1  <-renderPlot({
    plot6_1()
  })
  
  plot6_1 <- function(){
    draw_plot6_1
  }
  
    output$plot6_12  <-renderPlot({
    plot6_12()
  })
  
    plot6_12 <- function(){
      draw_plot6_12
    }
    
  
    
    cump1 <- function(){
      cumplot_Overall
    } 
    
    output$cump1  <-renderPlot({
      cump1()
    })
    
    output$cump2  <-renderPlot({
      cump2()
    })
    
    cump2 <- function(){
      cum_EA
    }
    
    output$cump3  <-renderPlot({
      cump3()
    })
    
    cump3 <- function(){
      cum_Gender
    }
    
    
  #removeUI( selector = '#main_wait_message' )
  
  observeEvent(input$btn_show_more,
                {
                  
                  ## disable the buttone ---
                  shinyjs::disable("btn_show_more")
                  ## --- hide message to show more -----
                  shinyjs::hide(id = 'message_to_show_more')
                  ## --- show loading message ---
                  shinyjs::show( id = "load_more_message" )
                  
                  # 4. Treemap key export commodity and services ------------------------------------
                  withProgress(message = 'Loading...', value = (i_prog-1)/tot_step, {
                    # Increment the progress bar, and update the detail text.
                    incProgress( i_prog/tot_step, detail = NULL)
                    ##Sys.sleep(0.1)
                    
                  })
                  i_prog <- i_prog + 1
    
  #Trends

  output$trendp1  <-renderPlot({
    trendp1()
  })
  
  trendp1 <- function(){
    trend_Overall
  }

  

  
  output$trendp2  <-renderPlot({
    trendp2()
  })
  
  trendp2 <- function(){
    trend_EA
  }
  
  output$trendp3  <-renderPlot({
    trendp3()
  })
  
  trendp3 <- function(){
    trend_gender
  }
  
  
  
  achieved_plot1<- function(){
    draw_achieved_plot1
  }
  
  output$achieved_plot1 <- renderPlot({
    achieved_plot1()
  })
  
  achieved_plot2<- function(){
    draw_achieved_plot2
  }
  
  output$achieved_plot2 <- renderPlot({
    achieved_plot2()
  })
  
  achieved_plot<- function(){
    draw_achieved_plot
  }
  
  output$achieved_plot <- renderPlot({
    achieved_plot()
  })
  
  
  respondent_tab_func <- function(){
    respondent_tab
  }
  
  enum_tab_func <- function(){
    enum_tab
  }

  

  
  
  output$datatab_resp1 = DT::renderDataTable({
    datatable(enum_tab_func(),extensions = c("Scroller"), 
              options = list(
                searching = TRUE,
                autoWidth = FALSE,
                rownames = FALSE,
                scrollX = TRUE,
                paging =TRUE,
                fixedHeader = TRUE,
                class = 'cell-border stripe'))
  })
  
  
  output$datatab_resp = DT::renderDataTable({
    datatable(respondent_tab_func(),extensions = c("Scroller"), 
              options = list(
                searching = TRUE,
                autoWidth = FALSE,
                rownames = FALSE,
                scroller = FALSE,
                scrollX = TRUE,
                paging =TRUE,
                pageLength=6,
                fixedHeader = TRUE,
                class = 'cell-border stripe'),
              selection = "multiple",
              filter="top")
  })
  
  
  tbl1 <- function(){
    respondent_tab_func()
  }
  
  tbl2 <- function(){
    enum_tab_func
  }
  
  
  helper_gis <- function(){
    gis_df <- gis_df %>%dplyr::filter(!is.na(Longitude)&!is.na(Latitude))
    gis_df<- gis_df %>% dplyr::filter(County == input$countyNames)
    gis_df
    
  }
  
  
  
  
  gis_filtered_data_graph1  <- reactive({
    helper_gis()
  })
  
  
  data_gis_full <- function(){
    gis_df<-gis_df%>%filter((!is.na(Longitude))&!is.na(Latitude))
  }
  
  
  
  output$mapleaflet <- renderLeaflet({
    icon.fa = makeIcon("pushpinround.png", iconWidth = 60, iconHeight = 48)
    
    gis_df<- data_gis_full()
    leaflet(kenya1,height=300, width=200) %>% 
      addTiles(group = "OSM",options = providerTileOptions(opacity = 1)) %>%
      addProviderTiles("CartoDB.Positron", group = "CartoDB.Positron") %>%
      addProviderTiles("Esri.WorldImagery", group = "Esri World") %>%
      addScaleBar(position = "bottomright") %>%
      addPolygons(color="black", fillColor = "black",fillOpacity= 0 ,weight = 1) %>%
      addMarkers(gis_df,lng = gis_df$Longitude, lat = gis_df$Latitude, icon= icon.fa,
                 popup = gis_df$marker_label, options=popupOptions(closeButton=FALSE)) %>% 
      addLayersControl(baseGroups= c("OSM","Esri World", "CartoDB.Positron")
                       
      )%>% fitBounds(min(min(gis_df$Longitude)), min(max(gis_df$Latitude)),
                     max(max(gis_df$Longitude)), max(min(gis_df$Latitude)))
    
    
  })
  
  
  
  insertUI(
    selector = '#show_more_detail',
    ui = div( id = 'conents_for_more_detail',
              
              fluidRow(plotOutput("trendp1")%>% withSpinner(color = "#871946"), height=450, width = "80%"),
              fluidRow(plotOutput("trendp2")%>% withSpinner(color = "#871946"), height=450, width = "80%"),
              fluidRow(plotOutput("trendp3")%>% withSpinner(color = "#871946"), height=450, width = "80%"),
              
              fluidRow(HTML("<h2>Number of Respondents against Targets</h2>")),
              
              fluidRow(plotOutput("achieved_plot")%>% withSpinner(color = "#871946"), height=450, width = "80%"),
              
              fluidRow(HTML("<h2>Data Collection Achievements</h2>")),
              #fluidRow(downloadButton("download_datatab_resp", "Download", class="button"), width = 800),
              fluidRow(title = h1(strong("Data Breakdown by Location")),DT::dataTableOutput("datatab_resp") %>%
                         withSpinner(color = "#871946"),height = 800, width=100),
              
              #fluidRow(downloadButton("download_datatab_resp1", "Download", class="button"), width = 800),
              fluidRow(title = h1(strong("Enumerators Achivement")),DT::dataTableOutput("datatab_resp1") %>% 
                         withSpinner(color = "#871946"),height = 800, width=100),
              
              fluidRow(HTML("<h2>Data Collection Geolocations</h2>")),
              fluidRow(title = h1(strong("Activity Map")),
                       leafletOutput("mapleaflet", height = "550px") %>% 
                         withSpinner(color = "#871946")),
              fluidRow(HTML("<h2>Number of Respondents against Targets in Rural or Urban Areas </h2>")),
              
              fluidRow(plotOutput("achieved_plot1",height = 700), height=700, width = "80%"),
              fluidRow(HTML("<h2>Number of Respondents against Targets by their Gender </h2>")),
              fluidRow(plotOutput("achieved_plot2",height = 700), height=700, width = "80%")
              
              
    ))
  shinyjs::hide( id = "load_more_message" )
  

  })
  
  
  
  

  #######KPS
  
  output$plot7 <- renderPlot({
    plot7()
  })
  
  plot7 <- function(){
    draw_smartphones_ownership
  }
 
  
  
  output$plot10 <- renderPlot({
    plot10()
  })
  
  plot10 <- function(){
    draw_plot10
  }
  
  output$plot11 <- renderPlot({
    plot11()
  })
  
  plot11 <- function(){
    draw_plot11
  }
  
  output$plot12 <- renderPlot({
    plot12()
  })
  
  plot12 <- function(){
    draw_plot12
  }
  
  output$plot13 <- renderPlot({
    plot13()
  })
  
  plot13 <- function(){
    draw_plot13
  }
  
  output$plot14 <- renderPlot({
    plot14()
  })
  
  plot14 <- function(){
    draw_plot14
  }
  
  output$plot15 <- renderPlot({
    plot15()
  })
  
  plot15 <- function(){
    draw_plot15
  }
  
  
  
 
  output$selected_var <- renderText({
    paste("You have selected", input$countyNames, "County")
  })

  
  # Download data ----
  output$download_data <- downloadHandler(
    filename = function() {
      paste("USAI downloade_dat_", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      withProgress(
        message = "Downloading Data",
        value = 0,
        {
          incProgress(1/40)
          Sys.sleep(1)
          incProgress(5/40) 
      write.csv(dplyr::select(dat,-c(var_drop)), file, row.names = F)})
    }
  )
  
  output$download_datatab_resp <- downloadHandler(
    filename = function() {
      paste("THA_", "Locational_Breakdown", "_data", "_", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      withProgress(
        message = "Downloading Data",
        value = 0,
        {
          incProgress(1/40)
          Sys.sleep(1)
          incProgress(5/40) 
      write.csv(respondent_tab_func(), file, row.names = F)})
    }
  )
  
  output$download_datatab_resp1 <- downloadHandler(
    filename = function() {
      paste("THA_", "Enumerator_Performance", "_data", "_", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      withProgress(
        message = "Downloading Data",
        value = 0,
        {
          incProgress(1/40)
          Sys.sleep(1)
          incProgress(5/40) 
      write.csv(enum_tab_func(), file, row.names = F)})
    }
  )

  
  output$tooldoc <- renderUI({
    
    tags$iframe(style="height:800px; width:100%;scrolling=yes", src="Questionnaire.pdf")
  })
  
  output$metdoc <- renderUI({
    
    tags$iframe(style="height:800px; width:100%;scrolling=yes", src="Research_Methodology.pdf")
  })
  
  
  
  
  output$datatab = DT::renderDataTable({
    datatable(dplyr::select(dat,-c(var_drop)),extensions = c("Scroller"), 
              options = list(
                searching = TRUE,
                autoWidth = FALSE,
                rownames = FALSE,
                scroller = TRUE,
                scrollX = TRUE,
                paging =TRUE,
                pageLength=6,
                scrollY = "600px",
                fixedHeader = TRUE,
                class = 'cell-border stripe'),
              selection = "multiple",
              filter="top")
  })
  
  
  #Downlaoding project Details
  output$aboutdoc <- downloadHandler(
    filename = "Project_Details.pdf",
    content = function(file) {
      withProgress(
        message = "Downloading Project Description",
        value = 0,
        {
          incProgress(1/40)
          Sys.sleep(1)
          incProgress(5/40)  
      file.copy("www/Project_Details.pdf", file)})
    }
  )

  ##############################################################################
  output$field <- downloadHandler(
    filename = function() {
      paste("Field_updates_report", "_", Sys.Date(), ".pdf", sep = "")
    },
    content = function(file) {
       res <- render(
        "Field_updates.Rmd",
          params = list(
          printcode = FALSE,
          plot1=  plot1,
          plot21= plot21,
          plot22= plot22,
          plot2=  plot2,
          plot23= plot23,
          plot24= plot24,
          plot3= plot3,
          plot5= plot5,
          plot6= plot6,
          plot6_3= plot6_3,
          plot6_4= plot6_4,
          plot6_6= plot6_6,
          plot6_2= plot6_2,
          plot6_5= plot6_5,
          plot6_1= plot6_1,
          plot6_12= plot6_12,
          cump1 = cump1,
          cump2 = cump2,
          cump3 = cump3,
          trendp1 = trendp1,
          trendp2 = trendp2,
          trendp3 = trendp3
                   )
      )
      file.rename(res, file)
    }
  )

  ##############################################################################
  output$report <- downloadHandler(
    filename = function() {
      paste("report_KPI", Sys.Date(), ".pdf", sep = "")
    },
    content = function(file) {
         res <- render(
        "report.Rmd",
          params = list(
          printcode = FALSE,
          plot7 = plot7,
          plot8 = plot8,
          plot9 = plot9,
          plot10 = plot10,
          plot11 = plot11,
          plot12 = plot12,
          plot13 = plot13,
          plot14 = plot14,
          plot15 = plot15
        )
      )
      file.rename(res, file)
    }
  )
  
  
  
  
  
  
 
}