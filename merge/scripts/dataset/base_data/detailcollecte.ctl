load data
   infile 	'detailcollecte.txt'
INSERT 
into table DETAILCOLLECTE
fields terminated by ';' 
trailing nullcols ( QUANTITEENLEVEE,
		    REMARQUE,
		    NODEMANDE,
		    NOTYPEDECHET "REPLACE (:NOTYPEDECHET,CHR(13),'')")
