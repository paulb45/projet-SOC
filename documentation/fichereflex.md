# SOC fiches réflexes
# BARATIN - Paul; DOUCET - Thélio; DUGUEY - Martin; NAIT NADIR Salma


## Active Directory
### 1. Kerberoasting
Mitre att&ck : T1558.003

Objectif : Identifier une extraction malveillante de tickets Kerberos (TGT.)

Vérifications

    • Requête TGS inhabituelle depuis un même hôte ?

    • Comptes visés : service accounts sensibles, comptes à privilèges ?

    • Volume anormal de demandes TGS sur un faible intervalle ?

    • Source connue dans l’inventaire ?

Actions

    • Basculer le compte visé en rotation de mot de passe si compromission suspectée.

    • Vérifier l’activité du poste source (process suspects, outillage Kerberoasting).
    
    • Rechercher d’autres comportements AD suspects (AS-REP, énumération).

Endiguement

    • Crypter les informations sensibles : https://attack.mitre.org/mitigations/M1041 

    • politique de mots de passe : caractères 25+ : https://attack.mitre.org/mitigations/M1027

    • gestion des comptes privilégié :  privilège minimum requis : https://attack.mitre.org/mitigations/M1026


### 2. AS-REP Roasting
Mitre att&ck : T1558.004 

Objectif : Détecter demandes abusives de tickets AS-REP sans pré-auth.

Detects AS-REP roasting attempts by monitoring for Kerberos AS-REQ/AS-REP authentication patterns where preauthentication is disabled (Event ID 4768 with Pre-Auth Type 0). Correlates these requests with subsequent service ticket activity (Event ID 4769) and anomalies such as requests using weak RC4 encryption (etype 0x17). Excessive enumeration of accounts with 'Do not require Kerberos preauthentication' set in Active Directory is another key detection point.

Vérifications

    • Le compte ciblé a-t-il "Do not require Kerberos pre-auth" activé ?

    • Volume inhabituel de demandes AS-REP ?

    • Poste source légitime ?

Actions

    • Désactiver l’option "sans pré-auth" si non justifiée.

    • Rotation du mot de passe du compte.

Endiguement

    • Audit : activer la préauthentification quand c’est possible : https://attack.mitre.org/mitigations/M1047

    • crypter les informations sensibles : privilégier les algorithme d’encryption fort : Encrypt Sensitive Information 

    • politique de mots de passe : caractères 25+  :Password Policies 


### 3. Shadow Credentials

Mitre att&ck : https://attack.mitre.org/tactics/TA0003/

Objectif : Détection de l’ajout de clés de type KeyCredentialLink (ajout de creds persistants).

Vérifications

    • Modification de msDS-KeyCredentialLink ?

    • Compte ciblé : admin ? compte de service ?

    • Poste source : légitime ou compromis ?

Actions

    • Supprimer la clé ajoutée.

    • Auditer l’historique du compte (changements de permissions, modifications AD récentes).

Endiguement

    • Déconnecter/suspendre le compte si malveillance avérée.



### 4. Password Spraying

Mitre att&ck : https://attack.mitre.org/techniques/T1110/003/

Objectif : Détection d’attaques par essais massifs de mots de passe.

Vérifications

    • Défaillances de connexion depuis une même IP ?

    • Comptes visés : concentration sur admin / comptes VIP ?

    • Origine réseau suspecte (VPN, externe, VLAN utilisateurs) ?

Actions

    • Bloquer IP source (si externe).

    • Vérifier les connexions réussies autour de l’événement.

Endiguement

    • Politique d’utilisation de compte : verrouiller un compte après trop d’échec (eviter denial of service) : Account Use Policies 

    • authentification multifacteur : authenticfication multifacteur quand c’est possible : Account Use Policies 

    • politique de mot de passe : définir une politque de mot de passe forte : Password Policies 



## Windows

### 5. Création d’une tâche planifiée suspecte

Vérifications

    • Nom de la tâche → aléatoire ? similaire à une tâche légitime ?

    • Chemin de l’exécutable → répertoires inhabituels (%TEMP%, %APPDATA%) ?

    • Initiateur → utilisateur ou service compromis ?

Actions

    • Désactiver la tâche → analyser le binaire ciblé.

    • Examiner les événements 4698 (création d’une tâches planifié), 4699(suppression d’une tâches planifié)



### 6. Création d’un service suspect

Vérifications

    • Nom du service → légitime ou typé malware ?

    • Binaire exécuté → signé ? exécutable inconnu ?

    • Paramètres (start type, arguments) ?

Actions

    • Stopper le service.

    • Analyser le fichier exécuté + chemin d’installation.



### 7. Création ou modification d’une clé RUN

Mitre att&ck : https://attack.mitre.org/techniques/T1547/001/

Vérifications

    • Chemin vers le binaire → %TEMP%, %APPDATA%, répertoires utilisateurs ?

    • Historique du fichier → horodatage anormal (timestomping) ?

Actions

    • Supprimer l’entrée RUN suspecte.

    • Soumettre le binaire à une sandbox ou analyse AV.


### 8. Dump LSASS

Mitre att&ck : https://attack.mitre.org/techniques/T1003/001/

Vérifications

    • Processus parent : procdump.exe, taskmgr.exe, powershell, comsvcs.dll.

    • Commandes avec -ma, -full, ou accès READ_MEMORY.

    • Présence d’outils Mimikatz / Cobalt Strike / Invoke-Mimikatz.

Actions

    • Isoler la machine immédiatement.

    • Changer les mots de passe des comptes connectés.

Endiguement

    • Activer ASR (win 10) : Behavior Prevention on Endpoint 

    • activation de credential guard : Credential Access Protection 

    • restreindre ou désactiver NTLM : Operating System Configuration 

    • politique de mot de passe : Password Policies 

    • gestion des comptes privilégié : Privileged Account Management 


## Linux

### 9. Multiples commandes d’énumération

Vérifications

    • Séquences : whoami, id, ifconfig/ip a, ps, netstat, ls -al /etc, cat /etc/passwd dans un faible intervalle.

    • Nouvel utilisateur ou processus shell inhabituel ?

    • Source SSH anormale ?

Actions

    • Examiner le shell interactif et les fichiers .bash_history.

    • Vérifier escalade de privilèges.


### 10. Activité de password looting

Vérifications

    • Accès à /etc/shadow, /etc/passwd suspect.

    • Utilisation d’outils : john, hashcat, scripts custom.

    • Processus consommant beaucoup de CPU sur hashing.

Actions

    • Suspendre les processus suspects.

    • Examiner l'origine (SSH, sudo, exploitation).


## Réseau

### 11. Scan de port horizontal / vertical

Vérifications

    • Multiples ports scannés vers une même cible (vertical).

    • Même port scanné sur plusieurs IP (horizontal).

    • Origine interne ou externe ?

Actions

    • Identifier l’hôte source dans l’inventaire.

    • Vérifier si un outil (Nmap/Masscan/Zmap) est présent.

Endiguement

    • Limiter la communication de l’hôte via firewall.


### 12. Activité de beaconing C2 (Command & Control)

Vérifications

    • Régularité du trafic : intervalles fixes (5s, 10s, 60s…).

    • Domaine rare / récemment créé / inconnu.

    • Communications chiffrées vers IP non reconnue.

Actions

    • Isoler l’hôte.

    • Extraire l’exécutable responsable (souvent un agent).

    • Scanner avec EDR / YARA



