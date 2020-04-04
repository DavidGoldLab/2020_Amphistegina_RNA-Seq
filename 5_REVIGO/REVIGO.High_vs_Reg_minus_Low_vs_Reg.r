

# A plotting R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800


# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
library( ggplot2 );
# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales );
# --------------------------------------------------------------------------
# If you don't have the ggrepel package installed, uncomment the following line:
# install.packages( "ggrepel" );
library( ggrepel );
# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency_%","plot_X","plot_Y","plot_size","log10_p_value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0007017","microtubule-based process", 0.658, 3.438,-5.084, 4.927,-5.6383,0.766,0.000),
c("GO:0051606","detection of stimulus", 0.351,-4.600, 3.514, 4.654,-2.8625,0.893,0.000),
c("GO:0051647","nucleus localization", 0.012, 5.819, 3.970, 3.198,-1.3428,0.926,0.000),
c("GO:2001057","reactive nitrogen species metabolic process", 0.120,-7.191, 2.402, 4.188,-1.7417,0.933,0.000),
c("GO:0071941","nitrogen cycle metabolic process", 0.218,-0.935, 6.678, 4.447,-1.4772,0.933,0.090),
c("GO:0010529","negative regulation of transposition", 0.003, 2.639, 5.135, 2.603,-1.3193,0.811,0.121),
c("GO:0007076","mitotic chromosome condensation", 0.035, 0.372,-6.778, 3.655,-2.8069,0.608,0.144),
c("GO:0042128","nitrate assimilation", 0.092, 5.617,-5.006, 4.071,-1.9583,0.726,0.156),
c("GO:0007018","microtubule-based movement", 0.287, 3.009,-0.782, 4.567,-5.0985,0.514,0.172),
c("GO:0022008","neurogenesis", 0.423,-2.956,-3.418, 4.735,-2.7615,0.569,0.178),
c("GO:0006928","movement of cell or subcellular component", 0.973, 4.996,-2.272, 5.097,-3.5581,0.761,0.194),
c("GO:0001966","thigmotaxis", 0.001,-2.726, 3.609, 2.215,-1.4594,0.872,0.218),
c("GO:0006635","fatty acid beta-oxidation", 0.080, 6.160,-4.108, 4.011,-1.7217,0.704,0.310),
c("GO:0035282","segmentation", 0.036,-5.740,-3.519, 3.666,-1.4594,0.684,0.612),
c("GO:0060294","cilium movement involved in cell motility", 0.004, 2.186, 1.301, 2.695,-2.7087,0.556,0.623),
c("GO:0060632","regulation of microtubule-based movement", 0.004, 3.652, 1.182, 2.702,-1.8994,0.575,0.624),
c("GO:0036159","inner dynein arm assembly", 0.005, 1.008,-3.118, 2.803,-2.9783,0.493,0.633),
c("GO:0006323","DNA packaging", 0.227,-0.934,-7.885, 4.465,-1.7309,0.706,0.638),
c("GO:0050906","detection of stimulus involved in sensory perception", 0.290,-5.337,-1.784, 4.571,-2.6850,0.645,0.646),
c("GO:0021952","central nervous system projection neuron axonogenesis", 0.006,-2.995,-4.820, 2.889,-1.4594,0.532,0.674),
c("GO:0090596","sensory organ morphogenesis", 0.080,-5.562,-3.918, 4.013,-2.2539,0.665,0.685));

one.data <- data.frame(revigo.data);
names(one.data) <- revigo.names;
one.data <- one.data [(one.data$plot_X != "null" & one.data$plot_Y != "null"), ];
one.data$plot_X <- as.numeric( as.character(one.data$plot_X) );
one.data$plot_Y <- as.numeric( as.character(one.data$plot_Y) );
one.data$plot_size <- as.numeric( as.character(one.data$plot_size) );
one.data$log10_p_value <- as.numeric( as.character(one.data$log10_p_value) );
one.data$frequency <- as.numeric( as.character(one.data$frequency) );
one.data$uniqueness <- as.numeric( as.character(one.data$uniqueness) );
one.data$dispensability <- as.numeric( as.character(one.data$dispensability) );
#head(one.data);


# --------------------------------------------------------------------------
# Names of the axes, sizes of the numbers and letters, names of the columns,
# etc. can be changed below

p1 <- ggplot( data = one.data );
p1 <- p1 + geom_point( aes( plot_X, plot_Y, colour = log10_p_value, size = log10_p_value), alpha = I(0.6) ) + scale_size_area();
p1 <- p1 + scale_colour_gradientn( colours = c("blue", "green", "yellow", "red"), limits = c( min(one.data$log10_p_value), 0) );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = log10_p_value), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_size_area();
ex <- one.data [ one.data$log10_p_value < -2, ]; 
p1 <- p1 + geom_label_repel( data = ex, aes(plot_X, plot_Y, label = description), force = 1, size = 4);
p1 <- p1 + labs (y = "semantic space x", x = "semantic space y");
p1 <- p1 + theme(legend.key = element_blank()) ;
# one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
# one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
# p1 <- p1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
# p1 <- p1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10);



# --------------------------------------------------------------------------
# Output the plot to screen

p1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("C:/Users/path_to_your_file/revigo-plot.pdf");
