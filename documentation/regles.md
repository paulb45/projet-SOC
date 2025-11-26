# Documentation des règles

## Active Directory
### Kerberoasting
Détection des attaques de type kerberoasting sur l'évènement 4769 de l'AD, en excluant les deamndes légitimes (via le compte krbtgt, le compte utilisé pour forger les tickets). On exclue également les demandes liés aux comptes machines.

### AS-REPRoasting
Détection des attaques de type ASREP-ROasting, sur l'évènement 4768, qui concerne la requête d'un ticket TGT. Une alerte est levée si un certain nombre de compte avec la pré-authentification désactivée ont demandé un TGT. Ce type de comportement peut notamment correspondre à l'utilisation d'un outil malveillant (par exemple impacket).

### Shadow Credentials
### Password Spraying

## Windows
### Création d’une tâche planifiée suspecte
**Objectif**
- Détecter la mise en place de tâches planifiées malveillantes.
- Empêcher l’exécution récurrente de scripts ou de binaires malveillants.

**Logique**
- Basée sur l’événement Security 4698 ou Sysmon EventID 1 avec `schtasks.exe` ou `at.exe`.
- Analyse des chemins et noms de tâches inhabituels (Temp, AppData, Updater…).
- Détection de commandes d’exécution potentiellement malveillantes (PowerShell, WScript, Rundll32…).

### Alerte : Exécution de Procdump sur DC

**Objectif**
- Détecter l’utilisation d’outils permettant le dump de la mémoire système sur le contrôleur de domaine.
- Identifier une tentative d’extraction d’identifiants sensibles depuis LSASS.

**Logique**
- Basée sur l’événement Security 4688 (création de processus).
- Détection du binaire « procdump.exe » sur un DC.
- Indique un comportement de credential dumping potentiellement malveillant.


### Création d’un service suspect
**Objectif**
- Détecter l’installation de services Windows utilisés comme mécanismes de persistance post-compromission.
- Identifier l’exécution automatique de binaires malveillants avec privilèges élevés.

**Logique**
- Basée sur l’événement Security 4697 (création d’un service).
- Analyse de l’utilisation de `sc.exe`.
- Mise en évidence de chemins suspects (Temp, AppData, Users\Public…).
- Comportements associés à des actions post-exploitation.

  
### Création ou modification de clé RUN
Alerte de niveu Médium. Détecte la création ou la modification de clé RUN, en omettant les cas qui semblent légitimes ou trop courant.
### Dump LSASS
Alerte de niveau High. Détecte une tentative de dump LSASS, notamment avec des outils comme mimikatz ou procdump, répandus chez les attaquants.

## Linux
### Multiples commandes d’énumération
Si divers commandes d'énumérations uniques sont détecter sur un interval d'une minute, une alerte est déclenchée.

### Activité de password looting
Si une activité de password looting est détecté, plus précisément une de lecture ou une récupération des fichiers passwd et shadow une alerte est déclenchée.

## Réseau
### Scan de port (horizontal / vertical)
### Activité de beaconing CnC
