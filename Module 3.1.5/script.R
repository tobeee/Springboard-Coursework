library(readr)
library(dplyr)
titanic3 <- read_csv("titanic3.csv")
#titanic3$embarked <- sub("", "S", titanic3$embarked)
titanic3$embarked[is.na(titanic3$embarked)] <- "S"
average_age <- mean(titanic3$age,na.rm=TRUE)
titanic3$age[is.na(titanic3$age)] <- average_age
titanic3$boat[is.na(titanic3$boat)] <- "NA"
titanic3 %>%
  mutate(has_cabin_number = ifelse(is.na(cabin), 1,0)) %>%
  write.csv(file = "titanic_clean.csv")
  