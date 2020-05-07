library(tidyverse)

x <- data.frame(
  Family=c(1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6),
  Siblings=c("Daniel", "Mia", "Brent", "Kyle", "Benito", "Oscar", "Samuel", "Kendra", "Lani", "Leo", "Bryce", "Melvin"),
  Older=factor(c(1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2), labels=c("Older", "Younger")),
  Insertions=c(0.0714, 0.0435, 0.0984, 0.1695, 0.1475, 0.5161, 0.0702, 0.1493, 0.656, 0.580, 0.0714, 0.0645)
  )



ggplot(x, aes(Insertions, Family)) +
  geom_line(aes(group = Family)) +
  geom_point(aes(color = Older)) +
  scale_y_continuous(trans = "reverse", breaks = unique(x$Family)) +
  scale_x_continuous(labels = scales::percent) +
  ggtitle("Presence of English Lexical Insertions in Clauses")
