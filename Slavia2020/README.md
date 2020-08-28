This folder contains the data and script that I used for the "Nominal causal constructions across Slavic: semantic contrasts in a parallel corpus perspective" paper, submitted to Slavia in 2020.

The data were analyzed in R to built MDS-visualizations. The script is available in MDS_between_Slavic_causal_contexts.R

The data used for this paper are stored in three .csv files.

1) Raw data are in slavic_nominal_causes_2020_01_full_231_contexts_11_lgs.csv.
This file contains 231 parallel contexts in 11 Slavic languages and some additional material.
Each row corresponds to a parallel context and has a conventional number used for reference purposes.
Examples are tagged by
- whether or not they contain a nominal causal construction
- which causal  marker is used
- in most cases, markers are tagged by the cognacy class of markers.

2) The main spreadsheet is slavic_nominal causes_2020_01_markers_231_contexts_11_lgs.csv.
This file contains only rows with conventional numbers for contetxs and causal markers used in the 11 lgs.

3) The results of the MDS-analysis (coordinates) are saved in slavic_nominal_causes_2020_01_MDS_coordinates.csv
This file is very similar to the previous one, but there two extra columns that contains coordinates of the 2-dimensional MDS analysis for the 231 contexts.
