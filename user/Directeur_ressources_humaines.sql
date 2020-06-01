-- Exemple pour Dirk ANDERSON
alter session set "_ORACLE_SCRIPT"=true;

CREATE ROLE directeur_ressource_humaine;
GRANT UPDATE,SELECT,DELETE,INSERT ON recycl.employe to directeur_ressource_humaine;
GRANT SELECT ON recycl.fonction to directeur_ressource_humaine;

CREATE USER D_ADIR IDENTIFIED by D_ADIR PASSWORD EXPIRE PROFILE users_resp;
GRANT directeur_ressource_humaine TO D_ADIR;