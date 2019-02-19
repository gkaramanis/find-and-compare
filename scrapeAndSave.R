library(rvest)
library(dplyr)

# Find links
page <- read_html("http://uppsala.hittaochjamfor.se/Comparison/Index/1")
schools <- html_nodes(page, ".object-link")
links <- html_attr(schools, "href")
links <- paste("http://uppsala.hittaochjamfor.se", links, sep="")

# Create empty list (not data.frame)
tables <- data.frame(Var.1=character(18))

# Loop through links and combine in dataframe
#schoolStats <- sapply(links, . %>% read_html() %>% html_table())
get_table <- function(link) {
  link %>%
    read_html() %>%
    html_table()
}

tables <- sapply(links, get_table)
n1 <- max(sapply(tables, nrow))
schoolStats <- data.frame(lapply(schoolStats,  function(x) x[seq_len(n1),]))

# Save as file in working directory
saveRDS(schoolStats, "schoolStats.rda")
