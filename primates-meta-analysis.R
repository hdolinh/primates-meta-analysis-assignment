# Meta Analysis Assignment EDS 216

# attachments
library(tidyverse)
library(here)
library(metafor)

# read in Gardner csv data on primates
g_primates <- read_csv(here::here("gardner-primates.csv"))

