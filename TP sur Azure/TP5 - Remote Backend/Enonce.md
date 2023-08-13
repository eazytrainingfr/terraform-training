


###  TP-5  - Remote Backend

- Créez un conteneur (blob storage) nommé backend dans une compte de stockage nommé azure-backend-<votre prénom> au sein de votre abonnement.

- Modifiez votre rendu du **tp-4** afin d’y intégrer le stockage du tfstate sur votre conteneur blob

- Vérifiez après avoir lancé un déploiement que le fichier sur le bucket est bien créé et contient bien les infos à jour

- Une fois terminé, supprimez vos ressources avec terraform destroy

- Créez un dossier **tp-5** comme vous l’avez fait au **tp-4** pour conserver votre code

### Solution :

Le fichier `main.tf` est fourni

Commande :

```shell
terraform init --migrate-state
```

Affichage en sortie:

```shell
Initializing the backend...

Successfully configured the backend "azurerm"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...


Terraform has made some changes to the provider dependency selections recorded
in the .terraform.lock.hcl file. Review those changes and commit them to your
version control system if they represent changes you intended to make.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

```
