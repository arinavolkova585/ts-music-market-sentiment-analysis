# Charting the Eras: Taylor Swift's Music Market & Sentiment Analysis

A multi-dataset SQL and Python analysis exploring Taylor Swift's Billboard Hot 100 performance, global Spotify streaming, lyrical sentiment, and audio characteristics across her entire discography (2006–2025).


## Project Overview

This project investigates four analytical dimensions:

1. **Sentiment × Billboard** — Does lyrical sentiment (positive/negative/neutral) predict US chart performance?
2. **Sentiment × Spotify Global** — How does lyrical tone correlate with global streaming reach?
3. **Billboard × Spotify Global** — Where does Taylor Swift's US dominance diverge from her global streaming footprint?
4. **Audio Features × Chart Performance** — Do sonic characteristics like danceability, energy, and valence explain chart success?

## Datasets

| File | Description | Source |
|------|-------------|--------|
| `billboard_hot100_complete_1958-2025.csv` | Weekly Billboard Hot 100 chart data | Scraped via Python |
| `spotify_global_2017-2025.csv` | Spotify Global Top 200 weekly rankings | Downloaded manually week by week and merged + Kaggle |
| `spotify_top_audio_features.csv` | Audio features (danceability, energy, valence, tempo, etc.) for charted songs | Spotify API |
| `taylorswift_lyrics_and_sentiment.csv` | Full lyrical analysis including sentiment scores, lexical diversity, imagery counts, structural features | Custom NLP pipeline) |


## Tools & Methods

- **Python** (pandas, spotipy, requests) — data collection, cleaning, and feature engineering
- **Google BigQuery (SQL)** — multi-table joins, CTEs, window functions, aggregations
- **Custom canon() UDF** — regex-based song title normalization for cross-dataset matching

---

## Key Findings

- Taylor Swift's **#1 Billboard hits skew negative or neutral in sentiment** — only 1 of 13 #1 songs is classified as positive
- **Lexical diversity and chart performance have an inverse relationship** — her most linguistically complex era (TTPD) produces lower Hot 100 peaks than her simpler, more repetitive eras (1989, Reputation)
- **Red (Taylor's Version) has the most charted songs (32)** but TTPD, Midnights, and The Life of a Showgirl have the best average peak ranks
- **Pre-2017 hits are systematically underrepresented in Spotify data** due to her catalog removal from the platform (2014–2017)
- **Explicit songs outperform on Spotify Global vs Billboard**, likely driven by radio airplay methodology and genre composition differences

---

## SQL Analysis

All BigQuery queries are in the `/sql` folder, organized by analytical dimension:
- `sentiment_x_billboard.sql`
- `billboard_x_spotify.sql`
- `lexical_analysis.sql`
- `genre_performance.sql`

---

## Status

🟡 In progress — dashboard and executive summary in development

---

## Author

**Arina Volkova** | Digital Business Management, Humber Polytechnic  
[LinkedIn](https://www.linkedin.com/in/arinavolkova585) | [GitHub](https://github.com/arinavolkova585)
