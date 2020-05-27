--Exemple d'utilisation
--select qtecollectesite(1, 'Papier', '01/09/2018', '30/09/2028') from dual;

create or replace FUNCTION QTECOLLECTESITE 
( p_nosite in number, p_nomtypedechet in varchar2, p_datedebut in date , p_datefin in date) 
RETURN NUMBER 
IS qte_collecte NUMBER(10);
BEGIN

    SELECT SUM(dc.quantiteenlevee)
    INTO qte_collecte
    FROM detailcollecte dc
    JOIN typedechet td on dc.notypedechet = td.notypedechet 
    JOIN demande d on dc.nodemande = d.nodemande
    JOIN tournee t on d.notournee = t.notournee
    JOIN site s on d.nosite = s.nosite
    WHERE t.datetournee BETWEEN p_datedebut AND p_datefin
    AND td.nomtypedechet = p_nomtypedechet
    AND s.nosite = p_nosite;
    
    IF qte_collecte IS NULL THEN
        qte_collecte := 0;
    END IF;

  RETURN(qte_collecte);

END QTECOLLECTESITE;