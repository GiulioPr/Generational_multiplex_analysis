# Generational multiplex analysis
Pipeline for the analysis of single-cell familial data from multiplex clonal assay [1].

<p>
Folders:
	
- csv contains the csv files for the input data from each experiment. For a given experiment, there is one file in the Single_cell folder, with the after culture data, and one in the Sort folder, with the index sort data. <em>Importantly</em>, both csv files, relative to the same experiment, share the same name;

- figures, all plots are saved here;

- pickled_data, pickled variables are stored here, and are loaded in the code to avoid recalculations;

- R_script_for_Jonckheere_test, here are the csv files to be loaded in R before running Jonckheere_test.R to compute Jonckheere tests;

- Gating_matrix.xlsx contains the gating thresholds relative to the markers (rows) from each experiment (columns). -1 values indicate abscence of that marker/threshold. <em>Importantly</em>, the experiment name must be named after the relative csv filename, underscore, time of culture, namely filename_timepoint;
</p>

<p>
Python 3 notebooks:
	
- 0_process_data.ipynb takes the csv files from csv/Single_cell folders to pool these into a single file, csv/Single_cell/Pooled_data.csv. Similarly for the files in csv/Sort. Gating_matrix.xlsx is used here to determine the class of each cell. <em>Importantly</em>, csv files from csv/Single_cell are expected to be provided with the columns (in no particular order):
	- Multiple columns, each associated to one marker expression, that are referenced by the cell_class_exp_time function;
	- Generation of the cell;
	- Culture_time, at which the cell is analysed;
	- Condition, in which the cell is cultured;
	- Well, in which the cell is cultured;
	- Original_cell, class of the cell's progenitor;
	- Color, used to stain the cell's progenitor.
This script will then return a pooled data csv file that also contains the columns relative to: Culture_condition, renamed after Condition; Experiment label; Well_experiment labels combined (used for permutation testing only); Family label to which the cell belongs to; Class of the cell; Cell_color, used in 1_dot_plot script; Cell_rank, to order cells from the same family and generation after their class, for the plots in 1_dot_plot.

- 1_dot_plot.ipynb plots cells as dots arranged by family and generation and color-coded by cell class [1-3].

- 2_bar_plot.ipynb plots stacked bar plots for categorical data [1].

- 3_bbmodel_concordance.ipynb fits the beta-binomial model to the generational range observed, then plots range distributions from data, best-fit, other parameters of reference [1,3]. <em>Importantly</em>, the parameter r_sample must be defined by the user as the average probability that a cell is recovered at the moment of analysis. This is usually estimated as the average proportion of beads, added to the culture in known quantity, or of culuturing medium volume recovered.

- 4_permutation_testing.ipynb runs statistical hypothesis testing by permutation [1,2].
</p>


<p>
<strong>References:</strong><br>
[1] Tak, T., Prevedello, G., Simon, G., Paillon, N., Duffy, K. R., & Perie, L. (2021). Simultaneous tracking of division and differentiation from individual hematopoietic stem and progenitor cells reveals within-family homogeneity despite population heterogeneity. eLife, DOI: 10.7554/eLife.60624<br>
[2] Horton, M. B., Prevedello, G., Marchingo, J. M., Zhou, J. H., Duffy, K. R., Heinzel, S., & Hodgkin, P. D. (2018). Multiplexed division tracking dyes for proliferation-based clonal lineage tracing. The Journal of Immunology, 201(3), 1097-1103<br>
[3] Marchingo, J. M., Prevedello, G., Kan, A., Heinzel, S., Hodgkin, P. D., Duffy, K. R. (2016). T-cell stimuli independently sum to regulate an inherited clonal division fate. Nature Communications, 7, 13540
</p>
