
import 'package:flutter/material.dart';
import 'package:aivo/constants.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<Map<String, dynamic>> _wishlist = [
    {
      'title': 'Sneakers Nike Air Max',
      'image': 'https://i.imgur.com/IXnwbLk.png',
      'price': 129.99,
      'liked': true,
    },
    {
      'title': 'Montre Casio Vintage',
      'image': 'https://i.imgur.com/dz0BBom.png',
      'price': 49.99,
      'liked': true,
    },
    {
      'title': 'Sac à dos Herschel',
      'image': 'https://i.imgur.com/8Km9tLL.png',
      'price': 79.99,
      'liked': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Wishlist'),
        actions: [
          if (_wishlist.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              tooltip: 'Tout supprimer',
              onPressed: () {
                setState(() => _wishlist.clear());
              },
            ),
        ],
      ),
      body: _wishlist.isEmpty
          ? _EmptyWishlist()
          : ListView.separated(
              padding: const EdgeInsets.all(defaultPadding),
              itemCount: _wishlist.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, i) {
                final item = _wishlist[i];
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(item['image'], width: 56, height: 56, fit: BoxFit.cover),
                    ),
                    title: Text(item['title'], style: Theme.of(context).textTheme.titleMedium),
                    subtitle: Text('${item['price']} €', style: const TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(item['liked'] ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                          onPressed: () {
                            setState(() => _wishlist[i]['liked'] = !_wishlist[i]['liked']);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () {
                            setState(() => _wishlist.removeAt(i));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class _EmptyWishlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 24),
          Text('Votre wishlist est vide', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text('Ajoutez des produits à votre wishlist pour les retrouver facilement.',
              style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
