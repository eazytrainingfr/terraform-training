# TP2 - Premier déploiement

1. Créez un service account et récupérer le fichier Json qui vous permettra de vous authentifier auprès de google

2. Activez l'API de compute Engine

3. Créez un fichier `main.tf` dans un répertoire nommé **tp-2**

4. Renseignez les informations permettant de créer une VM avec l’image `debian-cloud/debian-11`

5. ATTENTION nous travaillerons uniquement dans la region `us-central1` dans **toute** **cette** **formation**

6. Vérifiez que votre instance est bien créée et observez le contenu de fichier `tfstate`

7. Appliquez la modification et constatez les changements apportées ainsi que dans le fichier tfstate

8. Supprimez votre machine virtuelle

### Solution
- Vous devez avoir [Terraform](https://translate.google.com/website?sl=en&tl=fr&hl=fr&client=webapp&u=https://www.terraform.io/) installé sur votre ordinateur.
- Vous devez avoir un compte [Google Cloud Platform (GCP)](https://translate.google.com/website?sl=en&tl=fr&hl=fr&client=webapp&u=https://cloud.google.com/) .
- Vous devez avoir activé l'API Google Compute Engine  .
- Vous devez utiliser un compte de service afin de créer des identifiants Google Cloud Platform. (https://cloud.google.com/iam/docs/keys-create-delete) et vous devez les télécharger
- Il utilise le fournisseur **Terraform Google Cloud** qui interagit avec les nombreuses ressources prises en charge par Google Cloud Platform (GCP) via ses API.


##### Utilisation du code

- Configurez vos identifiants d'accès Google Cloud.

  - Configurez la variable d'environnement`GOOGLE_APPLICATION_CREDENTIALS`. La variable doit contenir le chemin d'accès au fichier d'informations d'identification.

    + ##### sous Linux, macOS ou Unix, utilisez `export`:

    ```
    export GOOGLE_APPLICATION_CREDENTIALS="/terraform/eazytraining.json"
    ```

    + ###### sous Windows avec `mobaxterm`, utilisez `export` et le chemin du fichier `Json`:

    ```
    export GOOGLE_APPLICATION_CREDENTIALS="C:\terraform\eazytraining.json"
    ```
    + ###### sous Windows avec powershell, voici la commande:
    
    ```powershell
    $env:GOOGLE_APPLICATION_CREDENTIALS = "C:\terraform\eazytraining.json"
    ```
    Un exemple de contenu du fichier `C:\terraform\eazytraining.json`est fourni avec l'énoncé.

    
- Initialiser le répertoire de travail.

  La première commande à exécuter après l'écriture d'une nouvelle configuration Terraform est la commande `terraform init` permettant d'initialiser un répertoire de travail contenant les fichiers de configuration de Terraform.

  ```
  terraform init
  ```

- Validez les modifications.
  ```
  terraform plan
  ```
  

- Déployez les changements.
  ```
  terraform apply
  ```
  

- Testez le déploiement

  Lorsque la commande `terraform apply` est terminée, dans la console Google Cloud, vous devriez voir la nouvelle instance Google Compute et toutes les ressources créées avec la balise `terraform-example`.

- Nettoyer les ressources créées.
  ```
  terraform destroy
  ```