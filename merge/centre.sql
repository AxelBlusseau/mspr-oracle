DECLARE
    v_count number :=0;
    c_centre CENTRETRAITEMENT_MERGE%ROWTYPE;
    CURSOR centres IS SELECT * from CENTRETRAITEMENT_MERGE;
BEGIN
    OPEN centres;
    LOOP
        FETCH centres into c_centre;
        EXIT WHEN centres%NOTFOUND;
        
        SELECT count(*) into v_count from ville where ville = c_centre.villecentre and zip = c_centre.CPOSTALCENTRE;
        
        if v_count = 0 then
            INSERT INTO VILLE (VILLE, ZIP) values (c_centre.villecentre, c_centre.CPOSTALCENTRE);
        end if;
        
        INSERT INTO CENTRETRAITEMENT (NOMCENTRE, NORUECENTRE, RUECENTRE, NOVILLE) VALUES ( 
            c_centre.NOMCENTRE, c_centre.NORUECENTRE, c_centre.RUECENTRE,
            (SELECT NOVILLE FROM VILLE WHERE VILLE = c_centre.VILLECENTRE and ZIP = c_centre.CPOSTALCENTRE)
        );      
        
        UPDATE CENTRETRAITEMENT_MERGE SET NOCENTRE_MERGE = ( select NoCentre from 
            (select NoCentre, ROW_NUMBER() OVER (ORDER BY NoCentre desc) rno from centretraitement order by NoCentre desc)
            where rno = 1 ) where CENTRETRAITEMENT_MERGE.nocentre = c_centre.nocentre;
        
    END LOOP;
    CLOSE centres;
END;