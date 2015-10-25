import re
import pandas as pd
import jieba
import csv
pd.options.display.max_rows = 999


def cleanData(instring):
    # take away numbers and line return
    return re.sub('[0-9]', '', instring).replace('\n', '.')


def cleanResult(inSeries):
    return inSeries


def processOneFile(year, currentNumber):
    filename = 'parsed/chead'+currentNumber+"_"+year+".txt"
    with open(filename, "r") as myfile:
        alldata = cleanData(myfile.read().replace(' ', '').replace('.', ''))
    return cleanResult(pd.Series(jieba.cut_for_search(alldata))).value_counts()


def processOneCategory(currentNumber):
    all_value_counts = dict()
    for year in ['2014', '2015']:
        all_value_counts[year] = processOneFile(year, currentNumber)
    yearcombined = pd.concat(all_value_counts, axis=1).fillna(0)
    return(yearcombined)


with open("pdflist.txt") as f:
    pdfnumbers = f.readlines()
pdfnumbers = [i.replace('\n', '') for i in pdfnumbers] 

# Process each file one by one
for currentNumber in pdfnumbers:
    print(currentNumber)
    result = processOneCategory(currentNumber)
    result.to_csv("output/"+currentNumber+".csv",
                  encoding="utf-8",
                  quoting=csv.QUOTE_NONNUMERIC)
