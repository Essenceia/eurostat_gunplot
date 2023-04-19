#!/bin/bash

# Download german industry index's into csv

out_dir="german_industry"

# create output directory if needed
mkdir -p $out_dir

# NACE codes for sectors we are downloading
type_array=(C C10-C12 C201 C231 C241 C23)

for t in "${type_array[@]}"
do
	out_file=$t
	echo "Downloading NACE code $t to file $out_file"
	url="https://ec.europa.eu/eurostat/api/dissemination/sdmx/3.0/data/dataflow/ESTAT/STS_INPR_M/1.0/M.PROD.${t}.NSA.I15.DE?compress=false&format=csvdata&formatVersion=2.0&c[TIME_PERIOD]=ge:2019-01+le:2023-02"
	wget $url --output-document=$out_dir/$out_file
done

