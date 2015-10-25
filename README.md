
# Budget 2015 hackathon

1. Scrape the pdf files from the budget website
2. Convert pdf files to plain text using PDFMiner
3. Chinese text segmentation using jieba in Python
4. Display the differences between the vocabs in each budget pdf using
   a frontend written in R shiny.


# Requirement

Under Python,

1. PDFMiner
2. Pandas
3. jieba


```
pip install PDFMiner
pip install jieba
pip install pandas
```

Under R,

1. shiny
2. dplyr

```
install.packages('shiny')
install.packages('dplyr')
```

You will also need GNU make in order to run this code.


# Running the program

After you have cloned the repository,

1. `make download` downloads the pdf and
2. `make wordseg` performs text segmentation by jieba.
3. `make shiny` generates the shiny web frontend in R.

`make all` combines the above all three.
