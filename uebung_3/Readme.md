# Ansible Vault Beispiel – Readme

In diesem Ordner findest du ein Beispiel, wie sensible Daten mit Ansible Vault geschützt und in Playbooks verwendet werden können.

## Dateien

- **using_vault.yaml**  
  Beispiel-Playbook, das Variablen aus einer verschlüsselten Datei (`vault.yaml`) und eine Inline-Variable verwendet.
- **vault.yaml**  
  (Sollte verschlüsselt sein!) Enthält sensible Variablen wie Benutzernamen und Passwörter.

## Nutzung

1. **Vault-Datei entschlüsseln oder erstellen**  
   Erstelle oder bearbeite die `vault.yaml` mit Ansible Vault:

   ```
   ansible-vault encrypt passwords.yaml --output vault.yaml 
   ```

2. **Beispiel-Inhalt für vault.yaml**  
   (Wird beim Erstellen verschlüsselt gespeichert)
   ```yaml
   credentials:
     backend:
       username: dein_user
       password: dein_passwort
   ```

3. **Playbook ausführen**  
   Beim Ausführen wirst du nach dem Vault-Passwort gefragt:

   ```
   ansible-playbook using_vault.yaml --ask-vault-pass
   ```

   Alternativ kannst du eine Passwortdatei verwenden:
   ```
   ansible-playbook using_vault.yaml --vault-password-file .vault_pass.txt
   ```

## Hinweise

- Die Datei `vault.yaml` sollte niemals unverschlüsselt ins Repository gelangen.
- Mit Ansible Vault kannst du sensible Daten sicher in Versionskontrolle speichern.

Weitere Infos: [Ansible Vault Dokumentation](https://docs.ansible.com/ansible/latest/user_guide/vault.html)