-- Exemple pour Didier RANDAL
alter session set "_ORACLE_SCRIPT"=true;

CREATE ROLE employe;
GRANT CONNECT TO employe;
GRANT SELECT ON recycl.tournee TO employe;
GRANT SELECT ON recycl.demande TO employe;
GRANT SELECT ON recycl.centretraitement TO employe;

CREATE USER E_RDID IDENTIFIED by E_RDID PASSWORD EXPIRE PROFILE users;
GRANT employe TO E_RDID;