library(rvest)
library(dplyr)

# Find links
page <- read_html("http://uppsala.hittaochjamfor.se/Comparison/Index/1")
schools <- html_nodes(page, ".object-link")
links <- html_attr(schools, "href")
links <- paste("http://uppsala.hittaochjamfor.se", links, sep="")

# Create empty list (not data.frame)
schoolStats <- data.frame(Var.1=character(18))

# Loop through links and combine in list
#schoolStats <- sapply(links, . %>% read_html() %>% html_table())

get_table <- function(link) {
  link %>%
    read_html() %>%
    html_table()
}

results <- sapply(links, get_table)


# Save as file in working directory
saveRDS(schoolStats, "schoolStats.rda")
