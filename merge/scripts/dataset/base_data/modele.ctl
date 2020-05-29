load data
   infile 	'modele.txt'
INSERT 
into table MODELE
fields terminated by ';' 
trailing nullcols ( NOMODELE  "seq_modele.nextval",
		    NOMMODELE,
		    NOMARQUE "REPLACE (:NOMARQUE,CHR(13),'')")
