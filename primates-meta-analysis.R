# Meta Analysis Assignment EDS 216

# attachments
library(tidyverse)
library(here)
library(metafor)
library(janitor)

# read in Gardner csv data on primates
g_primates <- read_csv(here::here("gardner-primates.csv")) %>% 
  janitor::clean_names()

# stats and metrics
g_primates_stats <- g_primates %>% 
  mutate(meandiff = (meanvalueat_high_fauna - meanvalueat_low_fauna)) %>% 
  mutate(spool = sqrt(
    (((high_fauna_n - 1) * (s_dat_high_fauna^2)) + ((low_fauna_n - 1) * (s_dat_low_fauna^2))) 
    / ((high_fauna_n - 1) + (low_fauna_n - 1)) )) %>% 
  mutate(se_md = (spool * sqrt(((1/high_fauna_n) + (1/low_fauna_n))))) %>% 
  mutate(smd = (meandiff / spool)) %>% 
  mutate (j = 1 - (3 / (4 * (high_fauna_n + low_fauna_n - 2) -1))) %>% 
  mutate(g = (smd * j)) %>% 
  mutate(se_g = sqrt(
    ((high_fauna_n + low_fauna_n) / (high_fauna_n * low_fauna_n)) +
      ((g ^ 2) / (2 * (high_fauna_n + low_fauna_n)))
  ))

