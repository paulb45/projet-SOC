# Workflow d’Investigation SOC

## 1. Déclenchement
### Sources possibles

    SIEM (Splunk)

    Utilisateur ou équipe interne

    RSSI / CSIRT / CERT

### Objectifs

    Identifier la source et la nature de l’alerte

    Effectuer une première vérification de légitimité

    Ouvrir et initialiser un ticket d’investigation

## 2. Qualification L1 (Triage Initial)
### Actions L1

#### Vérifier rapidement la validité de l’alerte:

    Contexte légitime ?

    Surveillance déjà active ?

    Collecter les informations minimales

        IP / Hostname

        Utilisateur impliqué

        Type d’événement

        Heure, répétition, récurrence

        Source du log

#### Classifier l’alerte

    Malware / Réseau / AD / OS / Application

    Probabilité (Faible / Moyenne / Forte)

    Gravité (Low / Medium / High / Critical)

### Décision L1

    Faux positif → clôture

    Incertitude → escalade L2

    Menace probable ou avérée → escalade urgente L2 et pré-containment

## 3. Investigation L2 (Analyse Approfondie)

### Objectifs

    Confirmer ou infirmer l’incident

    Déterminer la portée et l’impact

    Identifier le vecteur d’entrée

### Actions L2

    Analyse multi-sources

    Logs Windows / Linux

    Logs AD (authentifications, Kerberos, modifications)

    Analyse réseau (exfiltration, scans)

    Vérification des persistences

    Reconstitution de la Kill Chain

    Initial Access

    Execution

    Privilege Escalation

    Lateral Movement

    Persistence

    Impact

    Évaluation de l’impact

    Comptes compromis

    Hôtes affectés

    Données sensibles potentiellement exposées

### Décision L2

    Incident confirmé

    Incident probable

    Faux positif qualifié

## 4. Confinement

### Objectifs

    Limiter les dégâts immédiatement sans perturber inutilement la production.

    Actions possibles

    Isolation de machine

    Blocage de domaine / IP / hash

    Révocation de session ou token

    Désactivation de compte

    Suppression tâche/RunKey/service malveillant

### Règles

    Minimiser l’impact opérationnel

    Ne pas alerter l’attaquant prématurément

    Documenter chaque action dans le ticket

## 5. Éradication

### Objectifs

    Supprimer la cause racine et tous les artefacts.

### Actions

    Suppression des fichiers malveillants

    Rotation des identifiants compromis

    Suppression persistences (RunKey, services, scheduled tasks, WMI)

    Patch des vulnérabilités exploitées

    Ajout IOC/IOA dans les outils de sécurité

## 6. Rétablissement

### Objectifs

    Ramener l’environnement dans un état propre et sûr.

### Actions

    Réintégrer hôte isolé au réseau

    Restaurer services et comptes

    Réimager si nécessaire

    Renforcer la surveillance pendant 24–72h

    Vérifier qu’aucune réinfection ne se produit

## 7. Clôture d’Incident (L3)

### Contenu obligatoire

    Résumé de l’incident

    Chronologie (timeline)

    Preuves collectées

    Impact final

    Actions L1/L2/L3

### Recommandations

    Rattachement MITRE ATT&CK

    Documentation

    Le ticket doit contenir suffisamment d’informations pour :

        Être compris par un tiers

        Servir de base juridique ou gouvernance

        Être audité

## 8. Amélioration Continue

### Actions post-incident

    Mise à jour des règles SIEM / EDR / NDR

    Ajout de nouveaux IOC dans les outils

    Update des playbooks concernés

    Réunion Retex (SOC / IT / Sécurité)

    Renforcement des mesures de protection