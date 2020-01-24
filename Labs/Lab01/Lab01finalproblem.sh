touch newData.csv
cut -f 2-4 -d , PredPreyData.csv | head -n 1 > newData.csv
cut -f 2-4 -d , PredPreyData.csv | tail -n 10 >> newData.csv
