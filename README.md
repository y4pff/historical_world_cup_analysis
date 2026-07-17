# ⚽ Historical FIFA World Cup Performance Analysis (1930–2014)

A SQL Server project exploring historical FIFA World Cup data, with a focus on data quality and national-team performance.

## Project status

**Current phase: SQL data exploration and team-performance analysis**

- ✅ SQL Server database created
- ✅ CSV files imported
- ✅ Data-quality issues identified
- ✅ Core exploration queries corrected
- ✅ Matches played and scoreline wins analysed
- ⏳ Further team and England analysis
- ⏳ Power BI dashboard

## Overview

This project analyses FIFA World Cup tournaments from 1930 to 2014. It currently demonstrates database setup, CSV import, data profiling, cleaning and SQL aggregation.

The analysis completed so far answers:

- How many valid World Cup matches are in the dataset?
- How many tournaments and team labels are represented?
- Which tournaments contained the most matches?
- Which teams played the most matches?
- Which teams recorded the most scoreline wins?

## Dataset

Source: [FIFA World Cup dataset on Kaggle](https://www.kaggle.com/datasets/abecklas/fifa-world-cup)

| File | Description |
| --- | --- |
| `WorldCupMatches.csv` | Match results, teams, stages, venues and attendance |
| `WorldCupPlayers.csv` | Player appearances, positions and events |
| `WorldCups.csv` | Tournament hosts, winners, goals and attendance |

The current SQL analysis uses `WorldCupMatches.csv`.

## Important data-quality finding

The match CSV contains **4,572 data rows**, but it does not contain 4,572 real matches:

- **3,720 rows are blank**;
- **852 rows contain match data**; and
- **16 populated 2014 rows duplicate existing `MatchID` values**.

After filtering blank rows and keeping one row per `MatchID`, the analysis contains **836 unique matches**.

This cleaning step corrects the original results that showed 80 matches in 2014, 108 Brazil appearances and 71 Brazil wins.

## Corrected findings so far

| Question | Correct result |
| --- | --- |
| Unique World Cup matches | **836** |
| Tournaments covered | **20** |
| First and latest tournaments | **1930 and 2014** |
| Distinct raw team labels | **83** |
| Maximum matches in one tournament | **64** |
| Team with most matches | **Brazil — 104** |
| Team with most scoreline wins | **Brazil — 70** |
| Second-most scoreline wins | **Italy — 45** |

A scoreline win means that a team scored more goals than its opponent in the match score columns. Penalty-shootout outcomes are stored separately in `Win_conditions` and will be treated explicitly in later analysis.

Historical labels such as `Germany FR` and `Germany` remain separate for now. They should only be combined after adding a documented team-name mapping.

## SQL workflow

Run the scripts in this order:

1. `sql/00_create_clean_view.sql` filters blank rows and deduplicates `MatchID`.
2. `sql/01_data_exploration.sql` validates row counts, tournament coverage and team labels.
3. `sql/02_team_performance.sql` calculates matches, wins, draws, losses, goals and win percentage.

All analysis queries use `dbo.vw_CleanWorldCupMatches`, ensuring they are calculated from the same cleaned set of 836 matches.

## Repository structure

```text
historical_world_cup_analysis/
├── data/
│   ├── README.md
│   ├── WorldCupMatches.csv
│   ├── WorldCupPlayers.csv
│   └── WorldCups.csv
├── sql/
│   ├── 00_create_clean_view.sql
│   ├── 01_data_exploration.sql
│   └── 02_team_performance.sql
├── visuals/
│   └── legacy_ssms_results/
├── .gitignore
├── project_notes.md
└── README.md
```

The screenshots in `visuals/legacy_ssms_results/` show results from before the duplicate and blank-row corrections. They are retained as working history and should not be used as final evidence.

## Tools and SQL skills demonstrated

- SQL Server and SQL Server Management Studio
- CSV import and data-type correction
- Null and duplicate detection
- CTEs and `ROW_NUMBER()`
- Aggregation, `CASE`, `UNION` and `UNION ALL`
- Reproducible metric definitions
- Git and GitHub

## Planned next steps

- Complete goals, goal difference and win-percentage analysis.
- Analyse England's performance by tournament and stage.
- Analyse scoring and attendance trends by tournament.
- Build a Power BI dashboard from the cleaned data.
- Add 2018 and 2022 only as a separately sourced extension.

## Author

**Yahye** · [GitHub](https://github.com/y4pff)

## Insights

- Question 1:
The dataset contains 4,572 historical World Cup match records, providing a substantial dataset for analysing tournament history, team performance, and scoring trends.

- Question 2:
It contains 20 tournaments, from 1930 to 2014. World Cup has taken place every four years since 1930 with the exception of the 40s due to WW2.

- Question 3:
1930 was the first world cup and 2014 is the latest inlcuded in this dataset.

- Question 4:
83 unique teams have ever played in the world cup.

- Question 5: 
2014 had the most games played in a world cup, up until then, with 80 games played.

- Question 6:
Brazil has played the most world cup games until 2014, playing 108. 

- Question 7:
Brazil also has the most wins in the World Cup with 70, with Italy in second place with 45.
