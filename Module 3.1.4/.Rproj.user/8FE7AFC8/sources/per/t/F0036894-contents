library(utils)
library("dplyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")
df <- read.csv("~/Documents/Data_Science/Module 3/refine_original.csv")
product_col_names <- c("product_code", "product_number")
#fixes Phillips
df <-lapply(df,function(x) gsub("phillipS","philips",x))
df <-lapply(df,function(x) gsub("Phillips","philips",x))
df <-lapply(df,function(x) gsub("phillips","philips",x))
df <-lapply(df,function(x) gsub("phillipS","philips",x))
df <-lapply(df,function(x) gsub("phlips","philips",x))
df <-lapply(df,function(x) gsub("fillips","philips",x))
#fixes Azko
df <-lapply(df,function(x) gsub("Akzo","akzo",x))
df <-lapply(df,function(x) gsub("AKZO","akzo",x))
df <-lapply(df,function(x) gsub("akz0","akzo",x))
df <-lapply(df,function(x) gsub("ak zo","akzo",x))
#fixes Van Houten
df <-lapply(df,function(x) gsub("Van Houten","van houten",x))
df <-lapply(df,function(x) gsub("van Houten","van houten",x))
#fixes Unilever
df <-lapply(df,function(x) gsub("unilver","unilever",x))
df <-lapply(df,function(x) gsub("Unilever","unilever",x))
#Converts it back to dataframe from List
df <- data.frame(df)

#from https://rstudio-pubs-static.s3.amazonaws.com/116317_e6922e81e72e4e3f83995485ce686c14.html#/6
df %>%
  separate(2,product_col_names) %>%
  mutate( product_cat = ifelse(product_code == "p" , "Smartphone",
                        ifelse(product_code == "v" , "TV",
                        ifelse(product_code == "x" , "Laptop",
                        ifelse(product_code == "q" , "Tablet","NA"))))
  ) %>%
  unite("full_address",4:6,sep = ",") %>%
  mutate(company_philips = ifelse(company == "philips", 1,0))  %>%
  mutate(company_akzo = ifelse(company == "akzo", 1,0))  %>%
  mutate(company_van_houten = ifelse(company == "van houten", 1,0))  %>%
  mutate(company_unilever = ifelse(company == "unilever", 1,0)) %>%
  
  mutate(product_smartphone = ifelse(product_cat == "Smartphone", 1,0))  %>%
  mutate(product_tv = ifelse(product_cat == "Laptop", 1,0))  %>%
  mutate(product_laptop = ifelse(product_cat == "TV", 1,0))  %>%
  mutate(product_tablet = ifelse(product_cat == "Tablet", 1,0)) %>%
  write.csv(file = "refine_clean.csv")
