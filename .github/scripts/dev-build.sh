#!/usr/bin/env bash
# Maakt van www/ een veilige dev-versie in build/: zoekmachines geblokkeerd.
set -euo pipefail
cd "$(dirname "$0")/../.."
rm -rf build && cp -a www build
printf 'User-agent: *\nDisallow: /\n' > build/robots.txt
rm -f build/sitemap.xml
# Aanvullend: noindex-tag in elke html-pagina
find build -name '*.html' -print0 | xargs -0 sed -i 's#<head>#<head>\n<meta name="robots" content="noindex, nofollow">#'
# .htaccess: header X-Robots-Tag (alleen op dev), bestaande regels blijven staan
touch build/.htaccess
# Standaardpagina van TransIP mag onze index.html niet overschaduwen
printf 'DirectoryIndex index.html\n' | cat - build/.htaccess > build/.htaccess.new && mv build/.htaccess.new build/.htaccess
cat >> build/.htaccess <<'HT'
<IfModule mod_headers.c>
Header set X-Robots-Tag "noindex, nofollow, noarchive"
</IfModule>
HT
grep -q 'Disallow: /' build/robots.txt
grep -q 'noindex' build/index.html
echo "dev-build klaar"
