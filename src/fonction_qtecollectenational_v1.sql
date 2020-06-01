--Exemple d'utilisation
--select qtecollectenational('Papier', '01/09/2018', '30/09/2028') from dual;

create or replace FUNCTION QTECOLLECTENATIONAL 
( p_nomtypedechet in varchar2, p_datedebut in date , p_datefin in date) 
RETURN NUMBER 
IS 
    qte_collecte NUMBER(10);
    v_site site.nosite%type;
    CURSOR c_sites IS SELECT s.nosite FROM site s;
BEGIN
    qte_collecte := 0;
    
    OPEN c_sites;
    LOOP
        FETCH c_sites INTO v_site;
        EXIT WHEN c_sites%NOTFOUND;
        
        qte_collecte := qte_collecte + qtecollectesite(v_site, p_nomtypedechet, p_datedebut, p_datefin);
        
    END LOOP;
    CLOSE c_sites;

  RETURN(qte_collecte);

END QTECOLLECTENATIONAL;