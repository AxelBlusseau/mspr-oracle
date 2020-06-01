-- Exemple pour Simon DANIEL
alter session set "_ORACLE_SCRIPT"=true;

CREATE ROLE directeur;
GRANT CONNECT TO directeur;
GRANT SELECT ON recycl.camion to directeur;
GRANT SELECT ON recycl.centretraitement to directeur;
GRANT SELECT ON recycl.demande to directeur;
GRANT SELECT ON recycl.detailcollecte to directeur;
GRANT SELECT ON recycl.detaildemande to directeur;
GRANT SELECT ON recycl.detaildepot to directeur;
GRANT SELECT ON recycl.employe to directeur;
GRANT SELECT ON recycl.entreprise to directeur;
GRANT SELECT ON recycl.fonction to directeur;
GRANT SELECT ON recycl.marque to directeur;
GRANT SELECT ON recycl.modele to directeur;
GRANT SELECT ON recycl.site to directeur;
GRANT SELECT ON recycl.tournee to directeur;
GRANT SELECT ON recycl.typedechet to directeur;
GRANT SELECT ON recycl.ville to directeur;

CREATE USER D_DSIM IDENTIFIED by D_DSIM PASSWORD EXPIRE PROFILE users_resp;
GRANT directeur TO D_DSIM;