-- Exemple pour Jurgen VERELST
alter session set "_ORACLE_SCRIPT"=true;

CREATE ROLE agent;
GRANT CONNECT TO employe;
GRANT SELECT,INSERT,UPDATE,DELETE ON recycl.tournee TO agent;
GRANT SELECT ON recycl.demande TO agent;
GRANT SELECT ON recycl.centretraitement TO agent;
GRANT SELECT ON recycl.employe TO agent;
GRANT SELECT ON recycl.fonction TO agent;
GRANT SELECT ON recycl.camion TO agent;
GRANT SELECT ON recycl.marque TO agent;
GRANT SELECT ON recycl.modele TO agent;

CREATE USER A_VJUR IDENTIFIED by A_VJUR PASSWORD EXPIRE PROFILE users;
GRANT agent TO A_VJUR;