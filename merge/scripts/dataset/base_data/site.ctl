load data 
    infile  'site.txt'
INSERT
into table site
fields terminated by ';'
trailing nullcols (
    NOSITE "seq_site.nextval",
    NOMSITE,
    NOVILLE "REPLACE (:NOVILLE,CHR(13),'')" )
