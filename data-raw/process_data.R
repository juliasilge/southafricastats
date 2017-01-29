## This is the script used to clean/process the data downloaded from
## http://southafrica.opendataforafrica.org/


# mortality dataset ----------------------------------------------

library(readr)
library(dplyr)
mortality <- read_csv("data-raw/ObservationData_cgjxleg.csv") %>%
    select(-Unit)

colnames(mortality) <- c("province", "indicator", "year", "deaths")

## HIV indicator was missing a paranthesis

mortality <- mortality %>%
    mutate(indicator = ifelse(indicator == "Human immunodeficiency virus [HIV] disease (B20-B24",
                              "Human immunodeficiency virus [HIV] disease (B20-B24)",
                              indicator))

devtools::use_data(mortality, overwrite = TRUE)


# population dataset ---------------------------------------------

population <- read_csv("data-raw/ObservationData_eizxauf.csv") %>%
    select(-variable, -sex, -Unit)

colnames(population) <- c("province", "year", "total")

## lat/long came from Google Maps

population <- population %>%
    left_join(data_frame(province = c("Eastern Cape",
                                      "Free State",
                                      "Gauteng",
                                      "KwaZulu-Natal",
                                      "Limpopo",
                                      "Mpumalanga",
                                      "North West",
                                      "Northern Cape",
                                      "Western Cape"),
                         longitude = c(24.2167723,
                                       25.9420703,
                                       27.5655893,
                                       29.7584324,
                                       28.0218516,
                                       29.0146982,
                                       24.3398679,
                                       18.7520103,
                                       18.7415639),
                         latitude = c(-32.087855,
                                      -28.6767688,
                                      -26.0088312,
                                      -28.9402347,
                                      -23.7698437,
                                      -25.7393817,
                                      -26.3705378,
                                      -28.8367726,
                                      -32.6116087))) %>%
    select(province, longitude, latitude, everything())

devtools::use_data(population, overwrite = TRUE)
