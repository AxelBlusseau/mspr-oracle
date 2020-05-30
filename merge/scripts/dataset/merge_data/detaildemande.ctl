load data 
    infile  'detaildemande.txt'
INSERT
into table DETAILDEMANDE_MERGE
fields terminated by ';'
trailing nullcols ( QUANTITEENLEVEE,
                    REMARQUE,
                    NODEMANDE,
                    NOTYPEDECHET "REPLACE (:NOTYPEDECHET,CHR(13),'')")