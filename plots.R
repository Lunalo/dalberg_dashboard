

# preparing data for box plots
boxdat <- data.frame(
  "Count" =seq(1:30),
  "Household_Members"= dat$Household_Members,
  "Members_Earning" = dat$A2,
  "Members_Aged_18_plus" = dat$A3,
  "School_going_children"= dat$A4)


################## Gender and EA Type Chart
q_11_and_B2 <- dat %>% group_by(Q_11, B2) %>% summarise(Number = n())
q_11_and_B2_group <- q_11_and_B2 %>% group_by(Q_11) %>% mutate(Proportions =round(Number/sum(Number)*100, 0))

q_11_and_B2_py<- q_11_and_B2_group%>%
  arrange(desc(B2)) %>%
  mutate(lab.ypos = cumsum(Proportions) - 0.3*Proportions)

draw_plot1 <- ggplot(q_11_and_B2_py, aes(x = 2, y = Proportions, fill = B2 )) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar(theta = "y", start = 0)+geom_text(aes(y = lab.ypos, 
                                                    label = paste0(Number, " \n(",round(Proportions), "%)")), color = "white", size=6)+
  theme_classic()+ylab("")+xlab("")+ggtitle("Respondents by Gender and Urban Rural")+
  theme(axis.line = element_line(colour = "white"),plot.title = element_text(hjust=0.5,size = 20),axis.text = element_blank(), axis.ticks = element_blank(),
        legend.title=element_text(size=18),legend.text = element_text(size = 16),legend.position = "bottom",
        panel.spacing =unit(24, "lines"),strip.text= element_text(size = 18, colour = "black"),
        panel.border = element_rect(color = "white", fill = NA, size = .1),
        strip.background = element_rect(color = "white", size = 1))+
  scale_fill_manual(values=c("#00A7CC","#F3B11C"))+labs(fill = "Gender:")+
  xlim(.9, 2.5)+facet_wrap(.~Q_11, labeller = label_wrap_gen())

#############################Gender Chart

B2_group <- dat %>% group_by(B2) %>% summarise(Number = n())%>%
  mutate(Proportions =round(Number/sum(Number)*100, 0))

B2_py<- B2_group%>%
  arrange(desc(B2)) %>%
  mutate(lab.ypos = cumsum(Proportions) - 0.3*Proportions)

draw_plot2 <- ggplot(B2_py, aes(x = 2, y = Proportions, fill = B2 )) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar(theta = "y", start = 0)+geom_text(aes(y = lab.ypos, 
                                                    label = paste0(Number, " (",round(Proportions), "%)")), color = "white", size=6)+
  theme_void()+ylab("")+xlab("")+ggtitle("Gender of the Respondents")+
  theme(axis.line = element_line(colour = "white"),plot.title = element_text(hjust=0.5,size = 20),axis.text = element_blank(), axis.ticks = element_blank(),
        legend.title=element_text(size=18),legend.text = element_text(size = 14),legend.position = "bottom")+
  scale_fill_manual(values=c("#00A7CC","#F3B11C"))+labs(fill = "Gender:")


##################Type of Locale EA Type Chart

Q11_group <- dat %>% group_by(Q_11) %>% summarise(Number = n()) %>%
  mutate(Proportions =round(Number/sum(Number)*100, 0))

Q11_py<- Q11_group%>%
  arrange(desc(Q_11)) %>%
  mutate(lab.ypos = cumsum(Proportions) - 0.3*Proportions)

draw_plot21 <- ggplot(Q11_py, aes(x = 2, y = Proportions, fill = Q_11 )) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar(theta = "y", start = 0)+geom_text(aes(y = lab.ypos, 
                                                    label = paste0(Number, " (",round(Proportions), "%)")), color = "white", size=6)+
  theme_void()+ylab("")+xlab("")+ggtitle("Respondents by Urban Rural")+
  theme(plot.title = element_text(hjust=0.5,size = 20),axis.text = element_blank(), axis.ticks = element_blank(),
        legend.title=element_text(size=18),legend.text = element_text(size = 16),legend.position = "bottom")+
  scale_fill_manual(values=c("#00A7CC","#F3B11C"))+labs(fill = "Urban Rural:")

###################Age Group
B1_data <- dat %>% group_by(B1) %>% summarise(Number = n())
B1_data_plot<- B1_data%>%group_by(B1)%>%mutate(proportions =round(100*(Number/sum(B1_data$Number)),1))

ymax_b1 <- max(B1_data_plot$Number)
draw_plot22 <- ggplot(B1_data_plot, aes(y = Number, x = B1,fill = B1)) + geom_bar(stat = "identity", fill = "#00A7CC") + 
  theme_classic() + coord_flip() +scale_y_continuous(limits = c(0,ymax_b1+round(.1*ymax_b1,0)))+theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
                                        plot.title = element_text(hjust = 0.5,size = 20),
                                        axis.text.y = element_text(size = 16, colour = "black"), 
                                        legend.position = "none") + xlab("") + ylab("")+ggtitle("Respondents by Age") + geom_text(aes(y= Number, label = paste0(Number, " \n(",proportions, "%)")),
                                                                                                                                  size=6,hjust = 0)

###################Age Group and EA Type


B1_data <- dat %>%filter(Q_11=="Urban")%>% group_by(B1) %>% summarise(Number = n())
B1_data_plot<- B1_data%>%group_by(B1)%>%mutate(proportions =round(100*(Number/sum(B1_data$Number)),2))


draw_plot23 <- ggplot(B1_data_plot, aes(y = Number, x = B1,fill = B1)) + geom_bar(stat = "identity", fill = "#00A7CC") + 
  theme_classic() + coord_flip() +theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
                                        plot.title = element_text(hjust = 0.5,size = 20),
                                        axis.text.y = element_text(size = 16, colour = "black"), 
                                        legend.position = "none") + xlab("") + ylab("")+ggtitle("Respodents Age Breakdown in Urban Areas") + geom_text(aes(y= Number, 
                                                                                                                                                           label = paste0(Number, " \n(",proportions, "%)")),size=6,hjust = .4)


B1_data1 <- dat %>%filter(Q_11!="Urban")%>% group_by(B1) %>% summarise(Number = n())
B1_data_plot<- B1_data1%>%group_by(B1)%>%mutate(proportions =round(100*(Number/sum(B1_data$Number)),2))

draw_plot24 <- ggplot(B1_data_plot, aes(y = Number, x = B1,fill = B1)) + geom_bar(stat = "identity", fill = "#00A7CC") + 
  theme_classic() + coord_flip() +theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
                                        plot.title = element_text(hjust = 0.5,size = 20),
                                        axis.text.y = element_text(size = 16, colour = "black"), 
                                        legend.position = "none") + xlab("") + ylab("")+ggtitle("Respodents Age Breakdown in Rural Areas") + geom_text(aes(y= Number, 
                                                                                                                                                           label = paste0(Number, " \n(",proportions, "%)")),size=6,hjust = .4)


#Pyramid of Age and Gender of Respondents
pyramid_data1 <- dat%>%dplyr::group_by(B1,B2)%>%summarise(Population=n())%>%group_by(B1)%>%mutate(Perc =paste0(round(100*Population/sum(Population)),"%"))

pyramid_data1$Population <- ifelse(pyramid_data1$B2=="Male", pyramid_data1$Population*-1,
                                   pyramid_data1$Population)


draw_plot3 <- ggplot(data = pyramid_data1, aes(x= B1, y = Population, fill= B2))+geom_bar(stat = "identity", width = .95)+
  coord_flip()+theme_classic()+ylab("")+xlab("")+ggtitle("Respondents Destribution by their Age and Gender")+annotate("text", x = 7, y=min(pyramid_data1$Population)+5, 
                                                 label = "Male", size=10, color="#00A7CC")+annotate("text", x = 7, y=max(pyramid_data1$Population)-5, 
                                                                                                    label = "Female", color="#F3B11C", size=10)+theme(legend.position = "None", axis.text = element_text(colour = "black",size = 16),axis.title = element_text(size = 20, colour = "black"))+
  scale_fill_manual(values = c("#00A7CC","#F3B11C"))+geom_text(aes(y= Population,label=Perc),size=6,hjust = .4)


B3_data <- dat%>% group_by(B3) %>% summarise(Number = n())
B3_data_plot<- B3_data%>%group_by(B3)%>%mutate(proportions =round(100*(Number/sum(B3_data$Number)),2))


draw_plot4 <- ggplot(B3_data_plot, aes(y = Number, x = reorder(B3, Number))) + geom_bar(stat = "identity", fill = "#00A7CC") + 
  theme_classic() + coord_flip() +theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
                                        plot.title = element_text(hjust = 0.5,size = 20),
                                        axis.text.y = element_text(size = 16, colour = "black"), 
                                        legend.position = "none") + xlab("") + ylab("")+ggtitle("Respodents Breakdown by Marrital Status") + geom_text(aes(y= Number, 
                                                                                                                                                           label = paste0(Number, " \n(",proportions, "%)")),size=6,hjust = .4)


B4_data <- dat%>% group_by(B4) %>% summarise(Number = n())
B4_data_plot<- B4_data%>%group_by(B4)%>%mutate(proportions =round(100*(Number/sum(B4_data$Number)),2))

draw_plot5 <- ggplot(B4_data_plot, aes(y = Number, x = reorder(B4, Number))) + geom_bar(stat = "identity", fill = "#F3B11C") + 
  theme_classic() + coord_flip() +theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
                                        plot.title = element_text(hjust = 0.5,size = 20),
                                        axis.text.y = element_text(size = 16, colour = "black"), 
                                        legend.position = "none") + xlab("") + ylab("")+ggtitle("Respodents Breakdown by Relationship with House Head") + geom_text(aes(y= Number, 
                                                                                                                                                                        label = paste0(Number, " \n(",proportions, "%)")),size=6,hjust = .4)



B5_data <- dat%>% group_by(B5) %>% summarise(Number = n())
B5_data_plot<- B5_data%>%group_by(B5)%>%mutate(proportions =round(100*(Number/sum(B5_data$Number)),2))

draw_plot6 <- ggplot(B5_data_plot, aes(y = Number, x = B5)) + geom_bar(stat = "identity", fill = "#881946") + 
  theme_classic() + coord_flip() +theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
                                        plot.title = element_text(hjust = 0.5,size = 20),
                                        axis.text.y = element_text(size = 16, colour = "black"), 
                                        legend.position = "none") + xlab("") + ylab("")+ggtitle("Respodents Breakdown by Highest Eduction Level") + geom_text(aes(y= Number, 
                                                                                                                                                                  label = paste0(Number, " \n(",proportions, "%)")),size=6,hjust = .4)


C4_1_data <- dat%>% group_by(C4_1) %>% summarise(Number = n())
C4_1_data_plot<- C4_1_data%>%group_by(C4_1)%>%mutate(proportions =round(100*(Number/sum(C4_1_data$Number)),2))

draw_plot6_3 <- ggplot(C4_1_data_plot, aes(y = Number, x = reorder(C4_1, Number))) + geom_bar(stat = "identity", fill = "#00558A") + 
  theme_classic() + coord_flip() +theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
                                        plot.title = element_text(hjust = 0.5,size = 20),
                                        axis.text.y = element_text(size = 16, colour = "black"), 
                                        legend.position = "none") + xlab("") + ylab("")+ggtitle("Respodents Breakdown by Their Electricity Sources") + geom_text(aes(y= Number, 
                                                                                                                                                                     label = paste0(Number, " \n(",proportions, "%)")),size=6,hjust = .4)


C4_2_data <- dat%>% group_by(C4_2) %>% summarise(Number = n())
C4_2_data_plot<- C4_2_data%>%group_by(C4_2)%>%mutate(proportions =round(100*(Number/sum(C4_2_data$Number)),2))

draw_plot6_4 <- ggplot(C4_2_data_plot, aes(y = Number, x = reorder(C4_2, Number))) + geom_bar(stat = "identity", fill = "#00A7CC") + 
  theme_classic() + coord_flip() +theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
                                        plot.title = element_text(hjust = 0.5,size = 20),
                                        axis.text.y = element_text(size = 16, colour = "black"), 
                                        legend.position = "none") + xlab("") + ylab("")+ggtitle("Respodents Breakdown by Their Water Sources") + geom_text(aes(y= Number, 
                                                                                                                                                               label = paste0(Number, " \n(",proportions, "%)")),size=6,hjust = .4)







C10_2_O1_data <- dat%>% group_by(C10_2_O1) %>% summarise(Number = n())
C10_2_O1_data_plot<- C10_2_O1_data%>%group_by(C10_2_O1)%>%mutate(proportions =round(100*(Number/sum(C10_2_O1_data$Number)),2))

draw_plot6_5 <- ggplot(C10_2_O1_data_plot, aes(y = Number, x = reorder(C10_2_O1, Number))) + geom_bar(stat = "identity", fill = "#F3B11C") + 
  theme_classic() + coord_flip() +theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
                                        plot.title = element_text(hjust = 0.5,size = 20),
                                        axis.text.y = element_text(size = 16, colour = "black"), 
                                        legend.position = "none") + xlab("") + ylab("")+ggtitle("Respodents Breakdown by Their Primary Income Sources") + geom_text(aes(y= Number, 
                                                                                                                                                                        label = paste0(Number, " \n(",proportions, "%)")),size=6,hjust = .4)




C13_data <- dat%>% group_by(C13) %>% summarise(Number = n())
C13_data_plot<- C13_data%>%group_by(C13)%>%mutate(proportions =round(100*(Number/sum(C13_data$Number)),2))

draw_plot6_6 <- ggplot(C13_data_plot, aes(y = Number, x = reorder(C13, Number))) + geom_bar(stat = "identity", fill = "#881946") + 
  theme_classic() + coord_flip() +theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
                                        plot.title = element_text(hjust = 0.5,size = 20),
                                        axis.text.y = element_text(size = 16, colour = "black"), 
                                        legend.position = "none") + xlab("") + ylab("")+ggtitle("Respodents Breakdown by Their Saving Behaviour") + geom_text(aes(y= Number, 
                                                                                                                                                                  label = paste0(Number, " \n(",proportions, "%)")),size=6,hjust = .4)


C8_1_data <- dat%>% group_by(C8_1) %>% summarise(Number = n())
C8_1_data_plot<- C8_1_data%>%group_by(C8_1)%>%mutate(proportions =round(100*(Number/sum(C8_1_data$Number)),2))

draw_plot6_2 <- ggplot(C8_1_data_plot, aes(y = Number, x = reorder(C8_1, Number))) + geom_bar(stat = "identity", fill = "#00A7CC") + 
  theme_classic() + coord_flip() +theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
                                        plot.title = element_text(hjust = 0.5,size = 20),
                                        axis.text.y = element_text(size = 16, colour = "black"), 
                                        legend.position = "none") + xlab("") + ylab("")+ggtitle("Respodents Breakdown by Their Preferred Interview Language") + geom_text(aes(y= Number, 
                                                                                                                                                                              label = paste0(Number, " \n(",proportions, "%)")),size=6,hjust = .4)

# Transforming data into panel using "melt":
boxdata <- melt(
  boxdat,
  id.vars ="Count",
  variable.name = "Continuous",
  value.name = "Ozone"
)

boxdata$Continuous <- str_to_title(str_trim(str_replace_all(boxdata$Continuous, pattern = "_", " ")))


draw_plot6_1 <- ggplot(data = boxdata, aes(Continuous, Ozone))+geom_boxplot(fill="#F3B11C")+stat_boxplot(geom ='errorbar')+
  theme_classic() + coord_flip() +theme(axis.text.x = element_text(size = 16, colour = "black"), axis.ticks = element_blank(),
                                        plot.title = element_text(hjust = 0.5,size = 20),
                                        axis.text.y = element_text(size = 16, colour = "black"), 
                                        legend.position = "none") + xlab("") + ylab("")


draw_plot6_12 <- ggplot(data = boxdata, aes(Continuous, Ozone, fill = Continuous))+geom_violin()+
  theme_classic()+coord_flip()+theme(axis.text.x  = element_text(size = 16, colour = "black"), axis.ticks = element_blank(),
                                     plot.title = element_text(hjust = 0.5,size = 20),
                                     axis.text.y = element_text(size = 16, colour = "black"), 
                                     legend.position = "none") + xlab("") + ylab("")



###########Tabular Presentation
respondent_tab <- dat%>%group_by(Q_6, Q_7, Q_8, Q_9)%>%summarise(n=n())
names(respondent_tab) <- c("County", "Subcounty", "Consitituency", "Ward", "Number")
enum_tab <- dat%>%group_by(Q_6, Q_7, Q_8, Q_9, Q_5)%>%summarise(n=n())
names(enum_tab) <- c("County", "Subcounty", "Consitituency", "Ward", "Enumerator", "Number")


#################Trends
dat$Q_2 <-as_date(dat$Q_2)


trend_gender <- dat %>%group_by(Q_2, B2)%>%summarise(n=n())%>%filter(year(Q_2)!=2015)%>%
  ggplot(aes(x=Q_2, y=n,color=B2)) +
  geom_path(size=1.4) +
  geom_point(size=4) +
  ggtitle("") +
  theme_light() +
  ylab("Number of Submissions")+
  theme(panel.border = element_blank(), 
        axis.line = element_line(colour = "grey"),
        axis.text.x  = element_text(size = 16, colour = "black"), axis.ticks = element_blank(),
        plot.title = element_text(hjust = 0.5,size = 20),
        axis.text.y = element_text(size = 16, colour = "black"), legend.position = "top",legend.title = element_text(size = 18, colour = "black"), legend.text =element_text(size = 20, colour = "black"))+xlab("")+ylab("")+
  geom_text(aes(y = n+2, 
                label = n), color = "black", size=4, fontface="bold")+
  scale_color_manual(values=c("#00A7CC","#F3B11C"))+labs(colour = "Gender of the Respondents:")


trend_EA <- dat %>%group_by(Q_2, Q_11)%>%summarise(n=n())%>%filter(year(Q_2)!=2015)%>%
  ggplot(aes(x=Q_2, y=n,color=Q_11)) +
  geom_path(size=1.4) +
  geom_point(size=4) +
  ggtitle("") +
  theme_light() +
  ylab("Number of Submissions")+
  theme(panel.border = element_blank(), 
        axis.line = element_line(colour = "grey"),
    axis.text.x  = element_text(size = 16, colour = "black"), axis.ticks = element_blank(),
        plot.title = element_text(hjust = 0.5,size = 20),
        axis.text.y = element_text(size = 16, colour = "black"),legend.position = "top",legend.title = element_text(size = 18, colour = "black"), legend.text =element_text(size = 20, colour = "black"))+xlab("")+ylab("")+
  geom_text(aes(y = n+2, 
                label = n), color = "black", size=4, fontface="bold")+
  scale_color_manual(values=c("#00A7CC","#F3B11C"))+labs(colour = "Urban Rural:")


trend_Overall <- dat %>%group_by(Q_2)%>%summarise(n=n())%>%filter(year(Q_2)!=2015)%>%
  ggplot(aes(x=Q_2, y=n)) + geom_area(fill="#00A7CC")+
  geom_point(size=4, colour="#00A7CC") +
  ggtitle("") +
  theme_light() +
  ylab("Number of Submissions")+
  theme(panel.border = element_blank(), 
        axis.line = element_line(colour = "grey"),
    axis.text.x  = element_text(size = 16, colour = "black"), axis.ticks = element_blank(),
        plot.title = element_text(hjust = 0.5,size = 20),
        axis.text.y = element_text(size = 16, colour = "black"), legend.position = "none")+xlab("")+ylab("")+
  geom_text(aes(y = n+2, 
                label = n), color = "black", size=5, fontface="bold")

################Cumulative Plots

achieved_interviews <- nrow(dat)
target_interviews <- sum(target_gender$Target)
deficit <- target_interviews - achieved_interviews


cumplot_Overall <- dat %>%group_by(Q_2)%>%summarise(n=n())%>%filter(year(Q_2)!=2015)%>%mutate(cumsum = cumsum(n))%>%
  ggplot(aes(x=Q_2, y=cumsum)) +
  geom_path(size =1.4, colour="#F3B11C") +
  geom_point(size=4, colour="#F3B11C") +
  ggtitle("") +
  theme_light() +
  ylab("Number of Submissions")+
  theme(panel.border = element_blank(), 
        axis.line = element_line(colour = "grey"),
        axis.text.x  = element_text(size = 16, colour = "black"), axis.ticks = element_blank(),
        plot.title = element_text(hjust = 0.5,size = 20),
        axis.text.y = element_text(size = 16, colour = "black"), legend.position = "none")+xlab("")+ylab("")+
  geom_text(aes(y = cumsum+2, 
                label = formatC(cumsum,format = "f", digits = 0, big.mark = ",")), color = "black", size=5, fontface="bold")+
  geom_text(aes(y = max(cumsum)-200,x =  min(Q_2)+1, 
                label = paste0("Achieved: ", formatC(achieved_interviews,format = "f", digits = 0, big.mark = ","),"\n",
                  "Target: ", formatC(target_interviews,format = "f", digits = 0, big.mark = ","),"\n", 
                               "Deficit: ", formatC(deficit,format = "f", digits = 0, big.mark = ","))), color = "#00A7CC", size=7, fontface="bold")



cum_EA <- dat %>%group_by(Q_2, Q_11)%>%summarise(n=n())%>%filter(year(Q_2)!=2015)%>%group_by(Q_11)%>%mutate(cumsum = cumsum(n))%>%
  ggplot(aes(x=Q_2, y=cumsum,color=Q_11)) +
  geom_path(size=1.4) +
  geom_point(size=4) +
  ggtitle(" ") +
  theme_light() +
  ylab("Number of Submissions")+
  theme(panel.border = element_blank(), 
        axis.line = element_line(colour = "grey"),
    axis.text.x  = element_text(size = 16, colour = "black"), axis.ticks = element_blank(),
        plot.title = element_text(hjust = 0.5,size = 20),
        axis.text.y = element_text(size = 16, colour = "black"), legend.position = "top",legend.title = element_text(size = 18, colour = "black"), legend.text =element_text(size = 20, colour = "black"))+xlab("")+ylab("")+
  geom_text(aes(y = cumsum+2, 
                label = formatC(cumsum,format = "f", digits = 0, big.mark = ",")), color = "black", size=5, fontface="bold")+
  scale_color_manual(values=c("#00A7CC","#F3B11C"))+labs(colour = "Urban Rural:")



cum_Gender <- dat %>%group_by(Q_2, B2)%>%summarise(n=n())%>%filter(year(Q_2)!=2015)%>%group_by(B2)%>%mutate(cumsum = cumsum(n))%>%
  ggplot(aes(x=Q_2, y=cumsum,color=B2)) +
  geom_path(size=1.4) +
  geom_point(size=4) +
  ggtitle("") +
  theme_light() +
  ylab("Number of Submissions")+
  theme(panel.border = element_blank(), 
        axis.line = element_line(colour = "grey"),
    axis.text.x  = element_text(size = 16, colour = "black"), axis.ticks = element_blank(),
        plot.title = element_text(hjust = 0.5,size = 20),
        axis.text.y = element_text(size = 16, colour = "black"), legend.position = "top",legend.title = element_text(size = 18, colour = "black"), legend.text =element_text(size = 20, colour = "black") )+xlab("")+ylab("")+
  geom_text(aes(y = cumsum+2, 
                label = formatC(cumsum,format = "f", digits = 0, big.mark = ",")), color = "black", size=5, fontface="bold")+
  scale_color_manual(values=c("#00A7CC","#F3B11C"))+labs(colour = "Gender of the Respondents:")


#############KPIs
C5_10_and_B2 <- dat %>% group_by(C5_10, B2) %>% summarise(Number = n())
C5_10_and_B2_group <- C5_10_and_B2 %>% group_by(C5_10) %>% mutate(Proportions =round(Number/sum(Number)*100, 0))

C5_10_and_B2_py<- C5_10_and_B2_group%>%
  arrange(desc(B2)) %>%
  mutate(lab.ypos = cumsum(Proportions) - 0.3*Proportions)


C5_10_and_B2_py$C5_10 <- str_trim(as.character(C5_10_and_B2_py$C5_10))
C5_10_and_B2_py$C5_10 <- ifelse(str_detect(C5_10_and_B2_py$C5_10, "Don"), "Dont own", C5_10_and_B2_py$C5_10)

lab_df <- C5_10_and_B2_py%>%group_by(C5_10)%>%summarise( sum(Number))

labelcustom <- c(
  `Personally own` = paste0("Personally own : ",lab_df[lab_df$C5_10=="Personally own",2,drop=T], "(",round(lab_df[lab_df$C5_10=="Personally own",2,drop=T]/sum(lab_df$`sum(Number)`)*100,0), "%)"),
  `Commonly owned` = paste0("Commonly owned: ",lab_df[lab_df$C5_10=="Commonly owned",2, drop=T], "(",round(lab_df[lab_df$C5_10=="Commonly owned",2,drop=T]/sum(lab_df$`sum(Number)`)*100,0), "%)"),
  `Dont own` = paste0("Don't own: ",lab_df[lab_df$C5_10=="Dont own",2,drop=T], "(",round(lab_df[lab_df$C5_10=="Dont own",2,drop=T]/sum(lab_df$`sum(Number)`,0)*100), "%)")

)

draw_smartphones_ownership <- ggplot(C5_10_and_B2_py, aes(x = 2, y = Proportions, fill = B2 )) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar(theta = "y", start = 0)+geom_text(aes(y = lab.ypos, 
                                                    label = paste0(Number, " \n(",round(Proportions), "%)")), color = "white", size=6)+
  theme_classic()+ylab("")+xlab("")+ggtitle("")+
  theme( plot.title = element_text(hjust=0.5,size = 20),axis.text = element_blank(), axis.ticks = element_blank(),
        legend.title=element_text(size=18),legend.text = element_text(size = 16),legend.position = "bottom",
        strip.text= element_text(size = 18, colour = "black"), panel.spacing =unit(14, "lines"),
        panel.border = element_rect(color = "black", fill = NA, size = .8),
        strip.background = element_rect(color = "black", size = 1))+
  scale_fill_manual(values=c("#00A7CC","#F3B11C"))+labs(fill = "Gender of the Respondents:")+#xlim(.9, 2.5)+
  facet_wrap(.~C5_10, labeller = as_labeller(labelcustom))



C8_1_data <- dat%>% group_by(C8_1) %>% summarise(Number = n())
C8_1_data_plot<- C8_1_data%>%mutate(proportions =round(100*(Number/sum(Number)),0))

ymax_c81 <- max(C8_1_data_plot$Number)

draw_plot8 <- ggplot(C8_1_data_plot, aes(y = Number, x = reorder(C8_1, Number),fill=C8_1)) + geom_bar(stat = "identity") + 
  theme_classic()+coord_flip()+scale_y_continuous(limits = c(0,ymax_c81+round(.1*ymax_c81,0)))+theme(plot.margin = unit(c(1, 1, 1, 1), "cm"),axis.text.x = element_blank(), axis.ticks = element_blank(),
                        plot.title = element_text(hjust = 0.5,size = 20),
                        axis.text.y = element_text(size = 16, colour = "black"),
                        legend.title=element_text(size=18),legend.text = element_text(size = 16),
                        legend.position = "none") + xlab("") + ylab("")+ggtitle("Bank Account(s) Ownership")+labs(fill = "Gender:")+
  geom_text(aes(y= Number, 
                label = paste0(Number, " \n(",proportions, "%)")),size=6,hjust = 0)+scale_fill_manual(values=c("#00A7CC","#F3B11C"))



C8_1_data_stack <- dat%>% group_by(B2,C8_1) %>% summarise(Number = n())
C8_1_data_plot_stack<- C8_1_data_stack%>%group_by(B2)%>%mutate(proportions =round(100*(Number/sum(Number)),0))

draw_plot8a <- ggplot(C8_1_data_plot_stack, aes(y = proportions, x = B2,fill=C8_1)) + geom_bar(stat = "identity") + 
 theme_classic()+coord_flip()+theme(plot.margin = unit(c(1, 1, 1, 1), "cm"),axis.text.x = element_blank(), axis.ticks = element_blank(),
 plot.title = element_text(hjust = 0.5,size = 20),
 axis.text.y = element_text(size = 16, colour = "black"),
 legend.title=element_text(size=18),legend.text = element_text(size = 16),
 legend.position = "bottom") + xlab("") + ylab("")+ggtitle("Bank Account(s) Ownership by Gender")+labs(fill = "Own Bank Accounts:")+
 geom_text(aes(y= proportions, 
 label = paste0(Number, " \n(",proportions, "%)")),size=6,position = position_stack(vjust = .75),colour ="white")+scale_fill_manual(values=c("#00A7CC","#F3B11C"))






C8_2_data <- dat%>% group_by(C8_2) %>% summarise(Number = n())
C8_2_data_plot<- C8_2_data%>%mutate(proportions =round(100*(Number/sum(Number)),0))

ymax_c82 <- max(C8_2_data_plot$Number)
draw_plot9 <- ggplot(C8_2_data_plot, aes(y = Number, x = reorder(C8_2, Number),fill=C8_2)) + geom_bar(stat = "identity") + 
  theme_classic()+coord_flip()+scale_y_continuous(limits = c(0,ymax_c82+round(ymax_c82*0.1,0)))+
                        theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
                        plot.title = element_text(hjust = 0.5,size = 20),
                        axis.text.y = element_text(size = 16, colour = "black"), 
                        legend.title=element_text(size=18),legend.text = element_text(size = 16),
                        legend.position = "none") + xlab("") + ylab("")+ggtitle("Mobile Money Account(s) Ownership")+labs(fill = "Gender:")+
  geom_text(aes(y= Number, 
                label = paste0(Number, " \n(",proportions, "%)")),size=6,hjust = 0)+scale_fill_manual(values=c("#00A7CC","#F3B11C"))

C8_2_data_stack <- dat%>% group_by(B2, C8_2) %>% summarise(Number = n())
C8_2_data_plot_stack<- C8_2_data_stack%>%group_by(B2)%>%mutate(proportions =round(100*(Number/sum(Number)),0))


draw_plot9a <- ggplot(C8_2_data_plot_stack, aes(y = proportions, x = B2,fill=C8_2)) + geom_bar(stat = "identity") + 
  theme_classic()+coord_flip()+
  theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
        plot.title = element_text(hjust = 0.5,size = 20),
        axis.text.y = element_text(size = 16, colour = "black"), 
        legend.title=element_text(size=18),legend.text = element_text(size = 16),
        legend.position = "bottom") + xlab("") + ylab("")+ggtitle("Mobile Money Account(s) Ownership by Gender")+labs(fill = "Own Mobile Money Accounts:")+
  geom_text(aes(y= proportions, 
  label = paste0(Number, " \n(",proportions, "%)")),size=6, position = position_stack(vjust = .75), colour ="white")+
  scale_fill_manual(values=c("#00A7CC","#F3B11C"))



C5_10_and_Q_11 <- dat %>% group_by(C5_10, Q_11) %>% summarise(Number = n())
C5_10_and_Q_11_group <- C5_10_and_Q_11 %>% group_by(C5_10) %>% mutate(Proportions =round(Number/sum(Number)*100, 0))

C5_10_and_Q_11_py<- C5_10_and_Q_11_group%>%
  arrange(desc(Q_11)) %>%
  mutate(lab.ypos = cumsum(Proportions) - 0.3*Proportions)


C5_10_and_Q_11_py$C5_10 <- str_trim(as.character(C5_10_and_Q_11_py$C5_10))
C5_10_and_Q_11_py$C5_10 <- ifelse(str_detect(C5_10_and_Q_11_py$C5_10, "Don"), "Dont own", C5_10_and_Q_11_py$C5_10)

lab_df <- C5_10_and_Q_11_py%>%group_by(C5_10)%>%summarise( sum(Number))

labelcustom <- c(
  `Personally own` = paste0("Personally own : ",lab_df[lab_df$C5_10=="Personally own",2,drop=T], "(",round(lab_df[lab_df$C5_10=="Personally own",2,drop=T]/sum(lab_df$`sum(Number)`)*100,0), "%)"),
  `Commonly owned` = paste0("Commonly owned: ",lab_df[lab_df$C5_10=="Commonly owned",2, drop=T], "(",round(lab_df[lab_df$C5_10=="Commonly owned",2,drop=T]/sum(lab_df$`sum(Number)`)*100,0), "%)"),
  `Dont own` = paste0("Don't own: ",lab_df[lab_df$C5_10=="Dont own",2,drop=T], "(",round(lab_df[lab_df$C5_10=="Dont own",2,drop=T]/sum(lab_df$`sum(Number)`,0)*100), "%)")
  
)


draw_plot10 <- ggplot(C5_10_and_Q_11_py, aes(x = 2, y = Proportions, fill = Q_11 )) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar(theta = "y", start = 0)+geom_text(aes(y = lab.ypos, 
                                                    label = paste0(Number, " \n(",round(Proportions), "%)")), color = "white", size=6)+
  theme_classic()+ylab("")+xlab("")+ggtitle("")+
  theme(plot.title = element_text(hjust=0.5,size = 20),axis.text = element_blank(), axis.ticks = element_blank(),
        legend.title=element_text(size=18),legend.text = element_text(size = 16),legend.position = "bottom",
        strip.text= element_text(size = 18, colour = "black"), panel.spacing =unit(14, "lines"),
        panel.border = element_rect(color = "black", fill = NA, size = .8),
        strip.background = element_rect(color = "black", size = 1))+
  scale_fill_manual(values=c("#00A7CC","#F3B11C"))+labs(fill = "Urban Rural:")+xlim(.9, 2.5)+
  facet_wrap(.~C5_10, labeller = as_labeller(labelcustom))



C8_1_data <- dat%>% group_by(C8_1, Q_11) %>% summarise(Number = n())
C8_1_data_plot<- C8_1_data%>%group_by(C8_1)%>%mutate(proportions =round(100*(Number/sum(Number)),2))

draw_plot11 <- ggplot(C8_1_data_plot, aes(y = Number, x = reorder(Q_11, Number),fill=Q_11)) + geom_bar(stat = "identity") + 
  theme_classic()+theme(axis.ticks = element_blank(),
                        plot.title = element_text(hjust = 0.5,size = 20),
                        axis.text = element_text(size = 16, colour = "black"),
                        legend.position = "none", panel.spacing =unit(2, "lines"),strip.text= element_text(size = 18, colour = "black"),
                        panel.border = element_rect(color = "black", fill = NA, size = .8),
                        strip.background = element_rect(color = "black", size = 1)) + xlab("") + ylab("")+ggtitle("Bank Account(s)")+
  geom_text(aes(y= Number, 
                label = paste0(Number, " (",proportions, "%)")),size=6,vjust = 0)+facet_wrap(.~C8_1, ncol = 2, labeller = label_wrap_gen())+scale_fill_manual(values=c("#00A7CC","#F3B11C"))




C8_2_data <- dat%>% group_by(C8_2, Q_11) %>% summarise(Number = n())
C8_2_data_plot<- C8_2_data%>%group_by(C8_2)%>%mutate(proportions =round(100*(Number/sum(Number)),2))

draw_plot12 <- ggplot(C8_2_data_plot, aes(y = Number, x = reorder(Q_11, Number),fill=Q_11)) + geom_bar(stat = "identity") + 
  theme_classic()+theme(axis.ticks = element_blank(),
                        plot.title = element_text(hjust = 0.5,size = 20),
                        axis.text = element_text(size = 16, colour = "black"),
                        legend.position = "none", panel.spacing =unit(2, "lines"),strip.text= element_text(size = 18, colour = "black"),
                        panel.border = element_rect(color = "black", fill = NA, size = .8),
                        strip.background = element_rect(color = "black", size = 1)) + xlab("") + ylab("")+ggtitle("Mobile Money Accounts")+
  geom_text(aes(y= Number, 
                label = paste0(Number, " (",proportions, "%)")),size=6,vjust = 0)+facet_wrap(.~C8_2, ncol = 2, labeller = label_wrap_gen())+scale_fill_manual(values=c("#00A7CC","#F3B11C"))




C8_B1_data <- dat%>% group_by(C8_1, B1) %>% summarise(Number = n())
C8_B1_data_plot<- C8_B1_data%>%group_by(C8_1)%>%mutate(proportions =round(100*(Number/sum(Number)),2))

draw_plot13 <- ggplot(C8_B1_data_plot, aes(y = Number, x = B1,fill=C8_1)) + geom_bar(stat = "identity") + 
  theme_classic()+theme(axis.ticks = element_blank(),
                        plot.title = element_text(hjust = 0.5,size = 20),
                        axis.text = element_text(size = 16, colour = "black"), 
                        legend.title=element_text(size=18),legend.text = element_text(size = 16),
                        legend.position = "None", panel.spacing =unit(2, "lines"),strip.text= element_text(size = 18, colour = "black"),
                        panel.border = element_rect(color = "black", fill = NA, size = .8),
                        strip.background = element_rect(color = "black", size = 1)) + xlab("") + ylab("")+ggtitle("")+
  geom_text(aes(y= Number, 
                label = paste0(Number, " (",proportions, "%)")),size=6,vjust = 0)+facet_wrap(.~C8_1, ncol = 2, labeller = label_wrap_gen(), scales = "free")+scale_fill_manual(values=c("#00A7CC","#F3B11C", "#00558A","#881946"))



C8_B1_data <- dat%>% group_by(C5_10, B1) %>% summarise(Number = n())
C8_B1_data_plot<- C8_B1_data%>%group_by(C5_10)%>%mutate(proportions =round(100*(Number/sum(Number)),2))

draw_plot14 <- ggplot(C8_B1_data_plot, aes(y = Number, x = B1,fill=C5_10)) + geom_bar(stat = "identity") + 
  theme_classic()+theme(axis.ticks = element_blank(),plot.title = element_text(hjust = 0.5,size = 20),
                        axis.text = element_text(size = 16, colour = "black"), 
                        legend.position = "None", panel.spacing =unit(2, "lines"),strip.text= element_text(size = 18, colour = "black"),
                        panel.border = element_rect(color = "black", fill = NA, size = .8),
                        strip.background = element_rect(color = "black", size = 1)) + xlab("") + ylab("")+ggtitle("")+
  geom_text(aes(y= Number, 
                label = paste0(Number, " (",proportions, "%)")),size=6,vjust = 0)+facet_wrap(.~C5_10, ncol = 1, labeller = label_wrap_gen(), scales='free')+scale_fill_manual(values=c("#00A7CC","#F3B11C", "#00558A","#881946"))



C8_B1_data <- dat%>% group_by(C8_2, B1) %>% summarise(Number = n())
C8_B1_data_plot<- C8_B1_data%>%group_by(C8_2)%>%mutate(proportions =round(100*(Number/sum(Number)),2))

draw_plot15 <- ggplot(C8_B1_data_plot, aes(y = Number, x = B1,fill=C8_2)) + geom_bar(stat = "identity") + 
  theme_classic()+theme(axis.ticks = element_blank(),plot.title = element_text(hjust = 0.5,size = 20),
                        axis.text = element_text(size = 16, colour = "black"), 
                        legend.position = "None", panel.spacing =unit(2, "lines"),strip.text= element_text(size = 18, colour = "black"),
                        panel.border = element_rect(color = "black", fill = NA, size = .8),
                        strip.background = element_rect(color = "black", size = 1)) + xlab("") + ylab("")+ggtitle("")+
  geom_text(aes(y= Number, 
                label = paste0(Number, " (",proportions, "%)")),size=6,vjust = 0)+facet_wrap(.~C8_2, ncol = 2, labeller = label_wrap_gen(), scales='free_y')+scale_fill_manual(values=c("#00A7CC","#F3B11C", "#00558A","#881946"))

#########Target Vs Performance


achieved <- dat%>%group_by(Q_6, Q_11)%>%summarise(Achieved=n())%>%ungroup()
achieved_vs_target <- as.data.frame(left_join(achieved, target, by=c("Q_6", "Q_11")))
achieved_vs_target$Deficit <- achieved_vs_target$Target- achieved_vs_target$Achieved

achived_target <- achieved_vs_target%>%dplyr::select(Achieved,Target)%>%summarise(Achieved = sum(Achieved), Target = sum(Target))
achieved_bar <- melt(achived_target,variable.name = "Type")



draw_achieved_plot <- ggplot(achieved_bar, aes(y = value, x = Type,fill = Type)) + geom_bar(stat = "identity", fill = "#00A7CC") + 
  theme_classic() + coord_flip() +theme(axis.line = element_line(colour = "grey"),
                                        axis.text.x = element_blank(), axis.ticks = element_blank(),
                                        plot.title = element_text(hjust = 0.5,size = 20),
                                        axis.text.y = element_text(size = 16, colour = "black"), 
                                        legend.position = "none") + xlab("") + ylab("")+ggtitle("") + geom_text(aes(y= value, label = formatC(value,format = "f", digits = 0, big.mark = ",")),
                                                                                                                                  size=6,hjust = 0.4)


achived_target_urban_rural <- achieved_vs_target%>%dplyr::group_by(Q_11)%>%summarise(Achieved = sum(Achieved), Target = sum(Target))
achieved_bar1 <- melt(id.vars = "Q_11", achived_target_urban_rural,variable.name = "Interviews")


achived_target_urban_rural1 <- achived_target_urban_rural
achived_target_urban_rural1$Deficit <- achived_target_urban_rural1$Target - achived_target_urban_rural1$Achieved


labelcustom_r <- c(
  Urban = paste0("Urban (Deficit: ",achived_target_urban_rural1[achived_target_urban_rural1$Q_11=="Urban", 4, drop=T], ")"),
  Rural = paste0("Rural (Deficit: ",achived_target_urban_rural1[achived_target_urban_rural1$Q_11=="Rural", 4, drop=T], ")")
)



draw_achieved_plot1 <- ggplot(achieved_bar1, aes(y = value, x = reorder(Interviews, -value),fill=Interviews)) + geom_bar(stat = "identity") + 
  theme_classic()+theme(axis.line = element_line(colour = "grey"),
                        axis.ticks = element_blank(),
                        plot.title = element_text(hjust = 0.5,size = 20),
                        axis.text = element_text(size = 16, colour = "black"),
                        legend.position = "none", panel.spacing =unit(2, "lines"),strip.text= element_text(size = 18, colour = "black"),
                        panel.border = element_rect(color = "grey", fill = NA, size = .1),
                        strip.background = element_rect(color = "grey", size = 1)) + xlab("") + ylab("")+ggtitle("")+
  geom_text(aes(y= value, 
                label = formatC(value,format = "f", digits = 0, big.mark = ",")),size=6,vjust = 0)+facet_wrap(.~Q_11, ncol = 2, labeller = as_labeller(labelcustom_r))+scale_fill_manual(values=c("#00A7CC","#F3B11C"))



achieved_gender <- as.data.frame(dat%>%group_by(B2)%>%summarise(Achieved=n())%>%ungroup())

achieved_vs_target_gender <- left_join(achieved_gender, target_gender, by= "B2")
achieved_vs_target_gender1 <- achieved_vs_target_gender
achieved_vs_target_gender1$Deficit <- achieved_vs_target_gender1$Target - achieved_vs_target_gender1$Achieved

achieved_bar2 <- melt(achieved_vs_target_gender, id.vars = "B2",variable.name = "Interviews")



labelcustom_g <- c(
  Female = paste0("Female (Deficit: ",achieved_vs_target_gender1[achieved_vs_target_gender1$B2=="Female", 4, drop=T], ")"),
  Male = paste0("Male (Deficit: ",achieved_vs_target_gender1[achieved_vs_target_gender1$B2=="Male", 4, drop=T], ")")
 )


draw_achieved_plot2 <- ggplot(achieved_bar2, aes(y = value, x = reorder(Interviews, -value),fill=Interviews)) + geom_bar(stat = "identity") + 
  theme_classic()+theme(axis.line = element_line(colour = "grey"),
                        axis.ticks = element_blank(),
                        plot.title = element_text(hjust = 0.5,size = 20),
                        axis.text = element_text(size = 16, colour = "black"),
                        legend.position = "none", panel.spacing =unit(2, "lines"),strip.text= element_text(size = 18, colour = "black"),
                        panel.border = element_rect(color = "grey", fill = NA, size = .1),
                        strip.background = element_rect(color = "grey", size = 1)) + xlab("") + ylab("")+ggtitle("")+
  geom_text(aes(y= value, 
                label = formatC(value,format = "f", digits = 0, big.mark = ",")),size=6,vjust = 0)+facet_wrap(.~B2, ncol = 2, labeller = as_labeller(labelcustom_g))+scale_fill_manual(values=c("#00A7CC","#F3B11C"))



C84_data <- dat%>% group_by(C8_4) %>% summarise(Number = n())
C84_data_plot<- C84_data%>%mutate(proportions =round(100*(Number/sum(Number)),0))

C13_data_plot_max <- max(C84_data_plot$Number)

draw_plotC84 <- ggplot(C84_data_plot, aes(y = Number, x = reorder(C8_4, Number), fill=C8_4)) + geom_bar(stat = "identity") + 
  theme_classic() + coord_flip() +scale_y_continuous(limits = c(0, C84_data_plot_max+round(C13_data_plot_max*0.05)))+theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
 plot.title = element_text(hjust = 0.5,size = 20),
 axis.text.y = element_text(size = 16, colour = "black"), 
 legend.position = "none") + xlab("") + ylab("")+
  ggtitle("Participation in Informal Savings or Investement Groups") + geom_text(aes(y= Number, 
 label = paste0(Number, " \n(",proportions, "%)")),size=6,hjust = 0)+
  scale_fill_manual(values=c("#00A7CC","#F3B11C"))



C8_4_and_B2 <- dat %>% group_by(B2, C8_4) %>% summarise(Number = n())
C8_4_and_B2_group <- C8_4_and_B2 %>% group_by(B2) %>% mutate(Proportions =round(Number/sum(Number)*100, 0))

C8_4_and_B2_py<- C8_4_and_B2_group%>%
  arrange(desc(C8_4)) %>%
  mutate(lab.ypos = cumsum(Proportions) - 0.3*Proportions)

draw_plot_C84_B2 <- ggplot(C8_4_and_B2_py, aes(x = 2, y = Proportions, fill = C8_4 )) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar(theta = "y", start = 0)+geom_text(aes(y = lab.ypos, 
                                                    label = paste0(Number, " \n(",round(Proportions), "%)")), color = "white", size=6)+
  theme_classic()+ylab("")+xlab("")+ggtitle("Participation in Informal Savings or Investement Groups by Gender of Resepondents")+
  theme(axis.line = element_line(colour = "white"),plot.title = element_text(hjust=0.5,size = 20),axis.text = element_blank(), axis.ticks = element_blank(),
        legend.title=element_text(size=18),legend.text = element_text(size = 16),legend.position = "bottom",
        panel.spacing =unit(24, "lines"),strip.text= element_text(size = 18, colour = "black"),
        panel.border = element_rect(color = "white", fill = NA, size = .1),
        strip.background = element_rect(color = "white", size = 1))+
  scale_fill_manual(values=c("#00A7CC","#F3B11C"))+labs(fill = "Participation:")+
  xlim(.9, 2.5)+facet_wrap(.~B2, labeller = label_wrap_gen())



C13_data <- dat%>% group_by(C13) %>% summarise(Number = n())
C13_data_plot<- C13_data%>%group_by(C13)%>%mutate(proportions =round(100*(Number/sum(C13_data$Number)),0))

C13_data_plot_max <- max(C13_data_plot$Number)

draw_plot6_6 <- ggplot(C13_data_plot, aes(y = Number, x = reorder(C13, Number))) + geom_bar(stat = "identity", fill = "#00A7CC") + 
  theme_classic() + coord_flip() +scale_y_continuous(limits = c(0, C13_data_plot_max+round(C13_data_plot_max*0.05)))+theme(axis.text.x = element_blank(), axis.ticks = element_blank(),
                                        plot.title = element_text(hjust = 0.5,size = 20),
                                        axis.text.y = element_text(size = 16, colour = "black"), 
                                        legend.position = "none") + xlab("") + ylab("")+ggtitle("Respodents Breakdown by their Saving Behaviour") + geom_text(aes(y= Number, 
                                                                                                                                                                  label = paste0(Number, " \n(",proportions, "%)")),size=6,hjust = 0)


C13_data_stack <- dat%>% group_by(B2, C13) %>% summarise(Number = n())
C13_data_plot_stack<- C13_data_stack%>%group_by(B2)%>%mutate(proportions =round(100*(Number/sum(Number)),0))


draw_plot6_6a <- ggplot(C13_data_plot_stack, aes(y = proportions, x = B2, fill= C13)) + geom_bar(stat = "identity", position = position_dodge()) + 
  theme_classic() + theme(axis.ticks = element_blank(),
 plot.title = element_text(hjust = 0.5,size = 20),
 axis.text = element_text(size = 16, colour = "black"), 
 legend.position = "bottom") + xlab("") + ylab("")+
  ggtitle("Respodents Breakdown by their Saving Behaviour and Gender") + geom_text(aes(y= proportions, 
 label = paste0(Number, "(",proportions, "%)")),size=6, position = position_dodge(width = .9),vjust = 0,colour ="black")+labs(fill = "Saving Behaviour:")




