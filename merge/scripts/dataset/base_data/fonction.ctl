load data
   infile 	'fonction.txt'
INSERT 
into table FONCTION
fields terminated by ';' 
trailing nullcols ( NOFONCTION "seq_fonction.nextval",
		    NOMFONCTION )
