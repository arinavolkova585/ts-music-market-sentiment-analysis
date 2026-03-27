# From Raw Data to Strategy: What Drives Music Performance

A multi-source SQL and Python analysis exploring how chart success emerges across Billboard Hot 100 and Spotify Global — combining charts, lyrics, sentiment, and audio features.

This project uses Taylor Swift’s catalog (2006–2025) as a controlled case study to understand whether success is driven by the music itself or by external system dynamics.


---

## Project Overview

This analysis investigates four core dimensions:

1. **Sentiment × Chart Performance**  
   How emotional tone relates to peak performance and longevity across platforms  

2. **Billboard × Spotify Global**  
   How US radio-driven charts differ from global streaming dynamics  

3. **Audio Features × Performance**  
   Whether tempo, energy, structure, and song length explain success  

4. **Release Context & Outliers**  
   How cultural moments, timing, and fan behavior shape performance beyond measurable features  


---

## Datasets

| File | Description | Source |
|------|-------------|--------|
| `billboard_hot100_complete_1958-2025.csv` | Weekly Billboard Hot 100 data | Scraped via Python with AI assistance |
| `spotify_global_2017-2025.csv` | Spotify Global Top 200 rankings | Kaggle + manual collection |
| `spotify_top_audio_features.csv` | Danceability, energy, tempo, etc. | Spotify API (pre-2024 public access)|
| `taylorswift_lyrics_and_sentiment.csv` | Custom lyrical dataset with sentiment, structure, and engineered features | Built from scratch |

---

## Methodology

- **Python (pandas, requests, spotipy)** — data collection, cleaning, feature engineering  
- **BigQuery (SQL)** — joins, aggregations, correlation analysis  
- **Custom NLP pipeline** — sentiment scoring using RoBERTa + manual validation (~18% human-in-the-loop adjusted for context) 
- **Regex-based canonicalization (UDF)** — cross-dataset song matching  

### Important note:
This project prioritizes **analytical accuracy over automation**.  
Sentiment scores were manually reviewed and adjusted where models failed to capture context (e.g., metaphor, irony, nostalgia). 

---

## Key Findings

### 1. Audio features are baseline conditions, not differentiators
Tempo, energy, danceability, and structure show **no consistent relationship** with peak chart performance.  
Top-performing songs exist across the full range of these characteristics.

→ Musical features are necessary, but not sufficient.


---

### 2. Emotional tone shapes *how* songs perform, not just *if* they perform
- Negative songs achieve stronger peak positions across platforms  
- Neutral songs sustain longer on streaming platforms  
- Positive songs are underrepresented among #1 hits  

→ Different emotional profiles drive **peak vs longevity**, not overall success


---

### 3. Billboard and Spotify measure fundamentally different systems
- Billboard reflects **US radio + legacy consumption**
- Spotify reflects **global streaming + algorithmic discovery**

The same song can perform very differently across platforms due to **audience and distribution differences**, not musical characteristics.


---

### 4. Release strategy and cultural timing explain more than song features
Re-releases (Taylor’s Version) show:
- High initial spikes  
- Short-lived chart presence  

Original releases sustain longer.

Outliers (e.g., *All Too Well (10 Minute Version)*) succeed when:
- narrative
- timing
- fan mobilization  

align simultaneously.

→ Performance is shaped by **context, not just composition**


---

### 5. Observed data is constrained by platform and historical structure
- Spotify data begins in 2017 (catalog removal creates gaps)
- Pre-streaming hits are underrepresented
- Re-recordings fragment performance across versions

→ Chart performance reflects **distribution conditions as much as audience preference**


---

## SQL Analysis

All queries are available in `/sql`

---

## Limitations

- Missing external drivers: marketing spend, TikTok trends, playlist placement, tour cycles  
- Sentiment classification required manual correction (~18%)  
- Spotify coverage limitations (pre-2017 gap)
- Audio Features coverage limitations (pre-2024) 

These unobserved variables likely explain **more variance than measured features**.


---

## What I’d Do Next

- Integrate **TikTok, playlist, and tour data** to capture cultural momentum  
- Expand beyond a single artist to test generalizability  
- Move from descriptive analysis → **predictive modeling of performance**  


---

## Key Takeaway

Chart performance is not explained by any single musical feature.

It emerges from the interaction of:
- emotional resonance  
- platform dynamics  
- release strategy  
- cultural timing  


---
## Author

**Arina Volkova** | Digital Business Management, Humber Polytechnic  
[LinkedIn](https://www.linkedin.com/in/arinavolkova585) | [GitHub](https://github.com/arinavolkova585)
