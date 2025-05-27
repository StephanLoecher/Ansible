# Ansible Grundlagen – Nützliche Befehle und Erklärungen

Dieses Dokument bietet eine Übersicht über grundlegende Ansible-Befehle, um Hosts zu überprüfen, Informationen zu sammeln und Playbooks auszuführen. Zusätzlich werden die wichtigsten Konzepte kurz erklärt.

---

## 1. Hosts überprüfen

Mit Ansible kannst du prüfen, ob deine Zielsysteme erreichbar sind.

### Lokalen Host mit Ping testen

Prüft, ob Ansible auf dem lokalen Rechner funktioniert:

```
ansible localhost -m ping
```

### Alle Hosts aus einer Inventardatei anpingen

Überprüft alle Hosts, die in der Datei `hosts.yaml` definiert sind:

```
ansible -i hosts.yaml all -m ping
```

### Einen bestimmten Host anpingen

Testet nur einen bestimmten Host aus der Inventardatei (z.B. `vm-name`):

```
ansible -i hosts.yaml vm-name -m ping
```

---

## 2. Fakten (gather_facts) abfragen

Ansible kann automatisch Systeminformationen (Fakten) sammeln. Diese Fakten werden z.B. für bedingte Aufgaben oder Templates genutzt:

```
ansible localhost -m gather_facts -i hosts.yaml
```

---

## 3. Playbook ausführen

Ein Playbook ist eine YAML-Datei, die eine Abfolge von Aufgaben (Tasks) beschreibt, die auf Hosts ausgeführt werden.

### Playbook auf alle Hosts anwenden

```
ansible-playbook local.yaml -i hosts.yaml
```

Im Playbook `local.yaml` werden verschiedene Aufgaben ausgeführt, z.B. das Auslesen und Auswerten von Fakten oder das Verwenden von Variablen.

### Playbook auf einen bestimmten Host anwenden

Mit `--limit` kannst du das Playbook auf einen bestimmten Host beschränken (z.B. `test01`):

```
ansible-playbook local.yaml -i hosts.yaml --limit test01
```

---

## 4. Variablen, Fakten und Templates

- **Variablen**: Können pro Host, pro Gruppe, global oder direkt im Playbook definiert werden.
- **Fakten**: Automatisch gesammelte Systeminformationen, die als Variablen zur Verfügung stehen.
- **Templates**: Dateien, die mit Variablen dynamisch generiert werden (z.B. mit Jinja2). Damit kannst du Konfigurationsdateien flexibel gestalten.

Mit diesen Möglichkeiten lassen sich flexible und wiederverwendbare Automatisierungen erstellen.

---

Weitere Informationen findest du in der [offiziellen Ansible-Dokumentation](https://docs.ansible.com/).