Dans le TP précédent (TP 6), on constate une duplication de code dans les répertoires de déploiement `prod` et `dev`.

A l'aide de la notion de **workspace** dans terraform, factorisez votre code.

En plus du répertoire des modules, on ne devrait disposer que d'un seul répertoire applicatif appelé `deploy`.


### solution
Les commandes suivantes permettent de créer les workspaces

```bash 
terraform workspace -h
terraform workspace show
terraform workspace new prod
terraform workspace new dev
terraform workspace select dev
terraform workspace select prod
```