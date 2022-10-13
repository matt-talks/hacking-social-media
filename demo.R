library(quanteda)
library(quanteda.textplots)
library(ggplot2)
library(dplyr)

tokeninfo <- summary(data_corpus_inaugural)

ggplot(data = tokeninfo,
       aes(x = Year, y = Tokens, group = 1)) +
  geom_line() +
  geom_point() +
  scale_x_continuous(labels = c(seq(1789,
                                    2017, 12)), breaks = seq(1789, 2017, 12)) +
  ggtitle("Number of Tokens in Inaugural Speeches of American Presidents") +
  theme_bw()


dfm_inaug <- corpus_subset(data_corpus_inaugural, Year <= 1826) %>%
  dfm(remove = stopwords('english'), remove_punct = TRUE) %>%
  dfm_trim(min_termfreq = 10, verbose = FALSE)

set.seed(100)
textplot_wordcloud(dfm_inaug)

