###############################
#Load  Required Libraries
library(stringr);library(shiny);library(shinydashboard);library(shinycssloaders)
library(tidyr);library(dplyr);library(zoo);library(lubridate);library(DT)
library(ggplot2);library(readxl);library(htmltools);library(leaflet);library(shinyhttr)
library(raster);library(xml2);library(shinyjs);library(sodium);library(maptools)
library(haven);library(shinymanager);library(labelled);library(rgdal);library(kableExtra)
library(sf);library(reshape2);library(knitr);library(tinytex);library(haven);library(rmarkdown);library(plotly)


#The Order Matters
source("dataimport.R");source("plots.R");source("gis.R")
source("DataQualityChecks.R")

#########################Lo-gin Page
loginpage <- div(id = "loginpage", style = "width: 500px; max-width: 100%; margin: 0 auto; padding: 20px;position: absolute;top: 50%;left: 60%;
    transform: translateX(-50%) translateY(-50%);",
                 wellPanel(
                   tags$h2("LOG IN", class = "text-center", style = "padding-top: 0;color:#333; font-weight:600;"),
                   textInput("userName", placeholder="Username", label = tagList(icon("user"), "Username")),
                   passwordInput("passwd", placeholder="Password", label = tagList(icon("unlock-alt"), "Password")),
                   br(),
                   div(
                     style = "text-align: center;",
                     actionButton("login", "SUBMIT", style = "color: white; background-color:#881946;
                                  padding: 10px 15px; width: 150px; cursor: pointer;
                                  font-size: 18px; font-weight: 600;"),
                     hidden(
                       div(id = "nomatch",
                           tags$p("You have entered wrong username or Password!",
                                  style = "color: red; font-weight: 600; 
                                  padding-top: 5px;font-size:16px;", 
                                  class = "text-center")))
                     
                   ))
)


readRenviron("cred.env")

#Only edit these two lines while  adding users
username_id <- c(Sys.getenv("USERNAMEONE"), Sys.getenv("USERNAMETWO"), Sys.getenv("USERNAMETHREE"), Sys.getenv("USERNAMEFOUR"))
password_text <- sapply(c(Sys.getenv("PASSWORDONE"), Sys.getenv("PASSWORDTWO"), Sys.getenv("PASSWORDTHREE"), Sys.getenv("PASSWORDFOUR")),password_store)

permission <- rep("advanced", length(password_text))

login_credentials = data.frame(
  username_id = username_id,
  password_text = password_text,
  permission  = permission, 
  stringsAsFactors = F
)


icont<-1


about_project <- "
<h2>About the Project</h2><br><br><br><br><p>Dalberg Research provides research and analysis that offers clients 
actionable solutions to their problems. We are a full-service research agency answering
questions about markets, consumers and lifestyles across more than 20 African countries
via quantitative and qualitative studies. We specialize in the inventory, collection, and
analysis of primary research data for businesses, NGOs, governments and other institutions.
Dalberg Research has 21 years of experience in primary research and has a strong commitment 
to obtaining the information required to fuel sustainable and inclusive growth across Africa.
Dalberg Research has also developed LOCAN, Kenya's most comprehensive geo-spatial research database
with more than 30 million data points from more than 150 sources. Results from LOCAN are used to generate
unprecedented insights.</p><br><br>"



KeySurveyQuestionsIntro <- "<h2>Introduction</h2><br><p>The section captures details on Key performance Indicators, outcomes and objectives of the survey. We start of by assessing the outcome
variables. We use various approaches to display insights. The approaches include bar, line, pie, tables, cards and more. Similar approach
 is applied for to the outcomes and objectives of the survey</p>"



