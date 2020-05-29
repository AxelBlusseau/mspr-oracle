load data
   infile 	'entreprise.txt'
INSERT 
into table ENTREPRISE 
fields terminated by ';' 
trailing nullcols ( SIRET,
		    RAISONSOCIALE,
		    NORUEENTR,
		    RUEENTR,
		    NOTEL,
		    CONTACT,
		    NOVILLE "REPLACE (:NOVILLE,CHR(13),'')" )
