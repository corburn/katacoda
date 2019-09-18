curl -q -LO https://monashbioinformaticsplatform.github.io/r-more/r-more-files.zip
unzip r-more-files.zip
docker run --rm -p 8787:8787 -v $PWD/r-more-files:/home/rstudio/r-more-files -e ROOT=TRUE -e DISABLE_AUTH=true rocker/tidyverse
