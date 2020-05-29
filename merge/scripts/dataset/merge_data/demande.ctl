load data 
    infile  'demande.txt'
INSERT
into table demande_MERGE
fields terminated by ';'
trailing nullcols (
    NODEMANDE "seq_demande_merge.nextval",
    DATEDEMANDE "to_date(:DATEDEMANDE, 'DD/MM/YYYY')",
    DATEENLEVEMENT "to_date(:DATEENLEVEMENT, 'DD/MM/YYYY')",
    SIRET,
    NOTOURNEE "REPLACE (:NOTOURNEE,CHR(13),'')" )
