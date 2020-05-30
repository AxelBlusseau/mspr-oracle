# Merge des base de données

## Initalisation de la base 

### Création du modèle de données

Pour initialiser la base de données, executez le script avec séquence situé à la racine afin de créer les tables. Puis executez le script "temp_tables" pour créer les tables temporaires nécessaire au merge.

### Alimentation de la base

Une fois fait, se connecter au serveur en SSH puis executer les commandes suivantes :

```bash
docker exec -u root -it oracle bash -c "source /home/oracle/.bashrc; su oracle;"
cd /home/oracle/toload/RECYCL/
bash load.sh
```

La base de données est maintenant alimentée grâce aux scripts executant des commandes SQL*Loader.

## Migration des données

Les scripts de PLSQL de migration se situe dans le dossier merge et sont nommés par le nom de la table concernée. 