

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
revigo.data <- rbind(c("GO:0006950","response to stress", 4.575, 2.536,-3.993, 5.769,-13.1337,0.942,0.000),
c("GO:0008150","biological_process",100.000, 1.051,-0.063, 7.108,-68.5638,1.000,0.000),
c("GO:0008152","metabolic process",75.387, 0.825,-0.070, 6.986,-59.6091,0.998,0.000),
c("GO:0009987","cellular process",63.780, 0.405,-0.103, 6.913,-65.0061,0.997,0.000),
c("GO:0033036","macromolecule localization", 3.030, 4.216,-1.377, 5.590,-7.8633,0.947,0.000),
c("GO:0043933","macromolecular complex subunit organization", 2.371, 5.030, 2.287, 5.483,-25.5157,0.845,0.000),
c("GO:0044699","single-organism process",46.569, 2.255, 0.782, 6.776,-20.4711,0.996,0.000),
c("GO:0050896","response to stimulus",12.210, 0.952, 0.510, 6.195,-14.9626,0.993,0.000),
c("GO:0065007","biological regulation",20.498, 0.185,-0.004, 6.420,-9.4271,0.993,0.000),
c("GO:0071840","cellular component organization or biogenesis", 8.568, 1.009, 1.998, 6.041,-22.7545,0.992,0.000),
c("GO:1901575","organic substance catabolic process", 4.612, 0.728,-2.520, 5.772,-18.0726,0.836,0.000),
c("GO:0009056","catabolic process", 4.820, 0.416, 0.576, 5.791,-13.4976,0.961,0.023),
c("GO:0009058","biosynthetic process",31.611, 0.590, 0.824, 6.608,-43.0052,0.949,0.033),
c("GO:0006457","protein folding", 0.903, 0.117,-0.398, 5.064,-7.9355,0.942,0.039),
c("GO:0051186","cofactor metabolic process", 3.985,-1.509,-0.206, 5.709,-18.2652,0.884,0.047),
c("GO:0006418","tRNA aminoacylation for protein translation", 1.099,-6.260, 2.242, 5.149,-16.6038,0.569,0.077),
c("GO:0006091","generation of precursor metabolites and energy", 1.940,-0.605,-0.073, 5.396,-8.6696,0.894,0.083),
c("GO:0044237","cellular metabolic process",53.061,-2.619, 0.617, 6.833,-60.0434,0.881,0.084),
c("GO:0006807","nitrogen compound metabolic process",38.744, 0.311, 1.278, 6.696,-49.3526,0.947,0.088),
c("GO:0006732","coenzyme metabolic process", 3.111,-1.280, 0.496, 5.601,-11.1599,0.856,0.089),
c("GO:0043170","macromolecule metabolic process",39.491,-3.355,-2.281, 6.705,-41.4101,0.874,0.112),
c("GO:0071704","organic substance metabolic process",58.357, 1.562,-0.494, 6.874,-54.9914,0.942,0.119),
c("GO:0044238","primary metabolic process",53.743, 2.181, 0.202, 6.839,-53.2472,0.943,0.120),
c("GO:0006793","phosphorus metabolic process",13.507,-3.864, 0.751, 6.239,-4.4672,0.861,0.124),
c("GO:0044710","single-organism metabolic process",31.682, 0.181, 7.701, 6.609,-20.1561,0.883,0.144),
c("GO:0009767","photosynthetic electron transport chain", 0.025, 0.141, 6.243, 3.501,-4.0419,0.872,0.146),
c("GO:0008610","lipid biosynthetic process", 2.123,-4.006, 6.476, 5.435,-7.5171,0.757,0.198),
c("GO:0045454","cell redox homeostasis", 0.861,-1.051, 4.905, 5.043,-6.0434,0.770,0.202),
c("GO:0044723","single-organism carbohydrate metabolic process", 2.457,-0.905, 8.075, 5.499,-6.9393,0.826,0.208),
c("GO:0034641","cellular nitrogen compound metabolic process",34.137,-6.483, 1.332, 6.641,-43.4855,0.755,0.208),
c("GO:1901360","organic cyclic compound metabolic process",30.324,-2.374,-1.740, 6.590,-29.0685,0.881,0.211),
c("GO:1990542","mitochondrial transmembrane transport", 0.079, 3.639,-1.203, 4.006,-5.0241,0.960,0.259),
c("GO:0006725","cellular aromatic compound metabolic process",29.628,-4.173, 1.422, 6.580,-29.0458,0.839,0.260),
c("GO:0046483","heterocycle metabolic process",29.664,-4.355, 1.473, 6.580,-32.3080,0.839,0.260),
c("GO:0051604","protein maturation", 0.293,-4.258,-5.399, 4.575,-4.8153,0.850,0.266),
c("GO:0010628","positive regulation of gene expression", 0.653,-4.058,-6.182, 4.923,-16.2418,0.701,0.274),
c("GO:0044260","cellular macromolecule metabolic process",34.276,-6.698,-2.996, 6.643,-39.3089,0.761,0.277),
c("GO:0006839","mitochondrial transport", 0.182, 4.839,-1.276, 4.369,-4.1337,0.957,0.281),
c("GO:0044281","small molecule metabolic process",15.138,-1.101, 7.334, 6.288,-21.4486,0.843,0.281),
c("GO:0006354","DNA-templated transcription, elongation", 0.202,-8.114,-0.628, 4.413,-4.6459,0.748,0.288),
c("GO:0048518","positive regulation of biological process", 1.744,-0.768,-6.084, 5.350,-4.8153,0.873,0.301),
c("GO:0033013","tetrapyrrole metabolic process", 0.834,-6.928, 1.641, 5.029,-4.3019,0.783,0.304),
c("GO:0043603","cellular amide metabolic process", 6.879,-7.143, 0.677, 5.946,-13.1778,0.793,0.310),
c("GO:0044249","cellular biosynthetic process",30.048,-6.559, 3.300, 6.586,-40.3179,0.740,0.312),
c("GO:0006397","mRNA processing", 0.561,-7.098,-2.543, 4.857,-7.5622,0.746,0.318),
c("GO:0072524","pyridine-containing compound metabolic process", 1.351,-6.714, 1.203, 5.239,-11.0376,0.771,0.321),
c("GO:0043620","regulation of DNA-templated transcription in response to stress", 0.027,-4.688,-3.711, 3.543,-6.9830,0.709,0.327),
c("GO:0006259","DNA metabolic process", 5.607,-7.732,-1.699, 5.857,-4.9355,0.712,0.327),
c("GO:0016071","mRNA metabolic process", 0.798,-8.110,-2.018, 5.010,-7.8041,0.759,0.330),
c("GO:0044763","single-organism cellular process",27.536,-0.733, 7.268, 6.548,-19.7167,0.859,0.335),
c("GO:0046939","nucleotide phosphorylation", 0.792,-5.050, 5.510, 5.007,-9.7721,0.663,0.343),
c("GO:0072521","purine-containing compound metabolic process", 2.673,-7.173, 1.268, 5.535,-5.8861,0.750,0.357),
c("GO:0070647","protein modification by small protein conjugation or removal", 0.821,-4.738,-5.609, 5.023,-5.6180,0.811,0.358),
c("GO:0046907","intracellular transport", 1.564, 4.489,-1.491, 5.302,-6.3883,0.927,0.359),
c("GO:0071705","nitrogen compound transport", 1.767, 4.647,-1.483, 5.355,-6.0706,0.949,0.365),
c("GO:0006508","proteolysis", 5.223,-4.557,-4.823, 5.826,-19.2351,0.818,0.369),
c("GO:0001732","formation of cytoplasmic translation initiation complex", 0.004,-3.076,-0.877, 2.749,-6.7190,0.714,0.372),
c("GO:0051641","cellular localization", 2.041, 3.645,-1.247, 5.418,-6.1244,0.949,0.372),
c("GO:0015031","protein transport", 2.251, 5.397,-1.423, 5.461,-8.5200,0.921,0.377),
c("GO:0010038","response to metal ion", 0.132, 3.339,-4.597, 4.229,-4.7144,0.952,0.380),
c("GO:0034660","ncRNA metabolic process", 3.407,-7.259,-1.664, 5.641,-11.1494,0.715,0.391),
c("GO:0009658","chloroplast organization", 0.019, 5.165, 2.231, 3.392,-5.2874,0.894,0.396),
c("GO:0009657","plastid organization", 0.024, 5.121, 2.212, 3.492,-6.0306,0.892,0.404),
c("GO:0019538","protein metabolic process",18.489,-5.549,-4.575, 6.375,-25.3696,0.821,0.408),
c("GO:1901564","organonitrogen compound metabolic process",17.886,-7.151, 0.263, 6.361,-39.6968,0.802,0.415),
c("GO:0006357","regulation of transcription from RNA polymerase II promoter", 1.273,-7.506,-1.115, 5.213,-7.9666,0.624,0.422),
c("GO:0071702","organic substance transport", 4.980, 4.740,-1.495, 5.805,-6.8386,0.944,0.423),
c("GO:0055086","nucleobase-containing small molecule metabolic process", 4.917,-5.768, 5.168, 5.800,-5.6440,0.655,0.426),
c("GO:0010608","posttranscriptional regulation of gene expression", 0.719,-4.132,-6.084, 4.965,-7.2596,0.761,0.427),
c("GO:0009628","response to abiotic stimulus", 0.571, 3.473,-4.852, 4.865,-9.1972,0.951,0.448),
c("GO:0006396","RNA processing", 3.210,-7.316,-2.213, 5.615,-7.4535,0.705,0.453),
c("GO:0019637","organophosphate metabolic process", 6.148,-2.410, 2.702, 5.897,-4.0969,0.786,0.454),
c("GO:0070286","axonemal dynein complex assembly", 0.011, 3.737, 4.684, 3.164,-6.0590,0.817,0.456),
c("GO:0044711","single-organism biosynthetic process",10.864,-4.243, 6.861, 6.144,-17.9172,0.769,0.460),
c("GO:0006090","pyruvate metabolic process", 0.817,-0.826, 7.373, 5.021,-12.8928,0.751,0.475),
c("GO:0006139","nucleobase-containing compound metabolic process",26.547,-7.597, 0.868, 6.532,-28.4855,0.693,0.484),
c("GO:0070207","protein homotrimerization", 0.005, 5.787, 2.118, 2.794,-4.4634,0.880,0.484),
c("GO:0031163","metallo-sulfur cluster assembly", 0.219, 4.662, 2.356, 4.450,-8.5452,0.861,0.494),
c("GO:0010499","proteasomal ubiquitin-independent protein catabolic process", 0.020,-2.286,-4.503, 3.406,-7.4647,0.817,0.498),
c("GO:1901566","organonitrogen compound biosynthetic process",14.064,-7.465, 2.765, 6.256,-17.0273,0.694,0.506),
c("GO:1901698","response to nitrogen compound", 0.178, 3.965,-4.879, 4.359,-4.3625,0.951,0.521),
c("GO:0071826","ribonucleoprotein complex subunit organization", 0.377, 5.904, 2.118, 4.685,-15.7190,0.847,0.523),
c("GO:0034248","regulation of cellular amide metabolic process", 0.700,-5.035,-2.456, 4.954,-5.7144,0.708,0.526),
c("GO:0022411","cellular component disassembly", 0.423, 2.736, 5.239, 4.734,-5.5686,0.802,0.529),
c("GO:0032787","monocarboxylic acid metabolic process", 2.485,-1.293, 7.952, 5.504,-14.7122,0.728,0.539),
c("GO:0016070","RNA metabolic process",15.951,-7.749,-1.311, 6.311,-18.9508,0.662,0.541),
c("GO:1901362","organic cyclic compound biosynthetic process",17.871,-7.241, 2.360, 6.360,-12.8697,0.716,0.545),
c("GO:0019438","aromatic compound biosynthetic process",16.954,-7.388, 2.667, 6.338,-10.0334,0.697,0.552),
c("GO:0034645","cellular macromolecule biosynthetic process",19.291,-6.429,-0.883, 6.394,-18.3747,0.679,0.553),
c("GO:0006413","translational initiation", 0.518,-6.949,-0.596, 4.823,-10.2782,0.695,0.553),
c("GO:0009059","macromolecule biosynthetic process",19.548,-7.267,-1.622, 6.399,-23.2684,0.748,0.556),
c("GO:0018130","heterocycle biosynthetic process",17.388,-7.173, 2.561, 6.348,-13.4724,0.695,0.556),
c("GO:0010035","response to inorganic substance", 0.317, 3.153,-4.428, 4.609,-4.1494,0.949,0.559),
c("GO:0033554","cellular response to stress", 2.967, 2.810,-4.355, 5.581,-7.8633,0.879,0.559),
c("GO:0044267","cellular protein metabolic process",14.293,-6.428,-4.163, 6.263,-14.0655,0.747,0.562),
c("GO:0042221","response to chemical", 3.071, 3.117,-4.552, 5.595,-6.5017,0.944,0.562),
c("GO:0034976","response to endoplasmic reticulum stress", 0.100, 3.561,-5.106, 4.106,-4.0155,0.908,0.564),
c("GO:0006417","regulation of translation", 0.692,-6.381,-1.322, 4.948,-6.1864,0.613,0.570),
c("GO:0003341","cilium movement", 0.023, 0.803, 5.905, 3.467,-4.2882,0.894,0.571),
c("GO:0010468","regulation of gene expression",10.815,-4.869,-5.291, 6.142,-18.0088,0.667,0.575),
c("GO:0006414","translational elongation", 0.777,-7.035,-0.505, 4.999,-5.3242,0.682,0.577),
c("GO:0006094","gluconeogenesis", 0.262,-3.683, 6.625, 4.527,-4.2255,0.748,0.578),
c("GO:0044271","cellular nitrogen compound biosynthetic process",22.502,-7.421, 2.694, 6.460,-23.4191,0.685,0.585),
c("GO:0006082","organic acid metabolic process", 9.086,-2.434, 6.816, 6.067,-23.6253,0.699,0.592),
c("GO:0015833","peptide transport", 0.298, 3.991,-1.323, 4.582,-8.4248,0.948,0.593),
c("GO:0061408","positive regulation of transcription from RNA polymerase II promoter in response to heat stress", 0.003,-3.592,-5.019, 2.646,-7.8794,0.687,0.597),
c("GO:0090304","nucleic acid metabolic process",21.449,-7.334,-0.779, 6.440,-22.4711,0.664,0.597),
c("GO:0009894","regulation of catabolic process", 0.146,-0.745,-4.822, 4.272,-4.1373,0.800,0.601),
c("GO:0043038","amino acid activation", 1.124,-4.146, 6.138, 5.159,-16.6038,0.698,0.605),
c("GO:0019222","regulation of metabolic process",11.942,-0.893,-5.708, 6.185,-13.7011,0.809,0.609),
c("GO:0009132","nucleoside diphosphate metabolic process", 0.698,-5.000, 5.509, 4.952,-8.7471,0.668,0.619),
c("GO:0008380","RNA splicing", 0.413,-7.043,-2.577, 4.725,-7.4547,0.755,0.624),
c("GO:0009266","response to temperature stimulus", 0.213, 2.900,-4.371, 4.436,-6.5918,0.943,0.625),
c("GO:0006464","cellular protein modification process", 7.726,-5.610,-4.152, 5.996,-4.4685,0.753,0.642),
c("GO:0046394","carboxylic acid biosynthetic process", 4.159,-3.897, 6.585, 5.727,-13.1343,0.644,0.644),
c("GO:0016226","iron-sulfur cluster assembly", 0.219, 0.945, 4.217, 4.450,-8.5452,0.757,0.645),
c("GO:0032984","macromolecular complex disassembly", 0.373, 2.966, 5.295, 4.680,-4.2668,0.783,0.654),
c("GO:0016570","histone modification", 0.373,-1.114,-3.504, 4.680,-4.0315,0.735,0.654),
c("GO:0044283","small molecule biosynthetic process", 5.677,-4.008, 6.346, 5.862,-18.8182,0.702,0.654),
c("GO:0022607","cellular component assembly", 2.484, 5.709, 2.127, 5.503,-21.2306,0.835,0.655),
c("GO:1901576","organic substance biosynthetic process",30.365,-6.211, 2.797, 6.591,-40.0535,0.770,0.658),
c("GO:0044085","cellular component biogenesis", 4.355, 5.309, 2.285, 5.747,-4.1530,0.892,0.658),
c("GO:0046034","ATP metabolic process", 1.263,-5.256, 4.982, 5.210,-8.9208,0.617,0.661),
c("GO:0019693","ribose phosphate metabolic process", 3.032,-1.518, 3.026, 5.590,-5.9872,0.764,0.665),
c("GO:0050789","regulation of biological process",19.373,-0.876,-5.673, 6.395,-10.8729,0.830,0.669),
c("GO:0051716","cellular response to stimulus", 9.561, 3.834,-5.038, 6.089,-8.0506,0.874,0.680),
c("GO:0032774","RNA biosynthetic process",10.925,-7.732, 0.388, 6.147,-7.6778,0.614,0.680),
c("GO:0042886","amide transport", 0.337, 4.028,-1.317, 4.636,-8.2104,0.952,0.689),
c("GO:0006996","organelle organization", 3.595, 4.705, 2.372, 5.664,-4.0246,0.837,0.696),
c("GO:0008299","isoprenoid biosynthetic process", 0.442,-3.172, 6.620, 4.754,-5.8894,0.768,0.696),
c("GO:1901605","alpha-amino acid metabolic process", 3.625,-4.694, 5.775, 5.668,-4.3134,0.655,0.698));

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
ex <- one.data [ one.data$log10_p_value < -24, ]; 
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

# ggsave("C:/Users/davidgold/Downloads/revigo-plot.pdf");
