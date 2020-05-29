load data
   infile 	'centre.txt'
INSERT 
into table CENTRETRAITEMENT_MERGE
fields terminated by ';' 
trailing nullcols ( NOCENTRE   "seq_centre_merge.nextval",
		    NOMCENTRE,
		    NORUECENTRE,
		    RUECENTRE,
		    CPOSTALCENTRE,
		    VILLECENTRE )
