DECLARE
    c_dd DETAILDEPOT_MERGE%ROWTYPE;
    CURSOR detaildepot IS SELECT * from DETAILDEPOT_MERGE;
BEGIN
    OPEN detaildepot;
    LOOP
        FETCH detaildepot into c_dd;
        EXIT WHEN detaildepot%NOTFOUND;
        
        INSERT INTO DETAILDEPOT (quantitedeposee, remarque, notournee, notypedechet, nocentre) VALUES ( 
            c_dd.quantitedeposee, c_dd.remarque, (SELECT TOURNEE_MERGE.NOTOURNEE_MERGE FROM TOURNEE_MERGE WHERE TOURNEE_MERGE.NOTOURNEE = c_dd.notournee), c_dd.notypedechet, (SELECT centretraitement_merge.nocentre_merge FROM CENTRETRAITEMENT_MERGE WHERE centretraitement_merge.nocentre = c_dd.nocentre)
            );
        
    END LOOP;
    CLOSE detaildepot;
END;