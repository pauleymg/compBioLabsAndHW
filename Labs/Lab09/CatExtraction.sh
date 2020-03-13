# Take the header from Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv
head -n 1 Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv > Cusack_et_al_Wet_Cats.csv

# Extract rows pertaining to cat species from Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv
grep -E "Lion|Leopard|Wildcat|Caracal|Cheetah|Serval" Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv > Cusack_et_al_Cats_only.csv

# Extract and keep only rows pertaining to the wet season
awk -F, '$3 == "W"' Cusack_et_al_Cats_only.csv >> Cusack_et_al_Wet_Cats.csv
