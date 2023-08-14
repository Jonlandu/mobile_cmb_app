# cmb_app

Application mobile du Centre Missionnaire de Binza

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
# CMB_APP
Application pour le Centre Missionnaire de Binza

##############################################
# DOCUMENTATION DU CODE DE L'APPLICATION CMB_APP

# CONFICURATION DU CHANGEMENT DE LOGO DE L'APPLICATION
Pour le changement du logo de l'application :
1. Le Minimun Sdk est définit à : 21
2. Ce bout de code est placé en dernier dans le fichier pubspec.yaml :
   flutter_icons:
   android: "launcher_icon"
   # Executer flutter pub run flutter_launcher_icons:main pour changer le logo de l'application
   image_path: "assets/cmblogo.jpg"
   # Remarque : définir le chemin de son image dans la rubrique image_path: "VOTRE_CHEMIN_DE_L'IMAGE"
3. Installer la dépendences : flutter_launcher_icons: ^0.9.2
4. Dans le terminale, exécuter la commande : flutter pub run flutter_launcher_icons:main

#POUR LE SCREEN