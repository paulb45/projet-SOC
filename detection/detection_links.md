# Documentation interne pour implémentation des règles de détection

> [!WARNING]  
> IMPORTANT: Il faut remplacer tous les index="test" dans nos règles de détection par index="prod" !!

## How to create an alert in Splunk

1. Navigate to the Search page in the Search & Reporting app.
2. Create a search.
3. Select Save As > Alert

[More info here](https://help.splunk.com/en/splunk-enterprise/alert-and-respond/alerting-manual/10.0/create-alerts/create-real-time-alerts)

## Fields requirements (n8n)

Pour rappel, chaque alerte Splunk déclenchera un webhook qui lancera une automatisation n8n.
Voic l'adresse du webhook: `https://soc_n8n/webhook-test/alert`

Les champs suivants sont présents dans le workflow, et doivent donc être présent dans chaque alerte.

 - alert_title
 - alert_description
 - alert_source
 - host
 - results_link
 - alert_severity_id
 - alert_source_event_time
 - alert_source_event_time


## Useful Links
[Kerberoasting](https://redhead0ntherun.medium.com/kerberos-anomaly-detection-via-splunk-8fd57ee0d278)
[AS-REPRoasting]()
