# NBA Scoring Analysis (SQL + Tableau)

> Class Project · CIS 240, University of Rochester

What drives NBA scoring? This project analyzes 2012–2022 NBA game data with SQL and Tableau, testing three drivers: three-point shooting, assists, and home-court advantage.

## What It Does

- **SQL analysis** (`NBA-Scoring-Analysis.sql`): queries a 2.3 GB game database to measure how 3PT shooting, assists, and home-court advantage relate to team scoring.
- **Game data** (`NBA-Game-Data.xls`): the underlying game-level data.
- **Arena data** (`NBA_Arenas_Coordinates.xlsx`): arena locations used for the home-court analysis.
- **Final presentation** (`Final-Presentation.docx`) and **project script** (`Project-Script.docx`): the team's write-up of findings.

## Tech Stack

SQL (SQLite) · Excel · Tableau

## How to Run

Run `NBA-Scoring-Analysis.sql` against the game database; open the workbooks for the data and the presentation for the findings.

## Files

| File | What it is |
| --- | --- |
| `NBA-Scoring-Analysis.sql` | Analysis queries |
| `NBA-Game-Data.xls` | Game-level data |
| `NBA_Arenas_Coordinates.xlsx` | Arena coordinates |
| `Final-Presentation.docx` | Final presentation |
| `Project-Script.docx` | Project script |

## Data Note

The full 2.3 GB SQLite database (`nba.sqlite`) is too large for GitHub and is **not included**. The SQL script and the game data file show the full analysis.
