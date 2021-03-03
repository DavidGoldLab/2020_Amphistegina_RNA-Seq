

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


# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency_%","plot_X","plot_Y","plot_size","log10_p_value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0006914","autophagy", 0.230,-0.175, 0.192, 4.470,-3.9588,0.959,0.000),
c("GO:0008150","biological_process",100.000,-0.668, 0.782, 7.108,-13.2863,1.000,0.000),
c("GO:0008152","metabolic process",75.387,-0.625, 0.722, 6.986,-16.6554,0.999,0.000),
c("GO:0009987","cellular process",63.780,-0.585, 0.693, 6.913,-11.9337,0.998,0.000),
c("GO:0010243","response to organonitrogen compound", 0.140,-2.740,-1.042, 4.255,-4.1426,0.911,0.000),
c("GO:0016197","endosomal transport", 0.131,-5.337, 4.229, 4.225,-6.3189,0.927,0.000),
c("GO:0044699","single-organism process",46.569,-0.736, 1.407, 6.776,-3.8465,0.997,0.000),
c("GO:0050896","response to stimulus",12.210,-0.820, 1.350, 6.195,-3.5294,0.995,0.000),
c("GO:0051179","localization",18.495,-0.283, 0.236, 6.375,-3.1484,0.995,0.000),
c("GO:0051704","multi-organism process", 0.751,-1.157, 1.379, 4.984,-1.6986,0.994,0.000),
c("GO:0065007","biological regulation",20.498,-0.549, 0.641, 6.420,-3.0760,0.995,0.000),
c("GO:0071840","cellular component organization or biogenesis", 8.568,-0.881, 1.394, 6.041,-2.0629,0.994,0.000),
c("GO:1901575","organic substance catabolic process", 4.612,-1.279,-2.009, 5.772,-12.1329,0.839,0.000),
c("GO:0009056","catabolic process", 4.820,-0.805, 1.158, 5.791,-12.6760,0.970,0.023),
c("GO:0042026","protein refolding", 0.069,-1.190, 1.419, 3.949,-1.9650,0.963,0.024),
c("GO:0016236","macroautophagy", 0.084,-0.483, 0.469, 4.031,-2.7240,0.958,0.025),
c("GO:0016050","vesicle organization", 0.130,-0.372,-0.671, 4.221,-3.4026,0.896,0.026),
c("GO:0006457","protein folding", 0.903,-0.182, 0.397, 5.064,-1.9693,0.954,0.030),
c("GO:0044238","primary metabolic process",53.743,-1.626, 1.424, 6.839,-14.8719,0.957,0.038),
c("GO:0032268","regulation of cellular protein metabolic process", 1.473, 0.095,-7.690, 5.277,-4.4290,0.656,0.061),
c("GO:0072524","pyridine-containing compound metabolic process", 1.351, 4.874, 0.285, 5.239,-1.7467,0.853,0.070),
c("GO:0044723","single-organism carbohydrate metabolic process", 2.457, 4.715, 4.492, 5.499,-2.1624,0.857,0.073),
c("GO:0009058","biosynthetic process",31.611,-0.842, 1.213, 6.608,-3.7659,0.961,0.078),
c("GO:0051186","cofactor metabolic process", 3.985, 1.448, 0.164, 5.709,-3.3909,0.909,0.080),
c("GO:0000910","cytokinesis", 0.315, 3.192, 3.577, 4.606,-2.0134,0.885,0.086),
c("GO:0006807","nitrogen compound metabolic process",38.744,-1.019, 0.960, 6.696,-13.2364,0.959,0.089),
c("GO:0006732","coenzyme metabolic process", 3.111, 1.990, 0.692, 5.601,-2.1239,0.879,0.089),
c("GO:0044237","cellular metabolic process",53.061, 2.471, 0.511, 6.833,-14.4987,0.907,0.111),
c("GO:0043170","macromolecule metabolic process",39.491, 2.548,-1.319, 6.705,-11.6790,0.905,0.112),
c("GO:0005975","carbohydrate metabolic process", 5.260, 0.820,-0.085, 5.829,-2.3247,0.922,0.116),
c("GO:0071704","organic substance metabolic process",58.357,-1.047, 1.234, 6.874,-14.7916,0.956,0.120),
c("GO:1901135","carbohydrate derivative metabolic process", 6.319, 0.294, 0.442, 5.909,-1.4101,0.930,0.122),
c("GO:0044710","single-organism metabolic process",31.682, 2.409, 4.963, 6.609,-5.5826,0.898,0.168),
c("GO:0019682","glyceraldehyde-3-phosphate metabolic process", 0.444, 4.228, 2.924, 4.755,-2.0785,0.781,0.172),
c("GO:0046483","heterocycle metabolic process",29.664, 4.040, 0.149, 6.580,-4.6570,0.876,0.176),
c("GO:0022900","electron transport chain", 0.564, 3.745, 3.897, 4.860,-1.6428,0.856,0.177),
c("GO:0006793","phosphorus metabolic process",13.507, 3.457, 0.350, 6.239,-4.2294,0.892,0.185),
c("GO:0007041","lysosomal transport", 0.017,-4.910, 3.950, 3.341,-1.7221,0.930,0.187),
c("GO:0032509","endosome transport via multivesicular body sorting pathway", 0.022,-5.100, 4.056, 3.443,-2.6516,0.925,0.190),
c("GO:0019538","protein metabolic process",18.489, 2.949,-3.959, 6.375,-10.5738,0.863,0.190),
c("GO:1901564","organonitrogen compound metabolic process",17.886, 5.168,-0.498, 6.361,-15.1927,0.873,0.193),
c("GO:0016482","cytosolic transport", 0.076,-4.819, 3.981, 3.988,-1.6958,0.904,0.207),
c("GO:1901360","organic cyclic compound metabolic process",30.324, 2.064,-0.915, 6.590,-4.4902,0.910,0.211),
c("GO:1901576","organic substance biosynthetic process",30.365, 5.289,-0.976, 6.591,-3.6878,0.855,0.211),
c("GO:0043903","regulation of symbiosis, encompassing mutualism through parasitism", 0.039,-2.254,-6.291, 3.701,-2.1323,0.858,0.219),
c("GO:0006629","lipid metabolic process", 3.522, 4.111, 3.533, 5.655,-1.6700,0.865,0.223),
c("GO:0048193","Golgi vesicle transport", 0.297,-4.934, 4.078, 4.581,-3.3611,0.909,0.230),
c("GO:0007034","vacuolar transport", 0.133,-5.128, 4.138, 4.231,-3.2587,0.927,0.230),
c("GO:0006839","mitochondrial transport", 0.182,-5.645, 4.402, 4.369,-1.5405,0.925,0.236),
c("GO:0006725","cellular aromatic compound metabolic process",29.628, 3.925, 0.133, 6.580,-4.5717,0.876,0.245),
c("GO:0040008","regulation of growth", 0.172,-2.169,-6.252, 4.343,-3.3132,0.851,0.250),
c("GO:0032006","regulation of TOR signaling", 0.038,-3.121,-5.861, 3.691,-1.5364,0.799,0.256),
c("GO:0051338","regulation of transferase activity", 0.368,-2.353,-6.936, 4.674,-1.8824,0.847,0.257),
c("GO:0051604","protein maturation", 0.293, 1.710,-4.386, 4.575,-1.6898,0.872,0.274),
c("GO:0043412","macromolecule modification", 9.785, 2.232,-3.730, 6.099,-4.2735,0.881,0.280),
c("GO:0044281","small molecule metabolic process",15.138, 3.807, 4.156, 6.288,-3.8105,0.869,0.300),
c("GO:0048518","positive regulation of biological process", 1.744,-2.684,-7.491, 5.350,-1.8306,0.834,0.320),
c("GO:0071702","organic substance transport", 4.980,-5.817, 4.562, 5.805,-3.2032,0.899,0.324),
c("GO:0048523","negative regulation of cellular process", 1.830,-2.633,-7.617, 5.371,-2.7014,0.742,0.330),
c("GO:0048519","negative regulation of biological process", 1.984,-2.687,-7.551, 5.406,-2.8466,0.832,0.334),
c("GO:0044763","single-organism cellular process",27.536, 3.192, 4.493, 6.548,-3.1048,0.881,0.335),
c("GO:0032879","regulation of localization", 0.726,-6.585,-2.264, 4.969,-1.7188,0.793,0.347),
c("GO:0072521","purine-containing compound metabolic process", 2.673, 5.403, 0.263, 5.535,-1.3582,0.839,0.357),
c("GO:0032940","secretion by cell", 0.763,-2.099, 6.331, 4.991,-1.6507,0.806,0.363),
c("GO:0070647","protein modification by small protein conjugation or removal", 0.821, 2.248,-4.705, 5.023,-4.3304,0.816,0.370),
c("GO:0016192","vesicle-mediated transport", 1.085,-5.601, 4.449, 5.144,-2.5758,0.913,0.380),
c("GO:0006139","nucleobase-containing compound metabolic process",26.547, 6.854,-0.427, 6.532,-3.8939,0.791,0.381),
c("GO:0006418","tRNA aminoacylation for protein translation", 1.099, 6.775,-0.517, 5.149,-3.5826,0.673,0.382),
c("GO:0006950","response to stress", 4.575,-2.881,-1.152, 5.769,-3.3877,0.935,0.382),
c("GO:0006508","proteolysis", 5.223, 2.267,-4.041, 5.826,-10.8304,0.837,0.384),
c("GO:0009408","response to heat", 0.166,-2.754,-1.073, 4.328,-3.2297,0.945,0.389),
c("GO:0042325","regulation of phosphorylation", 0.468,-0.621,-6.508, 4.779,-1.8307,0.687,0.396),
c("GO:0051641","cellular localization", 2.041,-5.026, 4.144, 5.418,-1.9406,0.910,0.399),
c("GO:0051174","regulation of phosphorus metabolic process", 0.580,-0.619,-6.229, 4.872,-1.5393,0.714,0.405),
c("GO:0071705","nitrogen compound transport", 1.767,-5.743, 4.501, 5.355,-3.1087,0.909,0.407),
c("GO:0044260","cellular macromolecule metabolic process",34.276, 5.329,-3.317, 6.643,-8.6347,0.811,0.408),
c("GO:0006820","anion transport", 1.956,-5.982, 4.695, 5.400,-1.3969,0.903,0.413),
c("GO:0010608","posttranscriptional regulation of gene expression", 0.719,-0.537,-7.551, 4.965,-2.7976,0.760,0.414),
c("GO:0015031","protein transport", 2.251,-6.087, 4.780, 5.461,-3.1219,0.874,0.421),
c("GO:0061024","membrane organization", 0.759,-0.273,-0.704, 4.989,-2.5609,0.887,0.423),
c("GO:0033036","macromolecule localization", 3.030,-5.492, 4.384, 5.590,-2.5955,0.907,0.423),
c("GO:0055086","nucleobase-containing small molecule metabolic process", 4.917, 7.406, 2.925, 5.800,-1.4864,0.744,0.426),
c("GO:0061025","membrane fusion", 0.145,-0.240,-0.606, 4.269,-2.2141,0.892,0.427),
c("GO:0097576","vacuole fusion", 0.032,-0.093,-0.529, 3.613,-1.8614,0.903,0.436),
c("GO:0051607","defense response to virus", 0.098,-2.933,-1.094, 4.098,-1.7552,0.942,0.442),
c("GO:0034976","response to endoplasmic reticulum stress", 0.100,-3.932,-1.353, 4.106,-1.6286,0.914,0.442),
c("GO:0009240","isopentenyl diphosphate biosynthetic process", 0.163, 5.712, 2.387, 4.320,-1.4974,0.772,0.442),
c("GO:0007030","Golgi organization", 0.039,-0.047,-0.535, 3.701,-1.8151,0.902,0.442),
c("GO:0031163","metallo-sulfur cluster assembly", 0.219,-0.003,-0.577, 4.450,-1.4229,0.889,0.443),
c("GO:0051246","regulation of protein metabolic process", 1.551,-0.119,-7.651, 5.299,-4.1076,0.716,0.453),
c("GO:0050789","regulation of biological process",19.373,-2.415,-7.285, 6.395,-3.4620,0.788,0.453),
c("GO:0044711","single-organism biosynthetic process",10.864, 6.323, 3.804, 6.144,-2.4189,0.835,0.462),
c("GO:0016570","histone modification", 0.373, 1.552,-3.465, 4.680,-2.2346,0.764,0.465),
c("GO:0016567","protein ubiquitination", 0.523, 2.009,-4.072, 4.827,-3.1744,0.801,0.470),
c("GO:0022411","cellular component disassembly", 0.423, 2.673, 2.337, 4.734,-1.4684,0.833,0.471),
c("GO:0007033","vacuole organization", 0.102,-0.030,-0.537, 4.119,-3.1340,0.898,0.474),
c("GO:0006090","pyruvate metabolic process", 0.817, 4.527, 4.075, 5.021,-2.5360,0.800,0.475),
c("GO:0048284","organelle fusion", 0.114,-0.075,-0.598, 4.165,-3.0996,0.897,0.478),
c("GO:0034641","cellular nitrogen compound metabolic process",34.137, 5.604, 0.236, 6.641,-3.7929,0.832,0.484),
c("GO:0010499","proteasomal ubiquitin-independent protein catabolic process", 0.020, 0.665,-4.131, 3.406,-3.6123,0.810,0.498),
c("GO:0009605","response to external stimulus", 1.370,-3.229,-1.291, 5.245,-1.3112,0.941,0.501),
c("GO:0044571","[2Fe-2S] cluster assembly", 0.019, 2.461, 0.502, 3.385,-1.7679,0.849,0.514),
c("GO:2000144","positive regulation of DNA-templated transcription, initiation", 0.018, 1.749,-6.077, 3.363,-2.0178,0.689,0.514),
c("GO:1901698","response to nitrogen compound", 0.178,-4.110,-1.199, 4.359,-3.6333,0.935,0.523),
c("GO:0034248","regulation of cellular amide metabolic process", 0.700, 0.732,-6.491, 4.954,-2.5557,0.736,0.526),
c("GO:0007005","mitochondrion organization", 0.418,-0.048,-0.573, 4.729,-1.9558,0.886,0.529),
c("GO:0032787","monocarboxylic acid metabolic process", 2.485, 5.944, 4.843, 5.504,-3.0214,0.779,0.539),
c("GO:0016070","RNA metabolic process",15.951, 6.673,-2.639, 6.311,-2.3993,0.758,0.541),
c("GO:1901362","organic cyclic compound biosynthetic process",17.871, 6.206, 0.180, 6.360,-3.0146,0.823,0.545),
c("GO:0009081","branched-chain amino acid metabolic process", 0.463, 6.254, 3.627, 4.774,-1.6377,0.797,0.551),
c("GO:0051240","positive regulation of multicellular organismal process", 0.303,-2.283,-7.136, 4.589,-1.4775,0.788,0.552),
c("GO:0019438","aromatic compound biosynthetic process",16.954, 6.961, 0.516, 6.338,-2.7662,0.803,0.552),
c("GO:0018130","heterocycle biosynthetic process",17.388, 6.814, 0.504, 6.348,-2.7424,0.802,0.556),
c("GO:0046903","secretion", 0.810,-5.126, 4.916, 5.017,-1.8021,0.867,0.557),
c("GO:0009059","macromolecule biosynthetic process",19.548, 5.369,-3.488, 6.399,-1.4508,0.826,0.558),
c("GO:0044267","cellular protein metabolic process",14.293, 4.558,-4.291, 6.263,-3.6818,0.778,0.562),
c("GO:0042221","response to chemical", 3.071,-3.207,-1.292, 5.595,-1.6945,0.937,0.562),
c("GO:0001731","formation of translation preinitiation complex", 0.070, 4.464,-2.438, 3.954,-1.8268,0.751,0.568),
c("GO:0009767","photosynthetic electron transport chain", 0.025, 2.802, 3.282, 3.501,-1.4229,0.888,0.573),
c("GO:0031329","regulation of cellular catabolic process", 0.093,-2.412,-7.214, 4.078,-2.0005,0.730,0.574),
c("GO:0044271","cellular nitrogen compound biosynthetic process",22.502, 7.409, 0.482, 6.460,-1.3019,0.795,0.587),
c("GO:0019693","ribose phosphate metabolic process", 3.032, 2.872, 0.085, 5.590,-2.0497,0.778,0.587),
c("GO:0006468","protein phosphorylation", 4.137, 4.092,-3.582, 5.725,-1.8761,0.691,0.592),
c("GO:0006082","organic acid metabolic process", 9.086, 5.742, 3.674, 6.067,-4.4758,0.754,0.592),
c("GO:0015833","peptide transport", 0.298,-5.290, 4.292, 4.582,-3.1219,0.903,0.593),
c("GO:0033554","cellular response to stress", 2.967,-3.101,-1.339, 5.581,-1.8869,0.886,0.593),
c("GO:0032774","RNA biosynthetic process",10.925, 7.344,-2.026, 6.147,-2.5738,0.740,0.597),
c("GO:0090304","nucleic acid metabolic process",21.449, 6.389,-2.303, 6.440,-2.5517,0.759,0.597),
c("GO:0016043","cellular component organization", 7.239,-0.276,-0.760, 5.968,-2.2209,0.866,0.599),
c("GO:0006810","transport",17.616,-6.010, 4.734, 6.354,-3.2282,0.884,0.600),
c("GO:0009894","regulation of catabolic process", 0.146,-2.141,-6.472, 4.272,-2.5003,0.767,0.601),
c("GO:0051091","positive regulation of sequence-specific DNA binding transcription factor activity", 0.050, 2.117,-6.433, 3.806,-1.3174,0.717,0.604),
c("GO:0043038","amino acid activation", 1.124, 6.215, 3.454, 5.159,-3.5826,0.778,0.605),
c("GO:1901616","organic hydroxy compound catabolic process", 0.169,-1.392,-1.835, 4.336,-1.4446,0.882,0.610),
c("GO:0009132","nucleoside diphosphate metabolic process", 0.698, 6.767, 2.231, 4.952,-2.0190,0.722,0.619),
c("GO:0090090","negative regulation of canonical Wnt signaling pathway", 0.025,-1.493,-5.719, 3.513,-1.6226,0.738,0.626),
c("GO:0046939","nucleotide phosphorylation", 0.792, 6.840, 2.235, 5.007,-2.0190,0.713,0.628),
c("GO:0018193","peptidyl-amino acid modification", 1.495, 2.752,-5.091, 5.283,-1.7631,0.804,0.640),
c("GO:0046394","carboxylic acid biosynthetic process", 4.159, 6.851, 3.336, 5.727,-1.9676,0.735,0.644),
c("GO:0051321","meiotic cell cycle", 0.176, 3.149, 3.618, 4.353,-1.3768,0.891,0.644),
c("GO:0051348","negative regulation of transferase activity", 0.088,-2.329,-6.685, 4.053,-2.0710,0.860,0.646),
c("GO:0044283","small molecule biosynthetic process", 5.677, 6.022, 3.060, 5.862,-1.7073,0.789,0.654),
c("GO:0046653","tetrahydrofolate metabolic process", 0.251, 6.367, 2.592, 4.508,-1.4413,0.779,0.654),
c("GO:0044249","cellular biosynthetic process",30.048, 6.357,-0.160, 6.586,-3.5452,0.827,0.658),
c("GO:0006796","phosphate-containing compound metabolic process",13.110, 5.051, 0.180, 6.226,-3.9205,0.785,0.664),
c("GO:0046034","ATP metabolic process", 1.263, 6.821, 2.109, 5.210,-2.1468,0.689,0.665),
c("GO:0060255","regulation of macromolecule metabolic process",11.716,-0.017,-7.244, 6.177,-3.4122,0.675,0.666),
c("GO:0019222","regulation of metabolic process",11.942,-2.421,-7.289, 6.185,-3.0738,0.774,0.669),
c("GO:0046490","isopentenyl diphosphate metabolic process", 0.163, 4.409, 2.977, 4.320,-1.4974,0.794,0.679),
c("GO:0051716","cellular response to stimulus", 9.561,-4.229,-1.387, 6.089,-1.8619,0.879,0.680),
c("GO:0046942","carboxylic acid transport", 1.022,-5.162, 5.050, 5.118,-3.0446,0.847,0.681),
c("GO:0015849","organic acid transport", 1.024,-4.902, 4.799, 5.119,-3.0446,0.854,0.681),
c("GO:0031668","cellular response to extracellular stimulus", 0.436,-2.967,-1.250, 4.748,-1.4726,0.903,0.684),
c("GO:0042886","amide transport", 0.337,-5.349, 4.261, 4.636,-3.1219,0.917,0.689),
c("GO:0006325","chromatin organization", 0.668,-0.177,-0.779, 4.933,-1.8768,0.878,0.689),
c("GO:0000281","mitotic cytokinesis", 0.070, 3.048, 3.946, 3.953,-2.0134,0.897,0.692),
c("GO:0031047","gene silencing by RNA", 0.089, 1.160,-6.017, 4.056,-1.4159,0.705,0.697),
c("GO:0007006","mitochondrial membrane organization", 0.065, 2.180, 1.882, 3.922,-1.6160,0.843,0.698),
c("GO:0006778","porphyrin-containing compound metabolic process", 0.457, 6.266, 0.925, 4.768,-1.3332,0.845,0.699));

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
p1 <- p1 + scale_colour_gradientn( colours = c("blue", "blue"), limits = c( min(one.data$log10_p_value), 0) );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = log10_p_value), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_size_area();
ex <- one.data [ one.data$log10_p_value < -10, ]; 
p1 <- p1 + geom_label_repel( data = ex, aes(plot_X, plot_Y, label = description), force = 1, size = 8);
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
