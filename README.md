# Jungler 

## 1. Présentation

League of Legends est une grande Jungle : il est difficile de trouver des compagnons de routes pour découvrir ensemble un univers, de trouver des mentors qui pourraient nous épauler, ou encore de connaître les joueurs motivés pour repousser nos propres limites.

Beaucoup de joueurs se plaignent du système de "matchmaking" mis en place. Jungler propose à ses utilisateurs un système de mise en relation basé sur des critères entièrement personnalisable et devient **LA** solution.

Les utilisateurs de "Jungler" auraient le choix entre quatre objectifs:

* Relax: Vous êtes là pour passer un bon moment complètement chill.
* Peer-Gaming: Vous êtes là pour apprendre ensemble, se donner des tips et évoluer en binôme.
* Try-Hard: Vous n'êtes pas là pour blaguer, vous voulez gagner.



## 2. Parcours utilisateur

* **Landing page:** 
    * Présentation de l'application
    * Invitation à l'inscription
	* Statistiques (Nombre d'inscrits/nombre de “match”/nombre de message échangés etc.)

* **Logging:**
    * Création d'un utilisateur
	* Renseignement de son pseudo LoL

* **Espace utilisateurs:**
	* Mise en place des filtres
	* Choix de l'objectif

* **Système de match:**
    * Accès autorisé seulement si un utilisateur est connecté
	* Possibilité de “swiper” à droite = Je veux jouer avec toi
	* Possibilité de “swiper” à gauche = Je ne veux pas jouer avec toi

* **Système de messagerie:**
    * Une conversation se déclenche lorsque deux utilisateur se matchs mutuellement
	* Les utilisateurs peuvent s'envoyer autant de messages qu'ils veulent et les retrouver dans la section appropriée.


## 3. Concrètement et techniquement

* **3.0 Général**

    * Trouver une inspiration générale pour le design de l'application ([exemple 1](https://dribbble.com/shots/15661139-PlayStation-Dashboard), [exemple 2](https://dribbble.com/shots/14196209-Gamer-Game-Launcher-App))
    * Mise en place d'un algorithme complexe de mise en relation d'utilisateurs

* **3.1 Base de données**

    * Tableau User
	* Tableau Game
	* Tableau intermédiaire User—Game
	* Tableau Messenger (ClassName: Sender/Recipient)
	* Tableau Coaching

* **3.2. Front**

    * Boutons
	* Cards
	* Formulaires
	* Icons
	* Système de messagerie
	* Récupération d'images via les APIs

* **3.3. Backend**

    * Connexion à l'API League of Legends
	* Algorithme de mise en relation
	* Messagerie/Stockage/Permissions

* **3.4. Technique**

| Prénom    | Design | UI&UX | Front-end | Base de donnée | API   | Back-end |
| --------- |:------:|:-----:|:---------:|:--------------:|:-----:|:--------:|
| Benoit    | `+`    | `+`   | `+`       | `+++`          | `+++` | `+++`    | 
| Cheikh    | `++`   | `++`  | `++`      | `++`           | `++`  | `++`     |
| Mathis    | `+++`  | `+++` | `+++`     | `++`           | `++ ` | `++ `    |    
| Valentin  | `+++`  | `+++` | `+++`     | `++`           | `+`   | `++`     | 
| Florentin | `+++`  | `+++` | `+++`     | `+`            | `+`   | `+`      |       




## 4. La version minimaliste mais fonctionnelle qu'il faut avoir livré la première semaine

* **Page profil des utilisateurs**

    * Connexion et/ou inscription des utilisateurs
    * Récupération des données via une API

* **Fonctionnalité swipe droite/gauche**

    * Fonctionnelle mais sans animation
	* Possibilité de “swiper” vers la droite ou la gauche
	* Les utilisateurs peuvent matcher avec n'importe quels autres utilisateurs

* **Espace messagerie entre utilisateurs**

    * Les utilisateurs peuvent s'envoyer des messages sous forme de commentaires
	* Une discussion ne commence que lorsque deux utilisateurs se match mutuellement
    * Uniquement eux ont accès à ces échanges




## 5. La version que l'on présentera aux jury

*Ces ajouts sont complémentaires à ceux de la partie 4.*

* **Page profil des utilisateurs**

    * Visualisation de toutes nos informations
    * Accès à la modification de ses données & critères

* **Fonctionnalité swipe droite/gauche**

	* Création de l'algorithme de mise en relation

* **Espace messagerie entre utilisateurs**

    * Les utilisateurs peuvent s'envoyer des messages et changer de conversation à n'importe quel moment



## 6. Mentor

Manu aKa *“Aide Moussaillons”* sur le discord


## 7. Liens utiles

Pour pouvoir profiter pleinement des fonctionnalités de l'application et sir vous n'avez pas de pseudo Lol, nous vous invitons à en choisir un parmis le ladder EUW.
* https://euw.op.gg/ranking/ladder/

Executive Summary :
* https://docs.google.com/document/d/1ZrUvCgAX_t_tUI4eBxj2L8EY6-BQ_yFWLFN2T4e7nSc/

Heroku App :
* https://jungler-thp.herokuapp.com/

* Pour profiter pleinement des fonctionnalités (avec un premier seed de données), vous pouvez vous connecter sur le site avec comme : 
	identifiant : admin@jungler.com
	mdp : azerty 

	Enjoy ! 

Trello :
* https://trello.com/b/wNGE7wl8/projet-final-jungler

Inspiration pour le design global de l'application
* https://dribbble.com/shots/15661139-PlayStation-Dashboard
