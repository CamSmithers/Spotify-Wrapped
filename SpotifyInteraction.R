alltime_top100_songs <- streaming_data_2 %>%
    group_by(song, artist) %>%
    summarize(alltime_play_count = n(), .groups = "drop") %>%
    arrange(desc(alltime_play_count)) %>%
    slice_head(n = 100)
#View(alltime_top100_songs)

alltime_top500_songs <- streaming_data_2 %>%
    group_by(song, artist) %>%
    summarize(alltime_play_count = n(), .groups = "drop") %>%
    arrange(desc(alltime_play_count)) %>%
    slice_head(n = 500)
#View(alltime_top500_songs)

streaming_data_3 <- streaming_data_2 %>%
    select(artist, song)

top100 <- alltime_top100_songs %>%
    left_join(streaming_data_3, by = c("song", "artist")) %>%
    distinct(song, artist, .keep_all = TRUE)
top500 <- alltime_top500_songs %>%
    left_join(streaming_data_3, by = c("song", "artist")) %>%
    distinct(song, artist, .keep_all = TRUE)

write_csv(top100,
          "/Users/camsmithers/Desktop/Camalytics/CamalyticsEnv/Projects/Life/Music/top100.csv")
write_csv(top500,
          "/Users/camsmithers/Desktop/Camalytics/CamalyticsEnv/Projects/Life/Music/top500.csv")