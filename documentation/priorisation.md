# Matrice de Priorisation SOC

| Catégorie | Alerte | Impact | Probabilité / Fiabilité | Contexte / Sensibilité | Priorité SOC |
|-----------|--------|--------|------------------------|-----------------------|--------------|
| Active Directory | Kerberoasting | Élevé | Forte | Comptes de service / admin | High |
| Active Directory | AS-REP Roasting | Élevé | Moyenne-Forte | Comptes sans pré-auth / sensibles | High |
| Active Directory | Shadow Credentials | Critique | Forte | Comptes privilégiés / AD | Critical |
| Active Directory | Password Spraying | Moyen-Élevé | Moyenne | Tentatives externes ou ciblage VIP | High |
| Windows | Création tâche planifiée suspecte | Moyen | Moyenne | Endpoint utilisateur ou serveur critique | Medium-High |
| Windows | Création service suspect | Élevé | Moyenne-Forte | Serveur critique / privilège admin | High |
| Windows | Création ou modification clé RUN | Moyen | Moyenne | Endpoint utilisateur / process suspect | Medium |
| Windows | Dump LSASS | Critique | Forte | Endpoint admin / serveur sensible | Critical |
| Linux | Multiples commandes d’énumération | Moyen | Moyenne | Serveur prod / comptes sensibles | Medium-High |
| Linux | Activité de password looting | Élevé | Forte | Compte root ou sudo | High |
| Réseau | Scan de port horizontal / vertical | Moyen | Moyenne | Serveur exposé / interne | Medium |
| Réseau | Beaconing C2 | Critique | Forte | Serveur interne ou endpoint | Critical |
