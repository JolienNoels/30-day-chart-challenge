
# 0 Packages --------------------------------------------------------------

library(tidyverse)
library(here)
library(treemapify)
library(MetBrewer)

# 1 Global ----------------------------------------------------------------

motherdir <- here("2022")
dir_data <- here("2022/data")


# 2 Data ------------------------------------------------------------------

data <- readxl::read_excel(fs::path(dir_data, "ghgs.xlsx")) 

# 3 Graph -----------------------------------------------------------------

ggplot(data, aes(
  area = consumed, label = consumer_sector, 
  fill = msector, subgroup = msector)
  )+
  geom_treemap(linetype = "solid", color = "white") +
  geom_treemap_text(color= "white",
                    place = "centre",
                    size = 12,
                    min.size = 12,
                    fontface = "bold",
                    family = 'Noto Sans') +
  geom_treemap_subgroup_border(colour = "white", size = 5) +
  geom_treemap_subgroup_text(place = "centre", grow = TRUE,
                             alpha = 0.25, colour = "white",
                             fontface = "italic") +
  theme(legend.position = "None") +
  scale_fill_manual(values=met.brewer("Greek", 6))

  
  