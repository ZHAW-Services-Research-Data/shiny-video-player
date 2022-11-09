# e.g. load datasets if datasets are rather static and don't depend on the user

# these file are read here because they don't change after the app is started
df_videos <- readxl::read_excel("data/video_list.xlsx") %>%
  mutate(trial_number = as.integer(trial_number))
