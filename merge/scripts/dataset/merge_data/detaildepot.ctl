load data
   infile  'detaildepot.txt'
INSERT
into table DETAILDEPOT
fields terminated by ';'
trailing nullcols ( QUANTITEDEPOSEE,
                    REMARQUE,
                    NOTOURNEE,
                    NOTYPEDECHET,
                    NOCENTRE "REPLACE (:NOCENTRE,CHR(13),'')" )
