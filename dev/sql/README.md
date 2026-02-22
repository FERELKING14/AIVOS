# SQL Scripts

Scripts PostgreSQL pour initialiser et gérer Supabase.

## Fichiers

### `show_structure.sql`
Affiche la structure de TOUTES les tables avec leurs colonnes, types et null constraints.

**Usage dans Supabase:**
1. SQL Editor → New Query
2. Copy-paste le contenu
3. Run

### `fill_db.sql`
Remplissage basique des catégories et produits.

### `fill_products_complete.sql`
Insertion COMPLÈTE des produits avec:
- Images depuis Imgur
- Prix avec réductions
- Tags (popular, flash_sale, bestseller, kids)
- Stock disponible
- Descriptions

⚠️ **À exécuter en premier après `show_structure.sql`**

### `seed_data.sql`
Données de démo initiales (alternative à fill_products_complete).

## Structure des Tables

### `categories`
```sql
id (UUID) - Primary Key
name (TEXT) - Nom de la catégorie
description (TEXT) - Description
image_url (TEXT) - URL de l'image
created_at (TIMESTAMP) - Auto-generated
```

### `products`
```sql
id (UUID) - Primary Key
title (TEXT) - Nom du produit
description (TEXT) - Description
brand (TEXT) - Marque
price (DECIMAL) - Prix unitaire
currency (TEXT) - Devise (USD, EUR, etc.)
stock (INT) - Quantité en stock
active (BOOLEAN) - Produit actif?
image_url (TEXT) - URL de l'image
tags (TEXT[]) - Array de tags pour filtrage
category_id (UUID) - Foreign key vers categories
created_at (TIMESTAMP) - Auto-generated
updated_at (TIMESTAMP) - Auto-generated
```

## Commandes Utiles

### Voir toutes les tables
```sql
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';
```

### Compter les produits
```sql
SELECT COUNT(*) as total FROM products;
SELECT COUNT(*) as categories FROM categories;
```

### Chercher par tag
```sql
SELECT * FROM products WHERE tags @> ARRAY['popular'];
SELECT * FROM products WHERE tags @> ARRAY['flash_sale'];
```

### Chercher par catégorie
```sql
SELECT * FROM products WHERE category_id IN (SELECT id FROM categories WHERE name = 'Woman''s');
```
