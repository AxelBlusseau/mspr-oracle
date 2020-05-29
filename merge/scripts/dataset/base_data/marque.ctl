load data
   infile 	'marque.txt'
INSERT 
into table MARQUE
fields terminated by ';' 
trailing nullcols ( NOMARQUE   "seq_marque.nextval",
		    NOMMARQUE )
