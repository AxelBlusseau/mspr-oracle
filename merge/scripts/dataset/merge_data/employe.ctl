load data
   infile 	'employe.txt'
INSERT 
into table EMPLOYE_MERGE
fields terminated by ';' 
trailing nullcols ( NOEMPLOYE   "seq_employe_merge.nextval",
		    NOM,
		    PRENOM,
		    DATENAISS "to_date(:DATENAISS,'DD/MM/YYYY')",
		    DATEEMBAUCHE "to_date(:DATEEMBAUCHE,'DD/MM/YYYY')",
		    SALAIRE,
		    NOFONCTION "REPLACE (:NOFONCTION,CHR(13),'')" )
