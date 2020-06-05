# carbulate hex sticker
# https://github.com/paukes/d13carbulate

library(d13carbulate)
library(carbulate)
library(tidyverse)
library(hexSticker)
library(showtext)
font_add_google("Baloo 2") # https://fonts.google.com

# make data for the Bjerrum plot

df <- data.frame(DIC_mgC.L = 1, pH = seq(0.1,14,0.1), Temp_C = 20, 'pressure_kPa' = 101.325, 'd13C_DIC' = 0)

df <- carbulate(df, 'DIC_mgC.L', 'pH', 'Temp_C', 'pressure_kPa')

df <- d13carbulate(df, 'Temp_C', 'd13C_DIC', 'DIC_mgC.L', 'calc_CO3_uM', 'calc_HCO3_uM', 'calc_CO2_uM')

df_long <- df %>% select(pH, contains("permille")) %>% 
  pivot_longer(cols = contains("permille"), 
               names_to = "species", values_to = "permille")

# make Bjerrum plot

x <- ggplot(df_long, aes(x = pH, y = permille, colour = species)) +
  geom_line(size = 1, show = FALSE) +
  scale_colour_viridis_d() +
  scale_x_continuous(limits = c(0, 14))

x <- x +
  theme_void() +
  theme_transparent() +
  theme(legend.position="none")

# make sticker

sticker(x,
        package = "d13carbulate",
        h_fill = "orange", h_color = "lightblue", h_size = 1.5,
        p_color = "#000000", p_y = 1.5, p_size = 14,  p_family = "Baloo 2",
        s_width = 1, s_height = 0.8, s_x = 1, s_y = 0.9,
        url = "github.com/biogeochem/d13carbulate", u_size = 4,
        filename = "output/d13carbulate.png")
