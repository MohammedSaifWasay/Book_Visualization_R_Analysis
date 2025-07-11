# 📚Exploring Data Visualizations in R for Book Data

---

## 🔍 Introduction and Key Findings

This project explores techniques for creating effective visualizations using a **Books** dataset. The dataset was used to investigate statistical concepts including samples, populations, measures of dispersion, and central tendency, alongside visual representation.

The project is divided into two main parts:

---

## 🧱 Part 1: Data Cleaning and Preprocessing

1. **Data Import and Cleanup**
   - Data was loaded with attention to making column names R-friendly.
   - Date processing functions like `mdy()` and `year()` from the `lubridate` package were used to extract meaningful time-based features.

2. **Filtering and Column Selection**
   - Books published between 1990 and 2020 were selected.
   - Records with more than 1200 pages were removed.
   - Only relevant columns for the visual analysis were retained.

---

## 📊 Part 2: Data Visualization in R

- **Histogram of Ratings:**  
  Displayed distribution of book ratings. Found to be normally distributed between 1990 and 2020.

- **Box Plot of Number of Pages:**  
  Visualized that 50% of books fell within the 200–400 page range.

- **Publisher Frequency Table & Pareto Analysis:**  
  Identified publishers with at least 250 books and calculated cumulative and relative frequencies.

- **Scatter Plot – Pages vs. Rating:**  
  Explored relationship between number of pages and book rating.

- **Yearly Trends:**  
  Generated a dataset for yearly book counts and average ratings. Plotted to identify trends over time.

- **Descriptive Statistics with Sampling:**
  - Developed custom functions to calculate mean, variance, and standard deviation.
  - Created 3 samples to compare their statistics with the overall dataset.

- **Publisher Analysis by Book Format:**
  - Visualized publisher data by format (paperback, hardcover, etc.).
  - Calculated min, max, and average ratings per format.
  - Observed Random House as the only mass market paperback publisher.

---

## ✅ Conclusion & Recommendations

- R offers strong capabilities for data cleaning, transformation, and visualization.
- Visual analysis confirmed a **normal distribution** of ratings and provided insights into publication trends.
- Sampling reinforced the consistency of statistics across subsets.
- Most books were paperback, followed by hardcover.
- Random House was uniquely positioned in publishing mass market paperbacks.

---

## 📚 References

- R Documentation. Retrieved from: [https://cran.r-project.org/doc/manuals/r-release/R-intro.html](https://cran.r-project.org/doc/manuals/r-release/R-intro.html)
- Albusairi, F. (2023). *Mastering Simple R Visualizations: From Scatter Plots to Heat Maps*. [LinkedIn](https://www.linkedin.com/pulse/mastering-simple-r-visualizations-from-scatterplots-heat-albusairi/)
- Goodreads Dataset: [https://www.goodreads.com](https://www.goodreads.com)
## 🧠 Author

**Mohammed Saif Wasay**  
*Data Analytics Graduate — Northeastern University*  
*Machine Learning Enthusiast | Passionate about turning data into insights*

🔗 [Connect with me on LinkedIn](https://www.linkedin.com/in/mohammed-saif-wasay-4b3b64199/)
