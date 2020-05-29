load data 
    infile  'ville.txt'
INSERT
into table ville
fields terminated by ';'
trailing nullcols (
    NOVILLE "seq_ville.nextval",
    VILLE,
    ZIP "REPLACE (:ZIP,CHR(13),'')")
