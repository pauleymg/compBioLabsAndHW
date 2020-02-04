# this script creates an abridged version of the predator-prey dataset.

# remove unwanted columns and then pushes only the first row into a new spreadsheet file.
cut -f 2-4 -d , PredPreyData.csv | head -n 1 > newData.csv
# remove unwanted columns and append last ten rows to the file created in the previous step.
cut -f 2-4 -d , PredPreyData.csv | tail >> newData.csv
