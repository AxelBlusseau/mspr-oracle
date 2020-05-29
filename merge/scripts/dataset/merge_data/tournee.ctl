load data
   infile 	'tournee.txt'
INSERT 
into table TOURNEE_MERGE
fields terminated by ';' 
trailing nullcols ( NOTOURNEE  "seq_tournee_merge.nextval",
		    DATETOURNEE "to_date(:DATETOURNEE,'DD/MM/YYYY')",
		    NOIMMATRIC,
		    NOEMPLOYE "REPLACE (:NOEMPLOYE,CHR(13),'')" )
