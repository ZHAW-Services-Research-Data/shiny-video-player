# e.g. load datasets if datasets are rather static and don't depend on the user

# these file are read here because they don't change after the app is started
df_bfi_scales <- read_data_xlsx("data/BFI_scales.xlsx", sheet=1)
df_bfi_main <- read_data_xlsx("data/BFI_scales.xlsx", sheet=2)
df_bfi_norms <- read_data_xlsx("data/BFI_norms.xlsx", sheet=1)