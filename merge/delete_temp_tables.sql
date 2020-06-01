DROP TABLE centretraitement_merge cascade constraints PURGE;
DROP TABLE employe_merge cascade constraints PURGE;
DROP TABLE tournee_merge cascade constraints PURGE;
DROP TABLE demande_merge cascade constraints PURGE;
DROP TABLE detaildemande_merge cascade constraints PURGE;
DROP TABLE detaildepot_merge cascade constraints PURGE;

drop sequence seq_typedechet_merge;
drop sequence seq_centre_merge;
drop sequence seq_employe_merge;
drop sequence seq_tournee_merge;
drop sequence seq_demande_merge;
drop sequence seq_modele_merge;
drop sequence seq_marque_merge;