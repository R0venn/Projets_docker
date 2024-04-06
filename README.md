# Itop_docker

Il y a deux fichier DockerFile et Docker-compose.
Copier ces deux fichiers dans un meme dossier, puis executer cette ligne de commande :
```bash
docker-compose up -d
```

Vos conteneurs vont se créer, vous pouvez accerder au serveur web d'itop via :
`http://localhost:80`

Si vous voulez récuperer le contenu de la base de données ou l'application web, vous pouvez faire ceci : <br>
  - Commande pour récuperer l'application web : `docker run --rm --volumes-from <nom de conteneur web> -v <chemin dans votre hôte local>:/backup busybox tar cvf /backup/backup.tar /var/www/html/itop` <br>
  - Exemple : `docker run --rm --volumes-from itop-web-1 -v C:\temp:/backup busybox tar cvf /backup/backup.tar /var/www/html/itop`

utile pour ajouter des extensiosn à itop : https://store.itophub.io/en_US/taxons/all-extensions
