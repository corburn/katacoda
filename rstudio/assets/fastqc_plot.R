install.packages(c(
  "tidyverse",
  "viridis",
  "broom"
))

library(tidyverse) # Load all "tidyverse" libraries.
library(viridis)   # Viridis color scale.

bigtab <- read_csv("r-more-files/fastqc.csv")

y_order <- sort(unique(bigtab$test), decreasing=T)  # y axis plots from bottom to top, so reverse
bigtab$test <- factor(bigtab$test, levels=y_order)

x_order <- unique(bigtab$file)
bigtab$file <- factor(bigtab$file, levels=x_order)

color_order <- c("FAIL", "WARN", "PASS")
bigtab$grade <- factor(bigtab$grade, levels=color_order)

myplot <- ggplot(bigtab, aes(x=file, y=test, fill=grade)) + 
    geom_tile(color="black", size=0.5) +           # Black border on tiles
    scale_fill_manual(                             # Colors, as color hex codes
        values=c("#ee0000","#ffee00","#00aa00")) +
    labs(x="", y="", fill="") +                    # Remove axis labels
    coord_fixed() +                                # Square tiles
    theme_minimal() +                              # Minimal theme, no grey background
    theme(panel.grid=element_blank(),              # No underlying grid lines
          axis.text.x=element_text(                # Vertical text on x axis
              angle=90,vjust=0.5,hjust=0))              
myplot
