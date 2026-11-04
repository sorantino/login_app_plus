# Login App Plus

Application Flutter de connexion qui authentifie les utilisateurs via une API REST.

## Fonctionnalités

- Écran de connexion (email + mot de passe) avec validation des champs.
- Authentification par appel HTTP POST à une API REST (`package:http`).
- Indicateur de chargement pendant la connexion.
- Écran de profil affichant les informations de l'utilisateur connecté.
- Interface responsive (portrait / paysage) avec thème personnalisé.

## Structure du projet

```
lib/
  main.dart                  Point d'entrée + thème de l'application
  screens/
    login_screen.dart        Écran de connexion
    profile_screen.dart      Écran de profil
  services/
    auth_service.dart        Appels à l'API d'authentification
  widgets/
    loading_button.dart      Bouton avec indicateur de chargement
    responsive_container.dart Mise en page responsive réutilisable
```

## API

L'application envoie une requête `POST` avec les paramètres `email` et `password`.
L'URL est définie dans `lib/services/auth_service.dart`.

Réponse attendue en cas de succès :

```json
{ "status": 200, "firstName": "Jean", "lastName": "Dupont", "role": 2 }
```

En cas d'échec, l'API renvoie un `status` différent de `200`.

## Lancer le projet

### API

Démarrer l'API sur le port `8080`. Depuis l'émulateur Android, elle est
accessible via l'adresse `http://10.0.2.2:8080` (équivalent de `localhost`).

### Application Flutter

```bash
flutter pub get
flutter run
```

## Identifiants de test

| Email              | Mot de passe |
|--------------------|--------------|
| jean@example.com   | 1234         |
