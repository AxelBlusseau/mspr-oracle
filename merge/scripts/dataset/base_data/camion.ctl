load data
   infile 	'camion.txt'
INSERT 
into table CAMION
fields terminated by ';' 
trailing nullcols ( NOIMMATRIC,
		    DATEACHAT "to_date(:DATEACHAT,'DD/MM/YYYY')",
		    NOMODELE,
		    NOSITE  "REPLACE (:NOSITE,CHR(13),'')")
