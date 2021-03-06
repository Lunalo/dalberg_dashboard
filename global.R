###############################
#Load  Required Libraries
library(stringr);library(shiny);library(shinydashboard);library(shinycssloaders)
library(tidyr);library(dplyr);library(zoo);library(lubridate);library(DT)
library(ggplot2);library(readxl);library(htmltools);library(leaflet);library(shinyhttr)
library(raster);library(xml2);library(shinyjs);library(sodium);library(maptools)
library(haven);library(shinymanager);library(labelled);library(rgdal);library(kableExtra)
library(sf);library(reshape2);library(knitr);library(tinytex);library(haven);library(rmarkdown);library(plotly);
library(flexdashboard);library(c3)


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
<br><br><br><h2>Human Account</h2><br><p>Nearly three billion people are underserved by
the financial sector globally, many lack access to a robust set of high quality services
essential for financial health. How can we better account for their needs, aspirations,
and financial strategies to create more compelling services that improve their financial health?</p>
<br>
<p>Financial service providers, mobile money and network operators in emerging markets have
a historic opportunity to acquire and serve almost billions of un- or underserved customers
in Africa and Asia with innovative, low-cost, digital products and services that improve those customers’ lives.</P>
<br>
<p>With behavioral and psychometric data on 34 segments representing 1.98 billion people across 6 countries, 
The Human Account is a breakthrough, public resource with the potential to significantly shift how
financial service providers understand, invest in, design for, and engage the underserved.</p><br><br><br><br><br><br>"



KeySurveyQuestionsIntro <- "<h2>Introduction</h2><br><p>This section displays
the key performance indicators (the key questions in the survey). These are 
the questions that captures the major survey outcomes and covariates. 
The questions are split by demographics of interest. For this survey 
the key questions</p>"



