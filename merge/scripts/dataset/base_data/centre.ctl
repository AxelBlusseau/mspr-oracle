load data
   infile 	'centre.txt'
INSERT 
into table CENTRETRAITEMENT
fields terminated by ';' 
trailing nullcols ( NOCENTRE   "seq_centre.nextval",
		    NOMCENTRE,
		    NORUECENTRE,
		    RUECENTRE,
		    NOVILLE "REPLACE (:NOVILLE,CHR(13),'')" )
