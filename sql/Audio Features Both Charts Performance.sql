CREATE TEMP FUNCTION canon_match(x STRING) AS (
  TRIM(REGEXP_REPLACE(
    REGEXP_REPLACE(
      REGEXP_REPLACE(
        REGEXP_REPLACE(
          REGEXP_REPLACE(
            REGEXP_REPLACE(LOWER(IFNULL(x,'')), r'\b(feat\.?|ft\.?|featuring)\b.*$', ' '),
            r'[\(\)\[\]]', ' '
          ),
          r'\bminutes\b', ' minute '
        ),
        r"(taylor'?s\s+version|\btv\b)", ' '
      ),
      r'from\s+the\s+vault', ' '
    ),
    r'[^a-z0-9]+', ' '
  ))
);

CREATE TEMP FUNCTION join_key(song STRING, artist STRING) AS (
  CONCAT(canon_match(song), ' | ', canon_match(artist))
);

WITH b AS (
  SELECT
    join_key(song, artist) AS k,
    artist,
    song,
    MIN(peak_rank) AS bb_peak_rank
  FROM `ts-sentiment-and-charts.ts_sentiment_and_charts.billboard_hot100_1958_2025`
  GROUP BY k, artist, song
),
sp AS (
  SELECT
    join_key(song, artist) AS k,
    MIN(rank) AS sp_peak_rank
  FROM `ts-sentiment-and-charts.ts_sentiment_and_charts.spotify_global_2017-2025`
  GROUP BY k
),
af AS (
  SELECT
    k,
    danceability,
    energy,
    speechiness,
    acousticness,
    instrumentalness,
    liveness,
    valence,
    loudness,
    tempo,
    duration_ms,
    weeks_on_chart,
    streams
  FROM (
    SELECT
      join_key(song, artist) AS k,
      danceability,
      energy,
      speechiness,
      acousticness,
      instrumentalness,
      liveness,
      valence,
      loudness,
      tempo,
      duration_ms,
      weeks_on_chart,
      streams,
      ROW_NUMBER() OVER (
        PARTITION BY join_key(song, artist)
        ORDER BY streams DESC, weeks_on_chart DESC
      ) AS rn
    FROM `ts-sentiment-and-charts.ts_sentiment_and_charts.spotify_top_audio_features`
  )
  WHERE rn = 1
)

SELECT
  b.artist,
  b.song,
  b.bb_peak_rank,
  sp.sp_peak_rank,
  ROUND(af.duration_ms / 60000.0, 2) AS duration_min,
  af.danceability,
  af.energy,
  af.valence,
  af.tempo,
  af.loudness,
  af.weeks_on_chart,
  af.streams
FROM b
INNER JOIN sp USING (k)
INNER JOIN af USING (k)
ORDER BY b.bb_peak_rank;
