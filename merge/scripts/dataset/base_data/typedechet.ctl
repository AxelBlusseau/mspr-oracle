load data
   infile 	'typedechet.txt'
INSERT 
into table TYPEDECHET
fields terminated by ';' 
trailing nullcols ( NOTYPEDECHET   "seq_typedechet.nextval",
		    NOMTYPEDECHET,
		    NIVDANGER,
		    VOLUMEUNITAIRE,
		    SEUIL,
		    TARIFFORFAITAIRE, 
		    TARIFLOT "REPLACE (:TARIFLOT,CHR(13),'')" )
