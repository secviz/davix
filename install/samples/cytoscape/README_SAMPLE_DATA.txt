README.txt:
	
	This directory contains sample data for Cytoscape. It includes the
	following data sets:

----------------------------------------------------------------------------

galFiltered.sif
galFiltered.gml
galFiltered.xgmml
galExpData.pvals

galFiltered.cys

These files contain an interaction network and expression data from
the paper:

Ideker, T., Thorsson V, Ranish JA, Christmas R, Buhler J, Eng JK, Bumgarner R,
Goodlett DR, Aebersold R, Hood L. Integrated genomic and proteomic analyses of
a systematically perturbed metabolic network. Science, 292, 929-34 (2001).

The 'galExpData.pvals' file contains 20 experimental conditions involving
systematic perturbations of the galactose utilization pathway in yeast.
The 'galFiltered.*' files contain an interaction network of 331 genes that
were significantly differentially expressed in at least one of the 20
experimental conditions. The two network files are identical networks in
different formats; the '.sif' is in the simple interactions format,
the '.gml' is in GML format, and '.xgmml' is in XGMML format.

The 'galFiltered.cys' is a CYtoscape Session file contains network data, 
attributes, and desktop states.

----------------------------------------------------------------------------

BINDyeast.sif

This is a Cytoscape network containing all of the yeast interactions known
to the BIND database (http://www.bind.ca) circa 10/10/2006.

----------------------------------------------------------------------------

BINDhuman.sif

This is a Cytoscape network containing all of the human interactions known
to the BIND database (http://www.bind.ca) circa 10/10/2006.

----------------------------------------------------------------------------

yeastHighQuality.sif

This is a Cytoscape network combining two public data sets of high quality
interactions in yeast. It includes:

2455 high-confidence protein-protein interactions from the paper

von Mering C, Krause R, Snel B, Cornell M, Oliver SG, Fields S, Bork P.
Comparative assessment of large-scale data sets of protein-protein
interactions. Nature, 417, 399-403, May 2002.

and 4433 high confidence protein-dna interactions (p-values < 0.001) from
the paper

Lee, T.I., Rinaldi, N.J., Robert, F., Odom, D.T., Bar-Joseph, Z., Gerber, G.K.,
Hannett, N.M., Harbison, C.R., Thompson, C.M., Simon I., Zeitlinger J.,
Jennings, E.G., Murray, H.L., Gordon, D.B., Ren, B., Wyrick, J.J., Tagne, J.,
Volkert T.L., Fraenkel, E., Gifford D.K., and Young, R.A.
Transcriptional regulatory networks in Saccharomyces cerevisiae.
Science, 298: 799-804 (2002).
http://web.wi.mit.edu/young/regulator_network/

