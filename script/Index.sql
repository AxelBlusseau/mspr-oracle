CREATE INDEX sortTourneeByDateTournee ON tournee ('dateTournee');
CREATE INDEX sortCamionByVolume ON camion ('volume');
CREATE INDEX sortEmployeByNom ON Employe ('nom');
CREATE INDEX sortEmployeByPrenom ON Employe ('prenom');
CREATE INDEX sortDemandeByDateDemande ON demande ('noDemande');
CREATE INDEX sortDemandeByDateEnlevement ON demande ('dateEnlevement');
CREATE INDEX sortDetailDemandeByQteEnlevee ON detail_demande ('quantiteEnlevee');
CREATE INDEX sortDetailCollecteByQteEnlevee ON detail_collecte ('quantiteEnlevee');
CREATE INDEX sortDetailDepotByQteDeport ON detail_depot ('quantiteDeposee');



