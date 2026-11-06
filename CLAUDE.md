# Instructies voor Claude (of een andere AI) bij deze website

Website van Sander Droog (sanderdroog.nl): business development, ventures en AI. Statische site: gewone HTML en CSS, geen framework, geen build-stap.

## Mappen
- `www/index.html` is de one-pager (ontwerp "Daglicht", versie 3). `www/fotos/` bevat de foto's (kleine letters, streepjes).
- `.github/scripts/dev-build.sh` maakt vóór het uploaden een dev-versie (zoekmachines geblokkeerd). Pas `www/` aan, niet `build/`.

## Werkwijze
1. Pas bestanden aan in `www/` en push naar branch `dev`.
2. Elke push naar `dev` zet de site op https://dev.sanderdroog.nl (GitHub Actions: `.github/workflows/deploy-dev.yml`).
3. Foto's: maximaal 1600 px breed, jpg kwaliteit ongeveer 80, beschrijvende alt-tekst.
4. Branch `main` is voor de echte site. De echte site (www.sanderdroog.nl) wordt nog niet vanuit deze repo gevuld: dat gebeurt pas als Sander het vraagt. Tot dan: niets live zetten.

## Huisstijl
- Taal: Nederlands, "ik"-vorm, gewone woorden, actieve zinnen. Nuchter, no-nonsense, met een beetje lef.
- Kleuren: marineblauw #0F2F57, blauw #1D4E89, lichtblauw #E6EFF9, hemelblauw #5B9BD9, oranje #E8762C. Koppen: Fraunces. Lopende tekst: Figtree.
- Logo: twee zeilen (marineblauw en oranje) met woordmerk "sanderdroog.nl" (variant 7f).

## Feiten (niet zelf aanvullen)
Twijfel je over een feit, vraag het Sander. KvK-nummer staat bewust niet op de site (nog niet bekend).

## Veiligheid
- Nooit wachtwoorden, sleutels of tokens in de repo. SFTP-gegevens staan alleen in GitHub Secrets.

## Lessen voor een nieuwe dev-site (TransIP + GitHub Actions)
Handig als dezelfde opzet voor een andere site nodig is (bijvoorbeeld klikklikwalls.nl). Hergebruik `.github/workflows/deploy-dev.yml` en `.github/scripts/dev-build.sh` en pas alleen hostnaam en `DEV_REMOTE_DIR` aan.
1. TransIP: voeg de dev-site toe als subsite via "Website toevoegen" en kies "Use a subdomain on …" (standaard staat het op het hoofddomein). Controleer het serverpad, bijvoorbeeld `/site/subsites/dev.<domein>`. Eén SFTP-gebruiker geldt voor het hele pakket.
2. GitHub: een nieuwe repo toont soms "Actions is not currently enabled". Klik dan op de groene knop "Enable Actions on this repository".
3. Sleutel: zet de privésleutel als één regel base64 in het geheim `SFTP_KEY_B64`. Meerdere regels plakken geeft `error in libcrypto`. De publieke sleutel gaat in TransIP via "Key toevoegen". Plak een privésleutel nooit in een chat.
4. `dev-build.sh` zet `DirectoryIndex index.html`, anders wint de TransIP-standaardpagina op `/`.
5. Na het aanmaken kan de dev-URL nog even "Reserved domain" tonen (DNS-cache). Wacht of probeer een privévenster.
6. Logs van een openbare repo zijn voor iedereen leesbaar: log geen gegevens die niet openbaar mogen zijn.
