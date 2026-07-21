# ⚽ Historical FIFA World Cup Performance Analysis (1930–2014)

A SQL Server project exploring historical FIFA World Cup data, with a focus on data quality and national-team performance.

## Project status

**Current phase: SQL data exploration and team-performance analysis**

- ✅ SQL Server database created
- ✅ CSV files imported
- ✅ Data-quality issues identified
- ✅ Core exploration queries corrected
- ✅ Matches played and scoreline wins analysed
- ⏳ Further team analysis
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

## Insights

: **Data exploration insights**

- **Question 1: How many World Cup matches are contained in the dataset?**  
  The original CSV contains 4,572 rows, but only 852 contain match data. After removing 16 duplicated records, the cleaned dataset contains 836 unique World Cup matches. This demonstrates the importance of validating and cleaning data before analysis.

- **Question 2: How many tournaments are represented?**  
  The dataset contains 20 tournaments covering 1930 to 2014. The World Cup has generally taken place every four years, except in 1942 and 1946 because of the Second World War.

- **Question 3: What are the earliest and latest tournaments?**  
  The first World Cup included in the dataset is 1930, and the latest is 2014.

- **Question 4: How many teams are represented?**  
  The cleaned dataset contains 83 distinct raw team labels. Historical labels such as `Germany FR` and `Germany` are currently treated separately.

- **Question 5: Which tournaments contained the most matches?**  
  The maximum number of matches is 64. This format first appeared in 1998 and was repeated in 2002, 2006, 2010 and 2014.

- **Question 6: Which team played the most matches?**  
  Brazil played the most World Cup matches under a single team label, recording 104 appearances through 2014. This reflects Brazil's consistent qualification and long-term tournament participation.

- **Question 7: Which team recorded the most wins?**  
  Brazil recorded the most scoreline wins with 70, followed by Italy with 45. Penalty-shootout outcomes are stored separately and require additional analysis.

: **Team performance insights**

- Brazil demonstrated the greatest long-term World Cup presence, leading the dataset in matches played (104), scoreline wins (70), goals scored (221) and goal difference (+119).
- Germany recorded the highest scoreline win percentage among teams with at least 10 appearances, at 68.18%, slightly above Brazil’s 67.31%.
- Historical labels affect the rankings: `Germany FR` and `Germany` are treated separately, so these figures should not be interpreted as Germany’s combined World Cup history.
- Italy ranked second for matches and scoreline wins, reflecting sustained participation and success across the period.

: **Tournament Insights**

- The World Cup expanded a lot over time, growing from 18 matches in 1930 to 64 matches from 1998 onwards.
- The 1998 and 2014 tournaments produced the most total goals, with 171 each. Their larger 64-match formats contributed to these totals.
- The 1954 World Cup was the highest-scoring tournament relative to its size, averaging 5.38 goals per match.
- The 1990 World Cup recorded the lowest scoring rate, averaging 2.21 goals per match.
- The 1994 World Cup recorded the highest total attendance at 3,587,538 and the highest average attendance at 68,991 per match.
- Attendance data for 2014 is incomplete because only 63 of its 64 matches contain an attendance value.

: **England Insight**
England's strongest tournament by scoreline wins was 1966,
when the team won five of six matches and finished undefeated.

England also recorded no scoreline losses in 1982 and 2006,
although its 2006 elimination came through a penalty shootout.

The 2014 tournament was England's weakest in the dataset,
with no wins from three matches.

## Author

**Yahye** · [GitHub](https://github.com/y4pff)
