load data
   infile 	'detaildemande.txt'
INSERT 
into table DETAILDEMANDE
fields terminated by ';' 
trailing nullcols ( QUANTITEENLEVEE,
		    REMARQUE,
		    NODEMANDE,
		    NOTYPEDECHET "REPLACE (:NOTYPEDECHET,CHR(13),'')")
