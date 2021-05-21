




###################################
####        BIOSTAT 2          ####
###################################

####################################
######   Lars was here     #######
####################################

# To set directory to the project directory:
library(here)
here("data", "biomass2015.xls")

# Loading libraries
library("tidyverse")
library(readxl)

# Importing excel file - first give it a new name?
bioFile <- "biomass2015.xls"
excel_sheets(path = bioFile)

# Site L
biomassL <- read_excel(path = bioFile, sheet = "Site L")
biomassL

# Site M
biomassM <- read_excel(path = bioFile, sheet = "Site M")
biomassM

# Site A
biomassA <- read_excel(path = bioFile, sheet = "Site A")
biomassA

# Site H
biomassH <- read_excel(path = bioFile, sheet = "Site H")
biomassH






# Editing the data frame, need to extract production & plot: 
# Plant biomass data for alpine grasslands on Gongga Mountain, China. 4 sites with 20 plots.
# For each species in each plot, the following are recorded:
#  - height up to ten times (H1-H10)
#  - Biomass (labelled production)
#  - Cover
# Find the total biomass per plot, and present the results in a figure.

view(biomassL)

# Selecting biomass and plot:
bioL <- biomassL %>% 
  select(production, plot, site)
view(bioL)

bioM <- biomassM %>% 
  select(production, plot, site)

bioA <- biomassA %>% 
  select(production, plot, site)

bioH <- biomassH %>% 
  select(production, plot, site)

# Changing column names:
bioL %>% rename(Biomass = production)
bioM %>% rename(Biomass = production)
bioA %>% rename(Biomass = production)
bioH %>% rename(Biomass = production)


# summarise the same plots, but also combine the dataframes:
# dplyr Combining dataset using dplyr::full_join(df1, df2)
halv <- dplyr::full_join(bioL, bioM)
view(halv)
tredje <- dplyr::full_join(halv, bioA)
view(tredje)
siste <- dplyr::full_join(tredje, bioH)
view(siste)


# dplyr group_by
#sortert <- siste %>% 
#  dplyr::group_by(site)
#view(sortert)

#lol1 <- siste %>% group_by(site) %>% summarise(production)
#view(lol1)


#summarizing production:


#plotting by site (x = site y = production)
plot1 <- ggplot(data = siste, aes(site, production))+
  geom_boxplot()
plot1












