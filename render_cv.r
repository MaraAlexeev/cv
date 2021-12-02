# This script builds both the HTML and PDF versions of your CV

# If you wanted to speed up rendering for googlesheets driven CVs you could use
# this script to cache a version of the CV_Printer class with data already
# loaded and load the cached version in the .Rmd instead of re-fetching it twice
# for the HTML and PDF rendering. This exercise is left to the reader.

# Knit the HTML version
rmarkdown::render("maras_cv.Rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = "./docs/index.html")

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("maras_cv.Rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = "./docs/Mara_Alexeev_public_cv.pdf")

### 
# For different versions of CV

# Knit the HTML version
rmarkdown::render("maras_cv.Rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = "./docs/mara_cv.html")

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("maras_cv.Rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = "./docs/mara_cv.pdf")

######
#For Long form CV
# Knit the HTML version
rmarkdown::render("MaraAlexeev_LongFormCV.Rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = "./final_cvs/MaraAlexeev_LongFormCV.html")

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("MaraAlexeev_LongFormCV.Rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = "./final_cvs/MaraAlexeev_LongFormCV.pdf")
