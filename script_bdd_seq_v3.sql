-- cr�ation de s�quences
create sequence seq_typedechet start with 1 increment by 1;
create sequence seq_marque start with 1 increment by 1;
create sequence seq_modele start with 1 increment by 1;
create sequence seq_site start with 1 increment by 1;
create sequence seq_ville start with 1 increment by 1;
create sequence seq_fonction start with 1 increment by 1;
create sequence seq_employe start with 1 increment by 1;
create sequence seq_tournee start with 1 increment by 1;
create sequence seq_demande start with 1 increment by 1;
create sequence seq_centre start with 1 increment by 1;


-- les tables sans FK
-- ==================

create table fonction
(noFonction	 number DEFAULT seq_fonction.NEXTVAL,
nomFonction		 varchar(50) not null,
constraint PK_fonction primary key(noFonction)
);

create table ville
(noVille 	 number DEFAULT seq_ville.NEXTVAL,
ville		 varchar(50) not null,
zip		 varchar(5) not null,
constraint PK_ville primary key(noVille)
);

create table marque
(noMarque	 number DEFAULT seq_marque.NEXTVAL,
nomMarque		 varchar(50) not null,
constraint PK_marque primary key(noMarque)
);

create table typedechet
(noTypeDechet	 number DEFAULT seq_typedechet.NEXTVAL,
nomTypeDechet	 varchar(50),
nivDanger	 number(1),
volumeUnitaire	 number(3),
seuil		 varchar(20),
tarifForfaitaire number(5),
tarifLot	 number(5),
constraint PK_typedechet primary key(noTypeDechet)
);

-- les tables avec FK 'simple'
-- ===========================

create table entreprise
(siret		 number(15) not null,
raisonSociale	 varchar(50) not null,
noRueEntr	 number(3),
rueEntr		 varchar(200),
noTel		 char(10),
contact		 varchar(50),
noVille		 number(3) not null,
constraint PK_entreprise primary key(siret),
constraint FK_entreprise_ville foreign key (noVille) references ville(noVille)
);

create table centretraitement
(noCentre	 number DEFAULT seq_centre.NEXTVAL,
nomCentre	 varchar(100),
noRueCentre	 number(3),
rueCentre	 varchar(200),
noVille		 number(3) not null,
constraint PK_centretraitement primary key(noCentre),
constraint FK_centretraitement_ville foreign key (noVille) references ville(noVille)
);

create table site
(noSite		 number DEFAULT seq_site.NEXTVAL,
nomSite		 varchar(100) not null,
noVille		 number(3) not null,
constraint PK_site primary key(noSite),
constraint FK_site_ville foreign key (noVille) references ville(noVille)
);

create table employe
(noEmploye	 number DEFAULT seq_employe.NEXTVAL,
nom		 varchar(50),
prenom		 varchar(50),
dateNaiss	 date,
dateEmbauche	 date,
salaire		 number(8,2),
password	 varchar(50),
noFonction	 number(3),
noSite		 number(3),
constraint PK_employe primary key(noEmploye),
constraint FK_employe_fonction foreign key (noFonction) references fonction(noFonction),
constraint FK_employe_site foreign key (noSite) references site(noSite)
);

create table modele
(noModele	 number DEFAULT seq_modele.NEXTVAL,
nomModele		 varchar(50),
noMarque	 number(3) not null,
constraint PK_modele primary key(noModele),
constraint FK_modele_marque foreign key (noMarque) references marque(noMarque)
);

create table camion
(noImmatric	 char(10) not null,
dateAchat	 date,
volume		 number(3),
noModele 	 number(3) not null,
noSite		 number(3) not null,
constraint PK_camion primary key(noImmatric),
constraint FK_camion_modele foreign key (noModele) references modele(noModele),
constraint FK_camion_site foreign key (noSite) references site(noSite)
);

create table tournee
(noTournee	 number DEFAULT seq_tournee.NEXTVAL,
dateTournee	 date,
noImmatric	 char(10) not null,
noEmploye	 number(5) not null,
constraint PK_tournee primary key(noTournee),
constraint FK_tournee_camion foreign key (noImmatric) references camion(noImmatric),
constraint FK_tournee_employe foreign key (noEmploye) references employe(noEmploye)
);

create table demande
(noDemande	 number DEFAULT seq_demande.NEXTVAL,
dateDemande	 date,
dateEnlevement	 date,
aTraiter	 number(1) DEFAULT 0,
siret		 number(15) not null,
noTournee	 number(6) null,
noSite		 number(3) not null,
constraint PK_demande primary key(noDemande),
constraint FK_demande_entreprise foreign key (siret) references entreprise(siret),
constraint FK_demande_tournee foreign key (noTournee) references tournee(noTournee),
constraint FK_demande_site foreign key (noSite) references site(noSite)
);


-- les tables avec FK/PK
-- =====================

create table detaildemande
(quantiteEnlevee	 number(3) not null,
remarque		 varchar(500) null,
noDemande		 number(6) not null,
noTypeDechet		 number(3) not null,
constraint PK_detaildemande primary key(noDemande, noTypeDechet),
constraint FK_detaildem_demande foreign key (noDemande) references demande(noDemande),
constraint FK_detaildem_typedech foreign key (noTypeDechet) references typedechet(noTypeDechet)
);

create table detailcollecte
(quantiteEnlevee	 number(3) not null,
remarque		 varchar(500) null,
noDemande		 number(6) not null,
noTypeDechet		 number(3) not null,
constraint PK_detailcollecte primary key(noDemande, noTypeDechet),
constraint FK_detailcol_demande foreign key (noDemande) references demande(noDemande),
constraint FK_detailcol_typedech foreign key (noTypeDechet) references typedechet(noTypeDechet)
);

create table detaildepot
(quantiteDeposee	 number(3) not null,
remarque		 varchar(500) null,
noTournee		 number(6) not null,
noTypeDechet		 number(3) not null,
noCentre		 number(3) not null,
constraint PK_detaildepot primary key(noTournee, noTypeDechet, noCentre),
constraint FK_detaildep_tournee foreign key (noTournee) references tournee(noTournee),
constraint FK_detaildep_typedech foreign key (noTypeDechet) references typedechet(noTypeDechet),
constraint FK_detaildep_centre foreign key (noCentre) references centretraitement(noCentre)
);





