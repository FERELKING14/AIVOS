# Shell Scripts

Scripts utilitaires pour explorer et administrer Supabase via l'API REST.

## Fichiers

### `explore_db.sh`
Explore la structure complète de la base de données.

**Usage:**
```bash
bash explore_db.sh
```

**Output:**
- Vérifie la connexion Supabase
- Liste les tables existantes
- Affiche un exemple de donnée pour chaque table
- Montre le nombre de lignes

### `get_db_structure.sh`
Récupère les métadonnées détaillées des tables.

**Usage:**
```bash
bash get_db_structure.sh
```

**Output:**
- Teste les colonnes possibles pour chaque table
- Identifie les colonnes valides
- Nécessite `jq` pour parser JSON

### `test_columns.sh`
Teste les différentes colonnes possibles pour les tables.

**Usage:**
```bash
bash test_columns.sh 2>&1
```

**Output:**
- Test combinatoire de colonnes
- Identifie la structure réelle de la DB

### `SUPABASE_REMPLISSAGE.sh`
Instructions pour remplir manuellement Supabase.

**Usage:**
```bash
bash SUPABASE_REMPLISSAGE.sh
```

## Configuration Requise

Ces scripts utilisent:
- `curl` - Pour les requêtes HTTP
- `jq` - Pour parser JSON (optionnel)
- `bash` - Shell (version 4+)

**Installation sur Linux/Mac:**
```bash
# Debian/Ubuntu
sudo apt-get install curl jq

# macOS
brew install curl jq
```

## Variables d'Environnement

Les scripts utilisent les vars hardcodées:
- `SUPABASE_URL` - URL du projet
- `SUPABASE_KEY` - Publish Key (publique)

Pour les changer, éditez le début du script.

## Exemples d'Usage

### Explorer la DB
```bash
bash explore_db.sh 2>&1 | grep -A 5 "CATEGORIES"
```

### Tester une connexion
```bash
curl -s https://sbgstgpacvyomuimcfem.supabase.co/rest/v1/products?limit=1 \
  -H "apikey: sb_publishable_..." | jq '.'
```

### Vérifier les colonnes d'une table
```bash
curl -s https://sbgstgpacvyomuimcfem.supabase.co/rest/v1/products?select=*&limit=1 \
  -H "apikey: sb_publishable_..." | jq 'keys'
```

## Notes

- Les scripts explorent la DB en **lecture seule**
- Utilise la **Publish Key** (clé publique)
- Ne demande jamais le **Service Role** (clé privée)
- Sûr à exécuter publiquement
