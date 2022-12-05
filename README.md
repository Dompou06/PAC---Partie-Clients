# PAC Partie Clients (en développement)
Appli fullstack pour simplifier la communication et la gestion des petits commerces à travers un outil destiné aux clients, employés et gestionnaires, que ce soit en interne ou externe. 
---

## Contents
* [Stack utilisée](#Stack-utilisée)
* [Prérequis](#Prérequis)
* [Démarrage rapide](#Démarrage-rapide)
* [Tests API](#Tests-API)
* [Exécution](#Exécution)
* [Auteur](#Auteur)

## Stack utilisée
- Vue.js (vue-cli 3) + Axios + Vuex + Vue Router + Saas + Bootstrap 5
- Node.js + Express + Sequelize
- Mysql

## Prérequis
Afin de pouvoir exécuter l'application sur votre poste de travail, vous devez d'abord installer les dépendances suivantes :
 1. NPM
#### Installation
1.	dans le terminal, soumettre `npm install`
---
 2. NodeJS 16
#### Installation
1.	 depuis https://nodejs.org/en/download/, suivre les indications dans le terminal
---
3. Modules nécessaires
#### Installation
1. dans le terminal, tapez `cd backend` puis `npm install dotenv` 


Ces instructions vont vous permettre d'obtenir une copie fonctionnelle du projet sur votre poste de travail.
---
3. Clôner le dépôt GitHub https://github.com/Dompou06/PAC---Partie-Clients.git

## Démarrage rapide
#### Base de données
Se connecter au serveur **MySql** de votre choix. Exécuter la commande `CREATE DATABASE stock` puis y importer le fichier **stock.sql** fourni dans le dossier database. 

Exécuter la commande `CREATE DATABASE user` puis y importer le fichier **user.sql** fourni dans le dossier database.

---
Ouvrir le dossier copié dans l’éditeur de codes. 

---
#### Backend 
Ouvrir le dossier backend
1.	Modifier les données du fichier **.env.txt** selon les indications
2.	Renommer le fichier .env.txt en **.env**
3.	Créer dans le doccier app un dossier **dump** contenant un dossier **stocks** et un dossier **users**
4.	Exécuter sur le terminal `cd backend`
5.	Lancer le serveur local depuis le terminal `nodemon server.js`
6.	Copier l’url du serveur local en fonction (ex : `http://localhost:3000`)

#### Frontend
Ouvrir le dossier frontend
1.	Modifier la ligne VUE_APP_BASE_UR du fichier .env.txt en inscrivant l’url du serveur local avant /api/
2.  Renommer le fichier .env.txt en **.env**
3.	Exécuter sur un nouveau terminal `cd frontend`
4.	Lancer le serveur local depuis le terminal `npm run serve`
5.	Copier l’url où l’application peut fonctionner en local (ex : `http://localhost:8080/`)


## Tests API
L’ensemble des requêtes envoyées par le frontend au backend sont à retrouver sur la <a href="https://documenter.getpostman.com/view/14239369/2s847HNXjr" target="_blank">documentation Postman</a>

## Exécution
Dans votre navigateur,  ouvrir une page à l’url `http://localhost:8080/`.
Sans être inscrit, vous pouvez naviguer dans l’application. Seule la partie commande exige une inscription. Celle-ci peut avoir lieu à tout moment.
### Inscription
1. Votre *email* devra être valide et ne pas être déjà inscrit dans la base de données.
2. Votre *password* devra comporter 8 à 15 signes ainsi qu'au moins une lettre minuscule et une majuscule, un chiffre et un caractère spécial équivalent à -, +, !, *, $, @, % ou _
### Connexion
1. Vous devez vous être déjà inscrit.
2. Au bout de cinq essais de mots de passe invalides, pendant une minute, les nouvelles tentatives sont rejetées.
3. En cas de mot de passe oublié, un email sera envoyé à l’adresse email de l’utilisateur. Vous avez 24 h pour vous rendre vers l’url indiqué dans le mail pour modifier votre mot de passe. Au-delà de ce délai, vous ne pourrez plus le modifier, sauf si vous rééditez la manipulation depuis le début.
### Sauvegarde
Une sauvegarde hedomadaire des bases de données est programmée.

---
## Auteur
Pourrière Dominique

