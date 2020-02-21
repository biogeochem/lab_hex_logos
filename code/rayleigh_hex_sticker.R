# carbulate hex sticker
# https://github.com/biogeochem/rayleigh

library(carbulate)
library(tidyverse)
library(hexSticker)
library(rayleigh)
library(showtext)
font_add_google("Fira Mono") # https://fonts.google.com

# make Rayleigh

x <- plot_rayleigh(calc_rayleigh(-20, -15)) +
  theme_void() +
  theme_transparent() +
  theme(legend.position="none")

# make two stickers

sticker(x,
        package = "rayleigh",
        h_fill = "#FFFFFF", h_color = "#000000", h_size = 1.5,
        p_color = "#000000", p_size = 8,  p_family = "Fira Mono",
        s_width = 1, s_height = 0.8, s_x = 1,
        filename = "output/rayleigh_small.png", dpi = 100)

sticker(x,
        package = "rayleigh",
        h_fill = "#FFFFFF", h_color = "#000000", h_size = 1.5,
        p_color = "#000000", p_size = 18,  p_family = "Fira Mono",
        s_width = 1, s_height = 0.8, s_x = 1,
        url = "github.com/biogeochem/rayleigh", u_size = 4.5,
        filename = "output/rayleigh.png")
