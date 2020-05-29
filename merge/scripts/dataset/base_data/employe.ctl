load data
   infile 	'employe.txt'
INSERT 
into table EMPLOYE
fields terminated by ';' 
trailing nullcols ( NOEMPLOYE   "seq_employe.nextval",
		    NOM,
		    PRENOM,
		    DATENAISS "to_date(:DATENAISS,'DD/MM/YYYY')",
		    DATEEMBAUCHE "to_date(:DATEEMBAUCHE,'DD/MM/YYYY')",
		    SALAIRE,
		    NOFONCTION "REPLACE (:NOFONCTION,CHR(13),'')" )
