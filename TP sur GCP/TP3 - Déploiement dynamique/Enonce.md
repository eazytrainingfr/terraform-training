  

### TP3 - Déploiement dynamique

L’objectif est de déployer une instance de machine virtuelle avec une règle de groupe de sécurité , un vpc et un sous réseau ainsi qu'un script d'initialisation qui installera Nginx sur le serveur créé . Vous devez également rajouter 2 tags : `gcp` et `terraform`.

1. **Groupe de sécurité**: Créez un Groupe de sécurité pour ouvrir les ports `80` et `22` . Utilisez ce groupe de sécurité afin d'accéder à votre machine virtuelle créé
2. **IP Publique**: Vous devez recupérer dymaniquement une IP publique et la rattacher à la carte réseau de votre machine virtuelle
3. **Réseau**: Vous devez créer un VPC (réseau) et un sous réseau afin de déployer vos ressources 

4. **Machine virtuelle**: Votre instance doit avoir une taille variabilisée, la valeur par défaut devrait être `g1.small` et la valeur à surcharger sera `f1.micro`. Vous devrez également variabiliser la zone et votre région de déploiement .

5. **Image de la VM**: L’image à utiliser sera récupérée de façon dynamique et devra être une version à jour de `debian-11`
6. **Bucket**: Vous devez également créer un bucket appelé `bucket-gcp-votreprenom-eazytraining` de la classe de stockage `STANDARD`. Vous devez également activer le versionning pour ce bucket. Attention , votre nom de bucket doit être unique

7. Supprimez vos ressources avec terraform destroy

8. Créez un dossier tp-3 comme vous l’avez fait au tp-2 pour conserver votre code

#### Solution

Les fichiers `main.tf`, `variables.tf` et `terraform.tfvars` sont fourni.
