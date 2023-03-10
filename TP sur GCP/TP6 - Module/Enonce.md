### TP 6 -  Modules

1. Créez trois modules à savoir `firewall`, `instance` et `network`, afin de déployer une machine virtuelle de la façon que vous l’avez fait aux tps précédents  (instance + groupe de sécurité + ip publique)

2. Créez ensuite deux dossiers, `prod` et `dev`, chacun avec un `main.tf` utilisant ces modules pour déployer une machine virtuelle avec respectivement pour taille `g1-small` pour la prod et `f1-micro` pour la dev

3. Lancez ensuite la création de vos machines virtuelles de prod et de dev

4. Vérifiez que les machines virtuelles portent bien le bon Tag et ont la bonne taille correspondant à l’environnement

5. Supprimez vos ressources avec terraform destroy

6. Créez un dossier **tp-6** comme vous l’avez fait au **tp-5** pour conserver votre code


Solution :

Ce module pourrait servir pour mettre en place la configuration https://github.com/terraform-google-modules/terraform-google-vm

