
# 0 Packages --------------------------------------------------------------

library(tidyverse)
library(here)
library(treemapify)
library(MetBrewer)

# 1 Global ----------------------------------------------------------------

motherdir <- here("2022")
dir_data <- here("2022/data")
dir_fig <- here("2022/figures")

# 2 Data ------------------------------------------------------------------

data <- readxl::read_excel(fs::path(dir_data, "ghgs.xlsx")) 

# 3 Graph -----------------------------------------------------------------

ggplot(data, aes(
  area = emissions, label = subsector, 
  fill = sector, subgroup = sector)
  )+
  geom_treemap(linetype = "solid", color = "white") +
  geom_treemap_text(color= "white",
                    place = "centre",
                    size = 12,
                    min.size = 12,
                    fontface = "bold",
                    family = 'Noto Sans') +
  geom_treemap_subgroup_border(colour = "#ece3d9", size = 5) +
  geom_treemap_subgroup_text(place = "centre", grow = TRUE,
                             alpha = 0.25, colour = "white",
                             fontface = "italic") +
  labs(
    title = "Greenhouse gas emissions, sectoral contributions, 2018\n",
    caption = "\nData: Lamb et al. (2021). Graph: Jolien Noels.",
  ) +
  scale_fill_manual(values=met.brewer("Greek", 6)) +
  theme(
    legend.position = "None",
    plot.title = element_text(size = 30, colour = "#3E0100"),
    plot.margin = margin(0.5, 0.5, 0.5, 0.5, "cm"),
    plot.background = element_rect(fill = "#ece3d9")
  ) +
  ggeasy::easy_center_title()


ggsave(
  fs::path(dir_fig, "ghgs.png"),
  height = 18, width = 30, units = "cm"
)
  
  