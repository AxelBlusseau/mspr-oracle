DECLARE
    c_employe EMPLOYE_MERGE%ROWTYPE;
    CURSOR employes IS SELECT * from EMPLOYE_MERGE;
BEGIN
    OPEN employes;
    LOOP
        FETCH employes into c_employe;
        EXIT WHEN employes%NOTFOUND;
        
        INSERT INTO EMPLOYE (NOM, PRENOM, DATENAISS, dateembauche, SALAIRE, NOFONCTION) VALUES ( 
            c_employe.NOM, c_employe.PRENOM, c_employe.DATENAISS, c_employe.dateembauche, c_employe.SALAIRE, c_employe.NOFONCTION
        );      
        
        UPDATE EMPLOYE_MERGE SET NOEMPLOYE_MERGE = ( select NOEMPLOYE from 
            (select NOEMPLOYE, ROW_NUMBER() OVER (ORDER BY NOEMPLOYE desc) rno from EMPLOYE order by NOEMPLOYE desc)
            where rno = 1 ) where EMPLOYE_MERGE.NOEMPLOYE = c_employe.NOEMPLOYE;
        
    END LOOP;
    CLOSE employes;
END;