#' ---
#' title: "Chrsitams Tree"
#' author: "Yohan"
#' output:
#'   html_document:
#'     toc: true
#'     keep_md: true
#' ---


ChristmasTree <- read.csv("https://raw.githubusercontent.com/t-redactyl/Blog-posts/master/Christmas%20tree%20base%20data.csv")

names(ChristmasTree)[1] <- "Tree.X"
save(ChristmasTree, file = "ChristmasTree.Rdata")

library(ggplot2)
tree <- ggplot() +
  geom_tile(data = ChristmasTree, aes(x = Tree.X, y = Tree.Y, fill = Tree.Colour)) +
  scale_fill_identity() +
  theme_bw() +
  scale_x_continuous(breaks = NULL) +
  scale_y_continuous(breaks = NULL) +
  labs(x = "Best wihses for 2019 - Yohan", y = "")

Desired.Lights <- 50
Total.Lights <- sum(round(Desired.Lights * 0.35) + round(Desired.Lights * 0.20) +
                      round(Desired.Lights * 0.17) + round(Desired.Lights * 0.13) +
                      round(Desired.Lights * 0.10) + round(Desired.Lights * 0.05))

Lights <- data.frame(Lights.X = c(
  round(runif(round(Desired.Lights * 0.35), 4, 18), 0),
  round(runif(round(Desired.Lights * 0.20), 5, 17), 0),
  round(runif(round(Desired.Lights * 0.17), 6, 16), 0),
  round(runif(round(Desired.Lights * 0.13), 7, 15), 0),
  round(runif(round(Desired.Lights * 0.10), 8, 14), 0),
  round(runif(round(Desired.Lights * 0.05), 10, 12), 0)
))
Lights$Lights.Y <- c(
  round(runif(round(Desired.Lights * 0.35), 4, 6), 0),
  round(runif(round(Desired.Lights * 0.20), 7, 8), 0),
  round(runif(round(Desired.Lights * 0.17), 9, 10), 0),
  round(runif(round(Desired.Lights * 0.13), 11, 12), 0),
  round(runif(round(Desired.Lights * 0.10), 13, 14), 0),
  round(runif(round(Desired.Lights * 0.05), 15, 17), 0)
)
Lights$Lights.Colour <- c(round(runif(Total.Lights, 1, 4), 0))

tree <- tree +
  geom_point(
    data = Lights, aes(x = Lights.X, y = Lights.Y, alpha = Lights.Colour),
    colour = "lightgoldenrodyellow", shape = 16
  ) +
  theme(legend.position = "none")

Baubles <- data.frame(Bauble.X = c(
  6, 9, 15, 17, 5, 13, 16, 7, 10, 14, 7, 9, 11,
  14, 8, 14, 9, 12, 11, 12, 14, 11, 17, 10
))
Baubles$Bauble.Y <- c(
  4, 5, 4, 4, 5, 5, 5, 6, 6, 6, 8, 8, 8, 8, 10,
  10, 11, 11, 12, 13, 10, 16, 7, 14
)
Baubles$Bauble.Colour <- factor(c(
  1, 2, 2, 3, 2, 3, 1, 3, 1, 1, 1, 2, 1, 2,
  3, 3, 2, 1, 3, 2, 1, 3, 3, 1
))
Baubles$Bauble.Size <- c(
  1, 3, 1, 1, 2, 1, 2, 2, 2, 1, 1, 1, 3, 3, 3,
  2, 3, 1, 1, 2, 2, 3, 3, 2
)



tree <- tree +
  geom_point(
    data = Baubles, aes(
      x = Bauble.X, y = Bauble.Y,
      colour = Bauble.Colour, size = Bauble.Size
    ),
    shape = 16
  ) +
  scale_colour_manual(values = c("firebrick2", "gold", "dodgerblue3")) +
  scale_size_area(max_size = 12)

tree <- tree +
  geom_segment(aes(x = 2.5, xend = 4.5, y = 1.5, yend = 1.5), colour = "blueviolet", size = 2) +
  geom_segment(aes(x = 5.5, xend = 8.5, y = 1.5, yend = 1.5), colour = "dodgerblue3", size = 2) +
  geom_segment(aes(x = 13.5, xend = 16.5, y = 1.5, yend = 1.5), colour = "blueviolet", size = 2) +
  geom_segment(aes(x = 17.5, xend = 19.5, y = 1.5, yend = 1.5), colour = "dodgerblue3", size = 2) +
  geom_segment(aes(x = 3.5, xend = 3.5, y = 0.5, yend = 2.5), colour = "blueviolet", size = 2) +
  geom_segment(aes(x = 7.0, xend = 7.0, y = 0.5, yend = 2.5), colour = "dodgerblue3", size = 2) +
  geom_segment(aes(x = 15.0, xend = 15.0, y = 0.5, yend = 2.5), colour = "blueviolet", size = 2) +
  geom_segment(aes(x = 18.5, xend = 18.5, y = 0.5, yend = 2.5), colour = "dodgerblue3", size = 2)

# library(extrafont)
# font_import()
# loadfonts()

tree1 <- tree +
  annotate("text",
           x = 11, y = 20, label = "Happy New Year!",
           family = "Luminari", size = 12
  )

tree1
