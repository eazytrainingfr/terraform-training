### TP 6 -  Modules

1. Créez 06 modules à savoir `nsg`, `ip` , `rg` , `network` , `storage` et `vm`, afin de déployer une machine virtuelle de la façon que vous l’avez fait aux tps précédents.

2. Créez ensuite deux dossiers, `prod` et `dev`, chacun avec un `main.tf` utilisant ces modules pour déployer une machine virtuelle avec respectivement pour taille `Standard_D2_v2` pour la prod et `Standard_D1_v2` pour la dev

3. Lancez ensuite la création de vos machines virtuelles de prod et de dev

4. Vérifiez que les machines virtuelles portent bien le bon Tag et ont la bonne taille correspondant à l’environnement

5. Supprimez vos ressources avec terraform destroy

6. Créez un dossier **tp-6** comme vous l’avez fait au **tp-5** pour conserver votre code


Solution :

modules fournis 

