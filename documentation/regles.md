# Documentation des règles

## Active Directory
### Kerberoasting
Détection des attaques de type kerberoasting sur l'évènement 4769 de l'AD. Si cet évènement apparait 5 fois pour un même utilisateur dans un interval d'une heure, une alerte est déclenchée.

### AS-REPRoasting
### Shadow Credentials
### Password Spraying

## Windows
### Création d’une tâche planifiée suspecte
### Création d’un service suspect
### Création ou modification de clé RUN
### Dump LSASS

## Linux
### Multiples commandes d’énumération
Si divers commandes d'énumérations uniques sont détecter sur un interval d'une minute, une alerte est déclenchée.

### Activité de password looting
Si une activité de password looting est détecté, plus précisément une de lecture ou une récupération des fichiers passwd et shadow une alerte est déclenchée.

## Réseau
### Scan de port (horizontal / vertical)
### Activité de beaconing CnC