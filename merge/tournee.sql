DECLARE
    c_tournee TOURNEE_MERGE%ROWTYPE;
    CURSOR tournees IS SELECT * from TOURNEE_MERGE;
BEGIN
    OPEN tournees;
    LOOP
        FETCH tournees into c_tournee;
        EXIT WHEN tournees%NOTFOUND;
        
        INSERT INTO TOURNEE (DATETOURNEE, NOIMMATRIC, NOEMPLOYE) VALUES ( 
            c_tournee.DATETOURNEE, c_tournee.NOIMMATRIC, (SELECT EMPLOYE_MERGE.NOEMPLOYE_MERGE FROM EMPLOYE_MERGE WHERE EMPLOYE_MERGE.NOEMPLOYE = c_tournee.NOEMPLOYE)
        );      
        
        UPDATE TOURNEE_MERGE SET NOTOURNEE_MERGE = ( select NOTOURNEE from 
            (select NOTOURNEE, ROW_NUMBER() OVER (ORDER BY NOTOURNEE desc) rno from TOURNEE order by NOTOURNEE desc)
            where rno = 1 ) where TOURNEE_MERGE.NOTOURNEE = c_tournee.NOTOURNEE;
        
    END LOOP;
    CLOSE tournees;
END;