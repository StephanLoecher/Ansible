# Ansible Rollen – Beispiel und Anleitung

In diesem Ordner findest du eine Übung zum Thema **Ansible Rollen**. Rollen helfen dabei, Ansible-Code zu strukturieren und wiederverwendbar zu machen.

## Inhalt

- Beispiel für das Erstellen eines SSH-Schlüssels
- Hinweise zur Verwendung von Rollen in Ansible

## SSH-Key erstellen

Mit folgendem Befehl kannst du einen neuen SSH-Schlüssel erzeugen (z.B. für Testzwecke):

```
ssh-keygen -t rsa -b 4096 -C "paul@test-sky-e-red.de"
```
Gib beim Speichern des Schlüssels z.B. folgendes an:
```
/Users/paul/.ssh/id_rsa_test
```

## Ansible Rollen verwenden

1. **Playbook ausführen**  
   Eine Rolle mit Ansible auf einem Host ausführen:
   ```
   ansible-playbook meine-neue-rolle.yaml --limit "master01" -i hosts.yaml
   ```
   Eine Rolle mit Ansible auf alle Hosts ausführen mit einem dry-run (nur ein test):
   ```
   ansible-playbook meine-neue-rolle.yaml -i hosts.yaml --check
   ```

2. **Rolle im Playbook einbinden**  
   Im Playbook kannst du die Rolle wie folgt einbinden:
   ```yaml
   - hosts: all
     roles:
       - meine-neue-rolle
   ```

3. **Variablen und Aufgaben anpassen**  
   Passe die Aufgaben und Variablen in der Rolle nach deinen Anforderungen an.

4. **Beispiel: Automatisches anlegen von einer Rolle**
   Erstelle mit Ansible Galaxy eine neue Rolle:
   ```
   ansible-galaxy init <rollenname>
   ```
   Beispiel:
   ```
   ansible-galaxy init meine-zweite-rolle
   ```
---

Weitere Infos zu Ansible Rollen findest du in der [offiziellen Dokumentation](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html).