# Data

The CSV files come from the [FIFA World Cup dataset on Kaggle](https://www.kaggle.com/datasets/abecklas/fifa-world-cup).

`WorldCupMatches.csv` contains 4,572 data rows, including 3,720 blank rows and 16 duplicate 2014 match records. The SQL cleaning view removes blank records and deduplicates on `MatchID`, producing 836 unique matches.

The source data covers tournaments from 1930 to 2014. Dataset rights remain with the original publisher; the project's code and documentation do not change those terms.
