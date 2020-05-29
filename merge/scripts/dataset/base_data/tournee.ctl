load data
   infile 	'tournee.txt'
INSERT 
into table TOURNEE
fields terminated by ';' 
trailing nullcols ( NOTOURNEE  "seq_tournee.nextval",
		    DATETOURNEE "to_date(:DATETOURNEE,'DD/MM/YYYY')",
		    NOIMMATRIC,
		    NOEMPLOYE "REPLACE (:NOEMPLOYE,CHR(13),'')" )
