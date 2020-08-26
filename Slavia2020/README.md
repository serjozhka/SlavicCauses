This folder contains the data and script that I used for the "Nominal causal constructions across Slavic: semantic contrasts in a parallel corpus perspective" paper, submitted to Slavia in 2020.

Raw data are in slavic_nominal_causes_2020_01_full_231_contexts_11_lgs.xlsx
This file contains 231 parallel contexts in 11 Slavic languages. Each row corresponds to a parallel context and has a conventional number used for reference purposes.
Examples are tagged by
- whether or not they contains a nominal causal construction
- which causal  marker is used
- in most cases, markers are tagged by the cognacy class of markers.
NB: this is an .xlsx file, these data cannot be read by R because of the problems with the Cyrillic script.

The main spreadsheet is slavic_nominal causes_2020_01_markers_231_contexts_11_lgs.csv
This file contains only rows with conventional numbers and causal markers used in the 11 lgs.

These data were analyzed in R. The script is available in MDS_between_Slavic_causal_contexts.R

The results of the MDS-analysis (coordinates) are saved in slavic_nominal_causes_2020_01_MDS_coordinates.csv
This is an R-compatible file.
