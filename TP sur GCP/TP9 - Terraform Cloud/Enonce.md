- Dans github, créer un nouveau dépot nommé **terraform-cloud**. On y mettra du code terraform. Un exemple de code vous est fourni avec l'énoncé (fichier `main.tf`)
- Aller sur https://app.terraform.io et créer vous un compte gratuit
- Une fois créé, synchronisez ce compte avec votre github
- Créer un nouveau workspace à partir de votre dépot github, le workspace portera le meme nom que le dépot github
- Configurez les variables d'environnement adéquates afin de pouvoir vous connecter sur votre compte CLoud
  - `AWS_ACCESS_KEY_ID` et `AWS_SECRET_ACCESS_KEY` dans AWS
  - `GOOGLE_APPLICATION_CREDENTIALS` ou équivalent dans GCP
- Vous pouvez à présent lancer le déploiement de vos ressources dans le Cloud et visualiser le résultat.

