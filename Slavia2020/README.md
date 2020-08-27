This folder contains the data and script that I used for the "Nominal causal constructions across Slavic: semantic contrasts in a parallel corpus perspective" paper, submitted to Slavia in 2020.

The data were analyzed in R to built MDS-visualizations. The script is in MDS_between_Slavic_causal_contexts.R

The data used for this paper are stored in slavic_nominal_causes_2020_01.zip archive.

1) Raw data are in slavic_nominal_causes_2020_01_full_231_contexts_11_lgs.xlsx.
This file contains 231 parallel contexts in 11 Slavic languages. Each row corresponds to a parallel context and has a conventional number used for reference purposes.
Examples are tagged by
- whether or not they contain a nominal causal construction
- which causal  marker is used
- in most cases, markers are tagged by the cognacy class of markers.

NB: this is an .xlsx file, open it in Excel. These data cannot be directly read by R because of the problems with the Cyrillic script. If you want to read these data in R, go to slavic_nominal_causes_2020_01_full_231_contexts_11_lgs.csv.

2) The main spreadsheet is slavic_nominal causes_2020_01_markers_231_contexts_11_lgs.csv.
This file contains only rows with conventional numbers for contetxs and causal markers used in the 11 lgs.

3) The results of the MDS-analysis (coordinates) are saved in slavic_nominal_causes_2020_01_MDS_coordinates.csv
This is an R-compatible file.
