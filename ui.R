##############################################All Global################################################################################################

dalbergHeader <- dashboardHeader(title =  tags$img(src = "logo.png", 
                                                   height = "50px", alt="Dalberg Research"), uiOutput("logoutbtn"))

##############################################Side Bar Code
dalbergSiderbar <- dashboardSidebar(tags$head(
  tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
  tags$script(src = "custom.js")),
  uiOutput("sidebarpanel"),
  tags$script(JS("document.getElementsByClassName('sidebar-toggle')[0].style.visibility = 'hidden';"))
  )

#########################################Body Code
dalbergBody <- dashboardBody(
  tags$script(HTML('
                   $(document).ready(function() {
                   $("header").find("nav").append(\'<h1>Project Monitoring Platform</h1>\');
                   })
                   ')),
  
  
  tags$head(tags$style(HTML('
                            /* logo */
                            .skin-blue .main-header .logo {
                            background-color: #DDDDDD;
                            border-bottom: thin ridge #A9A9A9;
                            border-right: thin outset #565656;
                            position: fixed;
                            }
                            
                            h1{
                            text-align: center;
                            font-size: 250%;
                            font-face:bold;
                            font-family: "Lato";
                            color:#881946;
                            }
                            
                            h2{
                            text-align: center;
                            font-face:bold;
                            font-family: "Lato";
                            color: #00a7cc;
                            font-size: 200%;
                            }
                            
                            p{
                            text-align: justfied;
                            font-family: "Lato";
                            color: black;
                            font-size: 150%;
                            margin-left: 20px;
                            }
                            
                            h3{
                            text-align: center;
                            font-size: 200%;
                            font-face:bold;
                            font-family: "Lato";
                            color:#00a7cc;
                            }
                            
                            /* logo Hover */
                            .skin-blue .main-header .logo:hover{
                            background-color: #DDDDDD;
                            }
                            
                       
                            /* navbar (rest of the header) */
                            .skin-blue .main-header .navbar {
                            background-color:white;
                            font-family: "Lato";
                                                }
                            
                     
                            /* main sidebar */
                            .skin-blue .main-sidebar {
                            background-color: #DDDDDD;
                            border-right: thin outset #565656;
                            font-family: "Lato";
                            color:black;
                            font-size:150%;
                            }
                            
                            
                            
                            .sidebar{
                             height: 90vh;
                             overflow-y: auto;
                             position: fixed;
                          
                            }
                        
                            /* active selected tab in the sidebarmenu */
                            .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
                            background-color:white;
                            }
                            
                            /* other links in the sidebarmenu */
                            .skin-blue .main-sidebar .sidebar .sidebar-menu a{
                            color: black;
                            }
                            
                            /* other links in the sidebarmenu when hovered */
                            .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{
                            background-color: white;
                            }
                     
                            /* body */
                            .content-wrapper, .right-side {
                            background-color: white;
                            font-family: "Lato";
                            
                            }
                            
                            '))),
  
  
  
  tags$style(HTML('
                  .dataTables_wrapper .dataTables_info .dataTables_processing {
                  color: #ffffff;
                  font-family: "Lato";
                  }
                  
                  thead {
                  color: #ffffff;
                  font-size:1.2em;
                  background-color:black;
                  font-family: "Lato";
                  }
                  
                  tbody {
                  color: #000000;
                  font-size:1.2em;
                  font-family: "Lato";
                  }
                  
                  '
                  
                  
  )),useShinyjs(), uiOutput("body"))
#################################################################################################################################
##############User Interface
dashboardPage(dalbergHeader, dalbergSiderbar, dalbergBody, title = "Dalberg Research Field Activities Updates")