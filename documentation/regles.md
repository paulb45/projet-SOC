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
### Création d’un service suspect
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
