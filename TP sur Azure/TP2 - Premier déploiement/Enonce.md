# TP2 - Premier déploiement

1. Installer la ligne de commande Azure et Authentifiez vous sur votre compte azure grâce à la ligne de commande.

2. Créez un service principe et récupérer les credentials qui vous permettrons de vous authentifier auprès d'Azure

3. Créez un fichier `main.tf` dans un répertoire nommé **tp-2**

4. Renseignez les informations permettant de créer une VM avec l’image `ubuntu 18.04-LTS` dans un groupe de ressource et avec le réseau necessaire.

5. ATTENTION nous travaillerons uniquement dans la region `West Europe` dans **toute** **cette** **formation**

6. Vérifiez que votre instance est bien créée et observez le contenu de fichier `tfstate`

7. Appliquez la modification et constatez les changements apportées ainsi que dans le fichier tfstate

8. Supprimez votre machine virtuelle

### Solution


- Vous devez avoir un abonnement [Microsoft Azure](https://azure.microsoft.com/) .
- Vous devez avoir installé les éléments suivants :
  - Interface de ligne de commande [Terraform](https://www.terraform.io/)
  - Outil Azure CLI

## Utilisation du code

- Configurez votre accès à Azure.

  - Authentifiez-vous à l'aide d'Azure CLI.

    Terraform doit s'authentifier auprès d'Azure pour créer l'infrastructure.

    Dans votre terminal, utilisez l'outil Azure CLI pour configurer les autorisations de votre compte localement.

    ```
    az login  
    ```

    Votre navigateur s'ouvrira et vous invitera à entrer vos identifiants de connexion Azure. Après une authentification réussie, votre terminal affichera vos informations d'abonnement.

    Vous êtes connecté. Laissez-nous maintenant trouver tous les abonnements auxquels vous avez accès...

    ```
    [
      {
        "cloudName": "<CLOUD-NAME>",
        "homeTenantId": "<HOME-TENANT-ID>",
        "id": "<SUBSCRIPTION-ID>",
        "isDefault": true,
        "managedByTenants": [],
        "name": "<SUBSCRIPTION-NAME>",
        "state": "Enabled",
        "tenantId": "<TENANT-ID>",
        "user": {
          "name": "<YOUR-USERNAME@DOMAIN.COM>",
          "type": "user"
        }
      }
    ]
    ```

    

    Recherchez la  colonne `id` du compte d'abonnement que vous souhaitez utiliser.

    Une fois que vous avez choisi l'ID d'abonnement du compte, définissez le compte avec Azure CLI.

    ```
    az account set --subscription "<SUBSCRIPTION-ID>"
    ```

    

  - Créez un principal de service.

    Un principal de service est une application dans Azure Active Directory avec les jetons d'authentification dont Terraform a besoin pour effectuer des actions en votre nom. Mettez à jour le champ  `<SUBSCRIPTION_ID>` avec l'ID d'abonnement que vous avez spécifié à l'étape précédente.

    Créez un principal de service :

    ```shell
    az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"					
    ```

    Affichage en sortie:

    ```shell
    Creating 'Contributor' role assignment under scope '/subscriptions/<SUBSCRIPTION_ID>'
    The output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. For more information, see https://aka.ms/azadsp-cli
    {
      "appId": "xxxxxx-xxx-xxxx-xxxx-xxxxxxxxxx",
      "displayName": "azure-cli-2022-xxxx",
      "password": "xxxxxx~xxxxxx~xxxxx",
      "tenant": "xxxxx-xxxx-xxxxx-xxxx-xxxxx"
    }
    ```

    

  - Définissez vos variables d'environnement.

    HashiCorp recommande de définir ces valeurs en tant que variables d'environnement plutôt que de les enregistrer dans votre configuration Terraform.

    Dans votre terminal, définissez les variables d'environnement suivantes. Assurez-vous de mettre à jour les valeurs des variables avec les valeurs renvoyées par Azure dans la commande précédente.

    - Pour MacOS/Linux :

      ```
      export ARM_CLIENT_ID="<SERVICE_PRINCIPAL_APPID>"
      export ARM_CLIENT_SECRET="<SERVICE_PRINCIPAL_PASSWORD>"
      export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
      export ARM_TENANT_ID="<TENANT_ID>"
      ```

      

    - Pour Windows (PowerShell) :

      ```
      $env:ARM_CLIENT_ID="<SERVICE_PRINCIPAL_APPID>"
      $env:ARM_CLIENT_SECRET="<SERVICE_PRINCIPAL_PASSWORD>"
      $env:ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
      $env:ARM_TENANT_ID="<TENANT_ID>"
      ```

      

- Initialisez la configuration de Terraform.

  La première commande à exécuter après l'écriture d'une nouvelle configuration Terraform est la commande`terraform init` permettant d'initialiser un répertoire de travail contenant les fichiers de configuration Terraform. Il est prudent d'exécuter cette commande plusieurs fois.

  Si vous définissez ou modifiez des modules ou la configuration du backend pour Terraform, réexécutez cette commande pour réinitialiser votre répertoire de travail. Si vous oubliez, d'autres commandes le détecteront et vous rappelleront de le faire si nécessaire.

  Exécutez la commande :

  ```
  terraform init
  ```

- Validez les modifications.

  La commande  `terraform plan` vous permet de voir ce que Terraform fera avant d'apporter des modifications.

  Exécutez la commande :

  ```
  terraform plan
  ```

  

- Appliquez les modifications.

  La commande `terraform apply` vous permet d'appliquer votre configuration et de créer l'infrastructure.

  Exécutez la commande :

  ```
  terraform apply
  ```

  Testez les changements.

  Une fois la commande `terraform apply` terminée, utilisez la console Azure, vous devriez voir la nouvelle machine virtuelle créée.

- Nettoyer les ressources créées.

  Lorsque vous avez terminé, la commande `terraform destroy` détruit l'infrastructure que vous avez créée.

  Exécutez la commande :

  ```shell
  terraform destroy
  ```

  