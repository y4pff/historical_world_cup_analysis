# ⚽ Historical FIFA World Cup Performance Analysis (1930–2014)

## **Status:** 🚧 In Progress

Current Progress:
- ✅ Database created
- ✅ Data imported
- ✅ Data exploration completed
- 🚧 Team performance analysis in progress
- ⏳ Python visualisations
- ⏳ Dashboard

## Overview

This project analyses historical FIFA World Cup data using SQL Server and Python to identify long-term performance trends, compare national teams, and explore England's World Cup history.

The project demonstrates end-to-end data analysis, including database creation, data import, SQL querying, data exploration, and visualisation.

---

## Objectives

This project aims to answer questions such as:

- Which countries have played the most World Cup matches?
- Which teams have the highest win percentage?
- Which countries have scored the most goals?
- Which tournaments produced the most goals?
- How has England performed throughout World Cup history?

---

## Technologies Used

- SQL Server
- SQL Server Management Studio (SSMS)
- Python
- Pandas
- Matplotlib
- Excel
- Git
- GitHub

---

## Dataset

**Source:** FIFA World Cup Historical Dataset

Files used:

- WorldCupMatches.csv
- WorldCupPlayers.csv
- WorldCups.csv

Coverage:

- 1930–2014
- 4,572 historical World Cup match records

---

## Project Structure

```text
world-cup-performance-analysis
│
├── data/
├── sql/
├── notebooks/
├── visuals/
├── README.md
└── project-notes.md
```

---

# Project Workflow

## 1. Data Collection

- Downloaded historical FIFA World Cup datasets
- Organised project files

---

## 2. Database Creation

Created a SQL Server database called:

```sql
CREATE DATABASE WorldCupAnalysis;
```

---

## 3. Data Import

Imported the CSV files into SQL Server.

Challenges encountered:

- RoundID exceeded SMALLINT range
- Missing values prevented import
- Updated data types
- Allowed NULL values where appropriate

---

## 4. Data Exploration

Performed initial exploration to understand:

- Table structure
- Data types
- Number of records
- Missing values
- Match-level granularity

---

## 5. SQL Analysis

The analysis is divided into multiple sections.

### Data Exploration

- Total matches
- Tournament coverage
- Missing values

### Team Performance

- Matches played
- Wins
- Goals scored
- Goal difference

### England Analysis

- Overall record
- Tournament history
- Goals scored
- Knockout performance

### Tournament Analysis

- Highest scoring World Cups
- Average goals per game
- Attendance trends

---

## Visualisations

To be completed.

---

## Skills Demonstrated

- SQL querying
- Data cleaning
- Data exploration
- Aggregation
- Subqueries
- UNION and UNION ALL
- Business problem solving
- Data storytelling

---

## Future Improvements

- Add Power BI dashboard
- Build interactive Python visualisations
- Extend the analysis using newer World Cup datasets
- Compare historical trends with the 2026 World Cup

---

## Author

Yahye

## Insights

- Question 1:
The dataset contains 4,572 historical World Cup match records, providing a substantial dataset for analysing tournament history, team performance, and scoring trends.

- Question 2:
It contains 20 tournaments, from 1930 to 2014. World Cup has taken place every four years since 1930 with the exception of the 40s due to WW2.

- Question 3:
1930 was the first world cup and 2014 is the latest inlcuded in this dataset.

- Question 4:
84 unique teams have ever played in the world cup.

- Question 5: 
2014 had the most games played in a world cup, up until then, with 80 games played.

- Question 6:
Brazil has played the most world cup games until 2014, playing 108. 

- Question 7:
Brazil also has the most wins in the World Cup with 71, with Italy in second place with 45.
