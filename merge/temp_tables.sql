-- les tables sans FK
-- ==================
create table centretraitement_merge
    (NoCentre	 number(3) not null,
    NomCentre	 varchar(100),
    NoRueCentre	 number(3),
    RueCentre	 varchar(200),
    CpostalCentre	 number(5),
    VilleCentre	 varchar(50),
    
    NoCentre_Merge number(3),
    
    constraint PK_centretraitement_merge primary key(Nocentre),
    constraint FK_centretraitement_merge foreign key(NoCentre_Merge) references centretraitement(NoCentre)
);	

-- les tables avec FK 'simple'
-- ===========================
create table employe_merge
(
    NoEmploye	 number(5) not null,
    Nom		 varchar(50),
    Prenom		 varchar(50),
    dateNaiss	 date,
    dateEmbauche	 date,
    Salaire		 number(8,2),
    NoFonction	 number(3),
    
    NoEmploye_merge    number(5),
    
    constraint PK_employe_merge primary key(Noemploye),
    constraint FK_employe_fonction_merge foreign key (nofonction) references fonction(nofonction),
    
    constraint FK_employe_merge foreign key (NoEmploye_merge) references employe(NoEmploye)
);

create table tournee_merge
(
    NoTournee	 number(6) not null,
    DateTournee	 date,
    NoImmatric	 char(10) not null,
    NoEmploye	 number(5) not null,
    
    NoTournee_merge number(6),
    
    constraint PK_tournee_merge primary key(Notournee),
    constraint FK_tournee_camion_merge foreign key (NoImmatric) references camion(noImmatric),
    constraint FK_tournee_employe_merge foreign key (noemploye) references employe_merge(noemploye),
    
    constraint FK_tournee_merge foreign key (NoTournee_merge) references tournee(NoTournee)
);


 -- sans Web_O_N / ATT chargem table
/*
create table demande_merge
(
    NoDemande	 number(6) not null,
    DateDemande	 date,
    DateEnlevement	 date,
    Siret		 number(15) not null,
    NoTournee	 number(6) null,
    
    NoDemande_merge number(6),
    
    constraint PK_demande_merge primary key(Nodemande),
    constraint FK_demande_entreprise_merge foreign key (Siret) references entreprise(Siret),
    constraint FK_demande_tournee_merge foreign key (notournee) references tournee_merge(notournee),
    
    constraint FK_demande_merge foreign key (NoDemande_merge) references demande(NoDemande)
);


-- les tables avec FK/PK
-- =====================

-- avec remarque /  ATT : chargement table

create table detaildemande_merge
(
    QuantiteEnlevee	 number(3) not null,
    Remarque		 varchar(100),
    NoDemande		 number(6) not null,
    NoTypeDechet     number(3) not null,
    
    NoDemande_merge number(6),
    NoTypeDechet_merge number(3),
    
    constraint PK_detaildemande_merge primary key(NoDemande, NoTypeDechet), 
    constraint FK_detaildem_demande_merge foreign key (NoDemande) references demande_merge(NoDemande),
    constraint FK_detaildem_typedech_merge foreign key (NoTypeDechet) references typedechet(NoTypeDechet),
    
    constraint FK_detaildemande_merge_demande foreign key (NoDemande_merge) references detaildemande(NoDemande),
    constraint FK_detaildemande_merge_type foreign key (NoTypeDechet_merge) references detaildemande(NoTypeDechet)
);

create table detaildepot_merge
(
    QuantiteDeposee	 number(3) not null,
    NoTournee		 number(6) not null,
    NoTypeDechet		 number(3) not null,
    NoCentre		 number(3) not null,
    
    NoTournee_merge		 number(6) not null,
    NoTypeDechet_merge		 number(3) not null,
    NoCentre_merge		 number(3) not null,
    
    constraint PK_detaildepot_merge primary key(NoTournee, NoTypeDechet, NoCentre),
    constraint FK_detaildep_tournee_merge foreign key (NoTournee) references tournee_merge(NoTournee),
    constraint FK_detaildep_typedech_merge foreign key (notypedechet) references typedechet(notypedechet),
    constraint FK_detaildep_centre_merge foreign key (NoCentre) references centretraitement_merge(NoCentre),
    
    constraint FK_detaildep_merge_tournee foreign key (NoTournee_merge) references detaildepot(NoTournee),
    constraint FK_detaildep_merge_type foreign key (NoTypeDechet_merge) references detaildepot(NoTypeDechet),
    constraint FK_detaildep_merge_centre foreign key (NoCentre_merge) references detaildepot(NoCentre)
);
*/

-- cr�ation de s�quences
create sequence seq_typedechet_merge start with 1 increment by 1;
create sequence seq_centre_merge start with 1 increment by 1;
create sequence seq_employe_merge start with 1 increment by 1;
create sequence seq_tournee_merge start with 1 increment by 1;
create sequence seq_demande_merge start with 1 increment by 1;
create sequence seq_modele_merge start with 1 increment by 1;
create sequence seq_marque_merge start with 1 increment by 1;