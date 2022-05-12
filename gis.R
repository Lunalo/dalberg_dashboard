#######Prepare GIS Data for Mapping
gis_df <- dat%>%dplyr::select(Latitude, Longitude, Q_6, Q_7, Q_8, Q_9, Q_10)

names(gis_df)<-c("Latitude", "Longitude", "County", "Subcounty", "Consituency", "Ward", "Village")

gis_df$County <- str_trim(str_to_title(gis_df$County));gis_df$Village <- str_to_title(gis_df$Village)
gis_df$Subcounty <- str_to_title(gis_df$Subcounty);gis_df$Ward <- str_to_title(gis_df$Ward)
gis_df$Consituency <- str_trim(str_to_title(gis_df$Consituency))

county_list <- as.list(as.character(unique(gis_df$County)))

gis_df$marker_label <-  paste0("<style>
                              .labpop {
                                background-color: #881946;
                                border-color: #881946;
                                color: white;
                                padding: 10px;
                                margin: 0;
                                }
                              </style><p class='labpop'>","<br>", "<strong>", 
                               "Location Details", "</strong>", "</b>","<br/>", "<br>",
                               names(gis_df)[3],": ", gis_df$County, "<br/>", 
                               names(gis_df)[4],": ", gis_df$Subcounty,"<br/>",
                               names(gis_df)[5],": ", gis_df$Consituency,"<br/>",
                               names(gis_df)[6],": ", gis_df$Ward,"<br/>",
                               names(gis_df)[7],": ", gis_df$Village, "</p>")

