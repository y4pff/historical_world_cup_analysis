# Project notes

## Completed

- Created the `WorldCupAnalysis` SQL Server database.
- Imported the three source CSV files.
- Corrected import data types and nullable columns.
- Identified blank rows and duplicated `MatchID` values.
- Created a reusable cleaned-match view.
- Corrected the core exploration results.
- Built one team-level query for appearances, scoreline wins, draws, losses and goals.

## Continue from here

1. Run `sql/00_create_clean_view.sql` in SSMS.
2. Run `sql/01_data_exploration.sql` and confirm the documented results.
3. Run `sql/02_team_performance.sql` and save a new screenshot only after confirming the results.
4. Commit the corrected exploration phase.
5. Start England and tournament analysis in new numbered SQL files.
6. Build Power BI visuals only after the SQL figures are validated.

## Decisions to document later

- Whether penalty-shootout victories count as wins in each metric.
- Whether historical labels such as `Germany FR` and `Germany` should be combined.
- How attendance nulls and formatting should be handled.
- Which source will be used for the 2018 and 2022 tournaments.
