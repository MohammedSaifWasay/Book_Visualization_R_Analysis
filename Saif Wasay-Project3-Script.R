#Mohammed Saif Wasay 
#NUID: 002815958
#January 30th 2024

#Loading Libraries
library(pacman)
p_load(tidyverse)
library(dplyr)
library(readxl)
#Reading Dataset
books <- read.csv("data/books.csv")
head(books,5)

#Cleaning Dataset
#Problem 1
p_load(janitor)
books <- clean_names(books)
names(books)

#Problem 2
p_load(lubridate)
books <- mutate(books, first_publish_date = mdy(first_publish_date))

#Problem 3
books <- mutate(books, year = year(first_publish_date))

#Problem 4
books <- filter(books, year >= 1990 & year <= 2020)

#Problem 5
books <- subset(books, select = -c(publish_date, edition, characters, price, genres, setting, isbn))

#Problem 6
books <- filter(books, pages < 1200)
books

#Data Analysis
#Problem 1
glimpse(books)

#Problem 2
summary(books)

#Problem 3
rating_hist <- ggplot(books, aes(rating)) + geom_histogram(binwidth = 0.25, fill = "red") + 
  theme_bw() + labs(title = "Histogram of Book Ratings", x = "Rating", y = "Number of Books")
rating_hist

#Problem 4
p_load(ggthemes)
pages_box <- ggplot(books, aes(pages)) +
  geom_boxplot(fill = "magenta") +
  theme_economist() +
  labs(title = "Box Plot of Page Counts", x = "Pages")
pages_box

#Problem 5
book_publishers <- books %>% group_by(publisher) %>% 
                      summarise(total_books = n()) %>%
                      drop_na(publisher) %>%
                      arrange(desc(total_books)) %>%  
                      filter(total_books >= 250) %>% 
                      mutate(publisher = as.factor(publisher)) %>%
                      mutate(cum_count = cumsum(total_books)) %>%
                      mutate(rel_freq = total_books/sum(total_books)) %>%
                      mutate(cum_freq = cumsum(rel_freq)) %>% 
                      select(publisher, total_books, cum_count, rel_freq, cum_freq)
book_publishers

#Problem 6
p_load(ggeasy)
pub_book_bar <- ggplot(book_publishers, aes(x = reorder(publisher, -total_books), y = total_books)) + 
  geom_bar(stat = "identity", fill = "cyan") + theme_clean() +
  labs(title = "Pareto and Ogive of Publisher Book Counts (1990 - 2020)", x = "Publisher", y = "Number of Books") +
  geom_line( aes( y = cum_count, group = 1 ), color = "black") + geom_point( aes ( y=cum_count ), color = "black") +
  easy_rotate_x_labels(angle = 45, side = "right")
pub_book_bar

#Problem 7
scater_pg_rt <- ggplot(books, aes(x = pages, y = rating, color = year)) +
  geom_point() +
  labs(title = "Scatter Plot of Pages vs. Rating", x = "Pages", y = "Rating") +
  theme_tufte()
scater_pg_rt

#Problem 8
by_year <- books %>% group_by(year) %>% summarise(total_books = n(),
                                               avg_rating = mean(rating)) %>%
                                        select(year, total_books, avg_rating)
by_year

#Problem 9
line_plt <- ggplot(by_year, aes (x = year, y = total_books, color = avg_rating)) + 
  geom_point(aes(size = avg_rating)) + 
  geom_line() + 
  labs(x = "Year", y = "Number of Books", title = "Total Number of Books Rated Per Year ") + 
  theme_excel_new()
line_plt

#Problem 10
average <- function(r){
  sum(r)/length(r)
}

pop_var <- function(r){
  out_vector = c()
  for (i in r){
    result = (i - average(r))**2
    out_vector = c(out_vector, result)
  }
  sum(out_vector)/length(r)
}

sd_var <- function(r){
  sqrt(abs(pop_var(r)))
}

#Problem 11
book_rating <- data.frame(avg_rating = average(books$rating),
variance = pop_var(books$rating),
sd = sd_var(books$rating))
book_rating

#Problem 12
sample_1 <- sample_n(books, 100)
sample_2 <- sample_n(books, 100)
sample_3 <- sample_n(books, 100)

sample_1_rating <- data.frame(avg_rating = average(sample_1$rating),
                          variance = pop_var(sample_1$rating),
                          sd = sd_var(sample_1$rating))
sample_1_rating

sample_2_rating <- data.frame(avg_rating = average(sample_2$rating),
                          variance = pop_var(sample_2$rating),
                          sd = sd_var(sample_2$rating))
sample_2_rating

sample_3_rating <- data.frame(avg_rating = average(sample_3$rating),
                          variance = pop_var(sample_3$rating),
                          sd = sd_var(sample_3$rating))
sample_3_rating

#Problem 13
#Creating a dataframe with Publisher information for different book formats and average rating, minimum and maximum rating

by_publisher <- books %>% group_by(publisher, book_format) %>% summarise(total_books = n(),
                                                  avg_rating = mean(rating),
                                                  min_rating = min(rating),
                                                  max_rating = max(rating)) %>%
                          drop_na(publisher) %>%
                          arrange(desc(total_books)) %>%
                          filter(total_books >= 200)
by_publisher

#Plotting Number of Books and Average Rating
scater_bks_rt <- ggplot(by_publisher, aes(x = total_books, y = avg_rating, color = publisher)) +
  geom_point() +
  labs(title = "Scatter Plot of Books vs. Average Rating", x = "Total Books", y = "Average Rating") +
  theme_tufte()
scater_bks_rt

#Plotting Book format Distributed by Publisher
pub_bks_format <- ggplot(by_publisher, aes(x = reorder(publisher, -total_books), y = total_books, fill = book_format)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Book Format Distribution by Publisher",
    x = "Publisher",
    y = "Total Books",
    fill = "Book Format"
  ) +
  theme_minimal()
pub_bks_format

