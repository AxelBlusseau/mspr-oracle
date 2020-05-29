load data 
    infile  'demande.txt'
INSERT
into table demande
fields terminated by ';'
trailing nullcols (
    NODEMANDE "seq_demande.nextval",
    DATEDEMANDE "to_date(:DATEDEMANDE, 'DD/MM/YYYY')",
    DATEENLEVEMENT "to_date(:DATEENLEVEMENT, 'DD/MM/YYYY')",
    SIRET,
    NOTOURNEE,
    NOSITE "REPLACE (:NOTOURNEE,CHR(13),'')" )
