DECLARE
    c_demande DEMANDE_MERGE%ROWTYPE;
    CURSOR demandes IS SELECT * from DEMANDE_MERGE;
BEGIN
    OPEN demandes;
    LOOP
        FETCH demandes into c_demande;
        EXIT WHEN demandes%NOTFOUND;
        
        INSERT INTO DEMANDE (DATEDEMANDE, DATEENLEVEMENT, SIRET, NOTOURNEE, NOSITE) VALUES ( 
            c_demande.DATEDEMANDE, c_demande.DATEDEMANDE, c_demande.SIRET, (SELECT TOURNEE_MERGE.NOTOURNEE_MERGE FROM TOURNEE_MERGE WHERE TOURNEE_MERGE.NOTOURNEE = c_demande.NOTOURNEE), 2
        );
        
        UPDATE DEMANDE_MERGE SET NODEMANDE_MERGE = ( select NODEMANDE from 
            (select NODEMANDE, ROW_NUMBER() OVER (ORDER BY NODEMANDE desc) rno from DEMANDE order by NODEMANDE desc)
            where rno = 1 ) where DEMANDE_MERGE.NODEMANDE = c_demande.NODEMANDE;
        
    END LOOP;
    CLOSE demandes;
END;