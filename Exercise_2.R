#Exercise 2: Dealing with missing values

#TASK 0: Load the data in RStudio
org_df <- read.csv("titanic_original.csv")

#TASK 1: Port of embarkation
org_df$embarked <- gsub("^$", "S", org_df$embarked)

#TASK 2: Age
mean_value <- as.integer(mean(org_df$age, na.rm = T))
org_df[is.na(org_df[ , "age"]), "age"] <- mean_value

#TASK 3: Lifeboat
org_df$boat <- gsub("^$", "NONE", org_df$boat)

#TASK 4: Cabin
org_df$has_cabin_number <- ifelse(org_df$cabin != "", 1, 0)

#Write the clean dataset
write.csv(org_df, file = "titanic_clean.csv", row.names = FALSE)
