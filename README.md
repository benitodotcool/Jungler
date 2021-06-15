# Jungler 

## 1. Présentation

Les jeux en ligne sont comme une grande Jungle : il est difficile de trouver des compagnons de routes pour découvrir ensemble un univers, de trouver des mentors qui pourraient nous épauler, ou encore de connaître les joueurs motivés pour repousser nos propres limites.

Beaucoup de joueurs se plaignent des systèmes de "matchmaking" mis en place. Jungler propose à ses utilisateurs un système de mise en relation basé sur des critères entièrement personnalisable et devient **LA** solution.

Les utilisateurs de Jungler auraient le choix entre quatre objectifs:

* Relax: Vous êtes là pour passer un bon moment complètement chill.
* Peer-Gaming: Vous êtes là pour apprendre ensemble, se donner des tips et évoluer en binôme.
* Try-Hard: Vous n'êtes pas là pour blaguer, vous voulez gagner.
* Coaching (payant pour le “coaché”): Vous voulez apprendre par le biais d'un mentor ayant un classement élevé ou vous voulez partager vos connaissances à des joueurs qui n'attendent que ça.



## 2. Parcours utilisateur

* **Landing page:** 
    * Présentation de l'application
    * Invitation à l'inscription
	* Statistiques (Nombre d'inscrits/nombre de “match”/nombre de message échangés etc.)

* **Logging:**
    * Création d'un utilisateur (omniAuth/multiAuth)
	* Choix des jeux

* **Espace utilisateurs:**
    * Choix des jeux
	* Mise en place des filtres
	* Choix de l'objectif

* **Système de match:**
    * Accès autorisé seulement si un utilisateur est connecté
	* Possibilité de “swiper” à droite = Je veux jouer avec toi
	* Possibilité de “swiper” à gauche = Je ne veux pas jouer avec toi
	* Possibilité de “superswiper” vers le haut = **JE VEUX ABSOLUMENT JOUER AVEC TOI**
	* Possibilité de revenir en arrière X fois
	* Publicité envisagée tous les X profils (elle match avec tout le monde)

* **Système de messagerie instantanée:**
    * Une conversation se déclenche lorsque deux utilisateur se matchs mutuellement
	* Possibilité d'envoyer des messages (ex: 140 caractères max)
	* Possibilité de liker des messages
	* Possibilité de partager ses derniers exploits
	* Possibilité d'envoyer une demande d'ajout d'amis
	* Si match avec un coach, possiblité d'envoyer une demande pour un crénau (accès calendrier)




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
	* Animation “swipe”
	* Icons
	* Système de messagerie instantanée
	* Récupération d'images via les APIs

* **3.3. Backend**

    * Connexion à plusieurs APIs
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

    * Visualisation de toutes les informations nécessaires relatives au jeux
    * Définition de critères par l'utilisateur
        * *Optionnel: Voir ses amis*
	    * *Optionnel: Voir son calendrier*
		* *Optionnel: Connexion à son compte youtube pour partager ses dernières vidéos*
		* *Optionnel: Connexion à son compte twitch pour partager ses derniers lives et/ou clips*

* **Fonctionnalité swipe droite/gauche**

	* Création de l'algorithme de mise en relation
	* Animation JavaScript
	    * *Optionnel: Possibilité de “superswiper”*
	    * *Optionnel: Possibilité de revenir en arrière*

* **Espace messagerie entre utilisateurs**

    * Les utilisateurs peuvent s'envoyer des messages instantanés
        * *Optionnel: Possibilité de supprimer ses propres messages*
	    * *Optionnel: Possibilité de partager ses derniers exploits*
	    * *Optionnel: Possibilité de liker des messages*
	    * *Optionnel: Possibilité d'ajouter en amis ses matchs*
	    * *Optionnel: Possibilité de réserver un créneau avec un utilisateur ayant l'attribut “coach”*

* **Espace coaching** *(optionnel)*

	* Gestionnaire de calendrier pour les utilisateurs ayant l'attribut “coach”
    * Ajout de commentaires et/ou d'une note après une séance de coaching
	* Gestion des paiements




## 6. Mentor

Manu aKa *“Aide Moussaillons”* sur le discord

## X. Jeux envisagées

* League Of Legends
* Rocket League
* CSGO
* Fortnite
* Apex Legends
* Warzone
* Fifa 21
* CoD Cold War