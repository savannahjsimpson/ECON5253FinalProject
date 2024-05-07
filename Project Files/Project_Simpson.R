#Load in each of my data sets

#Jupiter Data
library(tidyverse)

jupiter_pre_covid <- read.csv("jupitersales16.19.csv")
jupiter_pre_covid <- jupiter_pre_covid %>% 
  mutate(Lot.Size.z = (Lot.Size - mean(Lot.Size))/sd(Lot.Size),
         Total.SQFT.100 = Total.SQFT / 100)

jupiter_post_covid <- read.csv("jupitersales21.24.csv")
jupiter_post_covid <- jupiter_post_covid %>%
  mutate(Lot.Size.z = (Lot.Size - mean(Lot.Size))/sd(Lot.Size),
         Total.SQFT.100 = Total.SQFT / 100)

#Boca Raton Data

boca_pre_covid <- read.csv("bocasales16.19.csv")
boca_pre_covid <- boca_pre_covid %>%
  mutate(Lot.Size.z = (Lot.Size - mean(Lot.Size))/sd(Lot.Size),
         Total.SQFT.100 = Total.SQFT / 100)

boca_post_covid <- read.csv("bocasales21.24.csv")
boca_post_covid <- boca_post_covid %>%
  mutate(Lot.Size.z = (Lot.Size - mean(Lot.Size))/sd(Lot.Size),
         Total.SQFT.100 = Total.SQFT / 100)



#JUPITER PRE REGRESSION
jupiter_pre_covid_model <- lm(log(Sale.Price) ~ Lot.Size.z + Total.SQFT.100 + Bed + as.factor(Full.Bath), data = jupiter_pre_covid)
summary(jupiter_pre_covid_model)

jupiter_pre_covid_coefficients <- coef(summary(jupiter_pre_covid_model))
jupiter_pre_covid_coefficients
#                         Estimate  Std. Error     t value     Pr(>|t|)
#(Intercept)           12.521714291 0.042965463 291.4367390 0.000000e+00
#Lot.Size.z             0.239177982 0.010350086  23.1087924 9.930465e-95
#Total.SQFT.100         0.013233067 0.001276451  10.3670795 5.692201e-24
#Bed                    0.031678221 0.011864582   2.6699820 7.710552e-03
#as.factor(Full.Bath)3  0.019577093 0.018485225   1.0590670 2.898291e-01
#as.factor(Full.Bath)4  0.023988915 0.032267395   0.7434413 4.573920e-01
#as.factor(Full.Bath)5  0.009479416 0.055295323   0.1714325 8.639189e-01
#as.factor(Full.Bath)6 -1.890442886 0.189245565  -9.9893643 1.905983e-22

jupiter_pre_covid_p_values <- jupiter_pre_covid_coefficients[, "Pr(>|t|)"]
jupiter_pre_covid_p_values
#.         (Intercept)            Lot.Size.z        Total.SQFT.100                   Bed 
#.        0.000000e+00          9.930465e-95          5.692201e-24          7.710552e-03 
#as.factor(Full.Bath)3 as.factor(Full.Bath)4 as.factor(Full.Bath)5 as.factor(Full.Bath)6 
#.        2.898291e-01          4.573920e-01          8.639189e-01          1.905983e-22

jupiter_pre_covid_adjusted_r_squared <- summary(jupiter_pre_covid_model)$adj.r.squared
jupiter_pre_covid_adjusted_r_squared
#[1] 0.8248672

jupiter_pre_covid_rmse <- sqrt(mean(jupiter_pre_covid_model$residuals^2))
jupiter_pre_covid_rmse
#[1] 0.1798423



#JUPITER POST REGRESSION
jupiter_post_covid_model <- lm(log(Sale.Price) ~ Lot.Size.z + Total.SQFT.100 + Bed + as.factor(Full.Bath), data = jupiter_post_covid)
summary(jupiter_post_covid_model)

jupiter_post_covid_coefficients <- coef(summary(jupiter_post_covid_model))
jupiter_post_covid_coefficients
#                          Estimate  Std. Error     t value     Pr(>|t|)
#(Intercept)           12.623597844 0.063587306 198.5238664 0.000000e+00
#Lot.Size.z             0.228632818 0.015130953  15.1102724 4.020128e-45
#Total.SQFT.100         0.019577431 0.001875316  10.4395370 6.950781e-24
#Bed                    0.093537697 0.017281485   5.4125961 8.415821e-08
#as.factor(Full.Bath)3  0.004722555 0.027770852   0.1700544 8.650142e-01
#as.factor(Full.Bath)4 -0.138741247 0.050295703  -2.7585109 5.950872e-03
#as.factor(Full.Bath)5 -0.206881582 0.076201984  -2.7149107 6.784911e-03

jupiter_post_covid_p_values <- jupiter_pre_covid_coefficients[, "Pr(>|t|)"]
jupiter_post_covid_p_values
#          (Intercept)            Lot.Size.z        Total.SQFT.100                   Bed 
#         0.000000e+00          9.930465e-95          5.692201e-24          7.710552e-03 
#as.factor(Full.Bath)3 as.factor(Full.Bath)4 as.factor(Full.Bath)5 as.factor(Full.Bath)6 
#         2.898291e-01          4.573920e-01          8.639189e-01          1.905983e-22 

jupiter_post_covid_adjusted_r_squared <- summary(jupiter_pre_covid_model)$adj.r.squared
jupiter_post_covid_adjusted_r_squared
#[1] 0.8248672

jupiter_post_covid_rmse <- sqrt(mean(jupiter_pre_covid_model$residuals^2))
jupiter_post_covid_rmse
#[1] 0.1798423



#BOCA PRE REGRESSION
boca_pre_covid_model <- lm(log(Sale.Price) ~ Lot.Size.z + Total.SQFT.100 + Bed + as.factor(Full.Bath), data = boca_pre_covid)
summary(boca_pre_covid_model)

boca_pre_covid_coefficients <- coef(summary(boca_pre_covid_model))
boca_pre_covid_coefficients
#                          Estimate  Std. Error      t value     Pr(>|t|)
#(Intercept)           12.042326736 0.042916857 280.59666066 0.000000e+00
#Lot.Size.z             0.094452229 0.009818559   9.61976508 4.829934e-20
#Total.SQFT.100         0.027724799 0.001784030  15.54054198 6.883121e-44
#Bed                    0.010932143 0.016192322   0.67514363 4.999320e-01
#as.factor(Full.Bath)3  0.056326395 0.024429241   2.30569563 2.158253e-02
#as.factor(Full.Bath)4 -0.003590848 0.092098838  -0.03898907 9.689164e-01

boca_pre_covid_p_values <- jupiter_pre_covid_coefficients[, "Pr(>|t|)"]
boca_pre_covid_p_values
#          (Intercept)            Lot.Size.z        Total.SQFT.100                   Bed 
#.        0.000000e+00          9.930465e-95          5.692201e-24          7.710552e-03 
#as.factor(Full.Bath)3 as.factor(Full.Bath)4 as.factor(Full.Bath)5 as.factor(Full.Bath)6 
#.        2.898291e-01          4.573920e-01          8.639189e-01          1.905983e-22 

boca_pre_covid_adjusted_r_squared <- summary(jupiter_pre_covid_model)$adj.r.squared
boca_pre_covid_adjusted_r_squared
#[1] 0.8248672

boca_pre_covid_rmse <- sqrt(mean(jupiter_pre_covid_model$residuals^2))
boca_pre_covid_rmse
#[1] 0.1798423



#BOCA POST REGRESSION
boca_post_covid_model <- lm(log(Sale.Price) ~ Lot.Size.z + Total.SQFT.100 + Bed + as.factor(Full.Bath), data = boca_post_covid)
summary(boca_post_covid_model)

boca_post_covid_coefficients <- coef(summary(boca_post_covid_model))
boca_post_covid_coefficients
#                         Estimate  Std. Error    t value      Pr(>|t|)
#(Intercept)           12.09024654 0.143969107 83.9780614 1.959041e-268
#Lot.Size.z             0.11552970 0.012897484  8.9575382  1.021337e-17
#Total.SQFT.100         0.02893718 0.002271306 12.7403259  9.340229e-32
#Bed                    0.04027098 0.020781813  1.9377994  5.330358e-02
#as.factor(Full.Bath)2  0.28577576 0.139221503  2.0526697  4.071071e-02
#as.factor(Full.Bath)3  0.27702826 0.144340650  1.9192671  5.561360e-02
#as.factor(Full.Bath)4  0.12645873 0.203148832  0.6224930  5.339485e-01
#as.factor(Full.Bath)5 -0.47886595 0.218855540 -2.1880458  2.920503e-02
#as.factor(Full.Bath)6 -0.09954410 0.258238490 -0.3854735  7.000777e-01

boca_post_covid_p_values <- jupiter_pre_covid_coefficients[, "Pr(>|t|)"]
boca_post_covid_p_values
#          (Intercept)            Lot.Size.z        Total.SQFT.100                   Bed 
#         0.000000e+00          9.930465e-95          5.692201e-24          7.710552e-03 
#as.factor(Full.Bath)3 as.factor(Full.Bath)4 as.factor(Full.Bath)5 as.factor(Full.Bath)6 
#         2.898291e-01          4.573920e-01          8.639189e-01          1.905983e-22 


boca_post_covid_adjusted_r_squared <- summary(jupiter_pre_covid_model)$adj.r.squared
boca_post_covid_adjusted_r_squared
#[1] 0.8248672

boca_post_covid_rmse <- sqrt(mean(jupiter_pre_covid_model$residuals^2))
boca_post_covid_rmse
#[1] 0.1798423





# Creating a data frame for coefficients
coefficients_table <- data.frame(
  Variable = c("Intercept", "Lot.Size.z", "Total.SQFT.100", "Bed", 
               "Full.Bath3", "Full.Bath4", "Full.Bath5", "Full.Bath6", "Full.Bath2"),
  Jupiter_Pre_COVID = c(
    jupiter_pre_covid_coefficients["(Intercept)", "Estimate"],
    jupiter_pre_covid_coefficients["Lot.Size.z", "Estimate"],
    jupiter_pre_covid_coefficients["Total.SQFT.100", "Estimate"],
    jupiter_pre_covid_coefficients["Bed", "Estimate"],
    jupiter_pre_covid_coefficients["as.factor(Full.Bath)3", "Estimate"],
    jupiter_pre_covid_coefficients["as.factor(Full.Bath)4", "Estimate"],
    jupiter_pre_covid_coefficients["as.factor(Full.Bath)5", "Estimate"],
    jupiter_pre_covid_coefficients["as.factor(Full.Bath)6", "Estimate"],
    NA
  ),
  Jupiter_Post_COVID = c(
    jupiter_post_covid_coefficients["(Intercept)", "Estimate"],
    jupiter_post_covid_coefficients["Lot.Size.z", "Estimate"],
    jupiter_post_covid_coefficients["Total.SQFT.100", "Estimate"],
    jupiter_post_covid_coefficients["Bed", "Estimate"],
    jupiter_post_covid_coefficients["as.factor(Full.Bath)3", "Estimate"],
    jupiter_post_covid_coefficients["as.factor(Full.Bath)4", "Estimate"],
    jupiter_post_covid_coefficients["as.factor(Full.Bath)5", "Estimate"],
    NA,
    NA
  ),
  Boca_Pre_COVID = c(
    boca_pre_covid_coefficients["(Intercept)", "Estimate"],
    boca_pre_covid_coefficients["Lot.Size.z", "Estimate"],
    boca_pre_covid_coefficients["Total.SQFT.100", "Estimate"],
    boca_pre_covid_coefficients["Bed", "Estimate"],
    boca_pre_covid_coefficients["as.factor(Full.Bath)3", "Estimate"],
    boca_pre_covid_coefficients["as.factor(Full.Bath)4", "Estimate"],
    NA,
    NA,
    NA
  ),
  Boca_Post_COVID = c(
    boca_post_covid_coefficients["(Intercept)", "Estimate"],
    boca_post_covid_coefficients["Lot.Size.z", "Estimate"],
    boca_post_covid_coefficients["Total.SQFT.100", "Estimate"],
    boca_post_covid_coefficients["Bed", "Estimate"],
    NA,
    boca_post_covid_coefficients["as.factor(Full.Bath)4", "Estimate"],
    boca_post_covid_coefficients["as.factor(Full.Bath)5", "Estimate"],
    boca_post_covid_coefficients["as.factor(Full.Bath)6", "Estimate"],
    boca_post_covid_coefficients["as.factor(Full.Bath)2", "Estimate"]
  )
)

cat("Coefficients Table:\n")
print(coefficients_table)

# Creating a data frame for model metrics
metrics_table <- data.frame(
  Metric = c("Adjusted R-squared", "RMSE"),
  Jupiter_Pre_COVID = c(jupiter_pre_covid_adjusted_r_squared, jupiter_pre_covid_rmse),
  Jupiter_Post_COVID = c(jupiter_post_covid_adjusted_r_squared, jupiter_post_covid_rmse),
  Boca_Pre_COVID = c(boca_pre_covid_adjusted_r_squared, boca_pre_covid_rmse),
  Boca_Post_COVID = c(boca_post_covid_adjusted_r_squared, boca_post_covid_rmse)
)

cat("\nModel Metrics Table:\n")
print(metrics_table)





#Creating Visuals 
library(ggplot2)
library(dplyr)


#Jupiter Data
jupitersales_data <- read.csv("jupitersales.csv")

jupitersales_data$Sale.Date <- as.Date(jupitersales_data$Sale.Date, format = "%m/%d/%y")

ggplot(jupitersales_data, aes(x = Sale.Date, y = Sale.Price)) +
  geom_line(color = "blue") +
  labs(title = "Jupiter Sales Prices Over Time",
       x = "Sale Date",
       y = "Sale Price") +
  theme_minimal() +
  scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
  scale_y_continuous(breaks = seq(0, max(jupitersales_data$Sale.Price), by = 100000),
                     labels = function(x) paste0("$", format(x / 1000, big.mark = ",", trim = TRUE), "K")) +
  theme(text = element_text(family = "Times New Roman"),
        axis.text.y = element_text(size = 5),
        panel.grid.minor = element_blank())  # Remove major gridlines



#Boca Data 
bocasales_data <- read.csv("bocasales.csv")

bocasales_data$Sale.Date <- as.Date(bocasales_data$Sale.Date, format = "%m/%d/%y")

ggplot(bocasales_data, aes(x = Sale.Date, y = Sale.Price)) +
  geom_line(color = "darkgreen") +
  labs(title = "Boca Raton Sales Prices Over Time",
       x = "Sale Date",
       y = "Sale Price") +
  theme_minimal() +
  scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
  scale_y_continuous(breaks = seq(0, max(bocasales_data$Sale.Price), by = 100000),
                     labels = function(x) paste0("$", format(x / 1000, big.mark = ",", trim = TRUE), "K")) +
  theme(text = element_text(family = "Times New Roman"),
        axis.text.y = element_text(size = 7),
        panel.grid.minor = element_blank())  # Remove major gridlines


