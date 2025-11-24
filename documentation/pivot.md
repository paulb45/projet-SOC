# Librairie de Pivot SOC – Alertes Critiques

| Catégorie | Alerte | IOC / IOA | Points de Pivot | Commandes / Playbooks | Historique / Ticket |
|-----------|--------|-----------|----------------|---------------------|------------------|
| Active Directory | Kerberoasting | Ticket TGS anormal, comptes de service ciblés | Compte AD, machine source, logs Kerberos | `Splunk search: index=wineventlog EventCode=4769`, LdapSearch, Playbook Kerberoasting | Ticket #SOC-001 |
| Active Directory | AS-REP Roasting | Compte sans pré-auth, tickets AS-REP | Compte AD, IP source, machine cible | `Get-ADUser -Properties * | where { $_.UserCannotChangePassword -eq $true }`, Playbook AS-REP | Ticket #SOC-002 |
| Active Directory | Shadow Credentials | msDS-KeyCredentialLink modifié | Compte privilégié AD, machine source | `PowerShell: Get-ADUser -Identity <User> -Properties msDS-KeyCredentialLink`, Playbook Shadow Credentials | Ticket #SOC-003 |
| Active Directory | Password Spraying | Echecs multiples sur comptes sensibles | IP source, comptes ciblés, machine | `Splunk: failed login > 5 in 30m`, Playbook Password Spraying | Ticket #SOC-004 |
| Windows | Création tâche planifiée suspecte | TaskScheduler / chemin binaire | Machine, utilisateur, binaire | `Get-ScheduledTask | Where-Object {$_.TaskPath -like "*\\Suspicious*"} `, Playbook Tâche Planifiée | Ticket #SOC-005 |
| Windows | Création service suspect | Service inhabituel, binaire inconnu | Machine, binaire, parent process | `Get-Service | Where-Object {$_.DisplayName -like "*Suspicious*"}`, Playbook Service Suspect | Ticket #SOC-006 |
| Windows | Clé RUN modifiée | HKCU\...\Run ou HKLM\...\Run | Machine, utilisateur, binaire | `Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Run`, Playbook RunKey | Ticket #SOC-007 |
| Windows | Dump LSASS | Proc dump, mémoire LSASS | Machine, utilisateur, processus parent | `procdump /ma lsass.exe`, Playbook Dump LSASS | Ticket #SOC-008 |
| Linux | Multiples commandes d’énumération | `whoami`, `id`, `netstat -anp` | Machine, utilisateur, commande historique | `auditd logs`, Playbook Enum Linux | Ticket #SOC-009 |
| Linux | Password Looting | Accès `/etc/shadow` | Compte root, hôte cible, outils de cracking | `grep /etc/shadow`, Playbook Password Looting | Ticket #SOC-010 |
| Réseau | Scan de ports | SYN/ACK probes, Nmap, Masscan | IP source, IP cible, ports | `Zeek logs`, `Splunk search: port scan`, Playbook Scan Réseau | Ticket #SOC-011 |
| Réseau | Beaconing C2 | Traffic répétitif, domaine/IP rare | IP interne, domaine C2, endpoint | `Splunk search: dns queries frequency > threshold`, Playbook Beaconing C2 | Ticket #SOC-012 |
