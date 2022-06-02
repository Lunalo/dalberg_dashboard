###################Data Import

dat <- read_sav("datasets/Kenya_BMGF_Data.sav")
target <- read.csv("datasets/target.csv")
Enum_QC <- read.csv("datasets/Enum_QC.csv")

names(Enum_QC) <- c("Enumerator", "Outliers","Skipping Problems", "Change of Locations", "Duration of Interview", "Time between Interviews
")

QCSummary <- read.csv("datasets/QCSumary.csv")
target_gender <- read.csv("datasets/targetGender.csv")
names(QCSummary)<- c("County", "Callbacks", "Questions Triggering QC Logs", "Enumerators with Most QC Logs", "QC Logs Resolved")

dat <- as_factor(dat)

dat <- data.frame(dat)
#Changing column name
colnames(dat)[colnames(dat) == "A1"] <- "Household_Members"
dat$Q_11 <- droplevels(dat$Q_11, exclude ="MISSING")
dat <- remove_var_label(dat)

var_drop <- c("Latitude","Longitude","VStart","VEnd","Q_2","Q_3","Q_3","Q_4","Q_5",
              "Q_7","Q_8","Q_9","Q_10","Q_12_LA","Q_12_LO","Q_13","Q_14",
              "Q_15","Q_16","Q_17","Q_18","A0","I_1_A3_1","I_2_A3_1","I_3_A3_1",
              "I_4_A3_1","I_5_A3_1","I_6_A3_1","I_7_A3_1","I_8_A3_1","I_9_A3_1",
              "I_10_A3_1","I_11_A3_1","Q_26","Q_27","Q_28","Q_29","Q_30","Q_31","Q_32",
              "Q_34","A5","C8_1","Q_36_S","E1","E2","T_117_1","T_117_2","T_117_3",
              "T_117_4","T_117_5","Q_118","Q_119_LA","Q_119_LO","COMPLETE_CASES","countid"
)

# Demographic variables
demographic_var <- c("B2", "B1", "Q_11")

# Mapping Data
suppressWarnings({
  kenya1 <- readOGR("datasets/ke_ad2_gad(Counties without cutouts).shp")
  bmgf_data <- readOGR("datasets/Kenya_BMGF_Datav1.shp")
  data <- read.csv("datasets/Kenya_BMGF_Data.csv")})
data$COUNTYv1 <- as.character(data$COUNTYv1)
