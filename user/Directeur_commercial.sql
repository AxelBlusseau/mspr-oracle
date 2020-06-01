-- Exemple pour Dirk ANDERSON
alter session set "_ORACLE_SCRIPT"=true;

CREATE ROLE directeur_commercial;
GRANT UPDATE,SELECT,DELETE,INSERT ON recycl.centretraitement to directeur_commercial;

CREATE USER D_DSIM IDENTIFIED by D_DSIM PASSWORD EXPIRE PROFILE users_resp;
GRANT directeur TO D_DSIM;
GRANT directeur_commercial TO D_DSIM;