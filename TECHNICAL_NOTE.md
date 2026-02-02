# Projet Neon Tactics (Tic Tac Toe)

## 🏗️ Architecture et Choix Techniques

### Architecture (Clean-archi)
L'application est structurée en couches pour assurer une séparation nette des responsabilités :
- **domain** : Contient la logique métier pure (`GameEngine`), les modèles de données et les services (IA). La logique de jeu est totalement découplée de Flutter, facilitant les tests unitaires.
- **presentation** : Gère l'UI et l'état. Utilisation de widgets personnalisés et de composants atomiques (`MechanicalCube`, `GameBoard`).
- **core** : Regroupe les utilitaires transverses (Thèmes, Logger, Providers globaux).

### State Management (Riverpod)
Le choix de **Riverpod** s'est imposé pour sa robustesse et sa gestion élégante de la dépendance. L'utilisation des `generator` (@riverpod) permet de réduire le boilerplate et d'assurer une typage fort. L'état global est géré de manière réactive, permettant des transitions fluides entre les pages.

### Intelligence Artificielle
L'algorithme **Minimax** a été implémenté pour offrir un challenge tactique ("ELITE"). Trois niveaux de difficulté sont proposés, ajustant la profondeur de réflexion de l'IA.

## 🎨 UX / UI & Design

Le projet adopte une esthétique **Neon / Cyberpunk** pour démontrer un soin particulier apporté au design :
- **Micro-interactions** :  effets de halo, et transitions fluides.
- **Theming Avancé** : Support complet du mode Clair/Sombre. Utilisation de `ThemeExtension` pour des couleurs néons cohérentes.
- **Réactivité tactile** : Feedback visuel immédiat lors des clics sur les cases ("Mechanical Cube").

## 🧪 Tests et Qualité

- **Tests Immobiles (Logic)** : Couverture des cas de victoire, égalité et simulation de coups dans `GameEngine`.
- **Tests de Widget** : Validation du flux d'onboarding (entrée du nom, sélection de difficulté).
- **Code Qualité** : Utilisation d'un système de log structuré et respect des dernières normes Dart (Wildcards, modern color API).

## 🚀 Évolutions possibles (Manque de temps)

Si le temps l'avait permis, les éléments suivants auraient été ajoutés :
1. **Persistance locale** : Sauvegarde des statistiques et succès via une base de données locale (Sembast ou Drift).
2. **Haptic Feedback** : Ajout de vibrations pour renforcer le côté "mécanique" des cubes.
3. **Localisation** : Support multi-langues via ARB files.
4. **Responsive** : Rendre l'app disponible sur tablette
5. **Mode multi joueur** : Possibilité de jouer à deux en Bluetooth/LAN
4. **Tests de Performance** : Benchmark des transitions pour garantir 60 FPS sur tous les terminaux.

---
*Ce socle technique est conçu pour être évolutif, permettant d'ajouter de nouveaux modes de jeu ou des fonctionnalités sociales sans compromettre la stabilité globale.*
