
import 'package:flutter/material.dart';
import 'package:aivo/constants.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final List<Map<String, dynamic>> _faqs = [
    {
      'question': 'Comment suivre ma commande ?',
      'answer': 'Vous pouvez suivre votre commande depuis la section "Orders" de votre profil.',
      'likes': 12,
      'liked': false,
      'popular': true,
    },
    {
      'question': 'Comment retourner un produit ?',
      'answer': 'Allez dans "Returns" puis suivez les instructions pour effectuer un retour.',
      'likes': 8,
      'liked': false,
      'popular': true,
    },
    {
      'question': 'Quels moyens de paiement acceptez-vous ?',
      'answer': 'Nous acceptons les cartes bancaires, PayPal et Apple Pay.',
      'likes': 5,
      'liked': false,
      'popular': false,
    },
    {
      'question': 'Comment modifier mon adresse ?',
      'answer': 'Dans la section "Addresses" de votre profil, cliquez sur modifier.',
      'likes': 3,
      'liked': false,
      'popular': false,
    },
  ];

  final TextEditingController _controller = TextEditingController();
  bool _showForm = false;

  @override
  Widget build(BuildContext context) {
    final popularFaqs = _faqs.where((f) => f['popular']).toList();
    final otherFaqs = _faqs.where((f) => !f['popular']).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_comment_outlined),
            tooltip: 'Poser une question',
            onPressed: () => setState(() => _showForm = !_showForm),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(defaultPadding),
        children: [
          if (_showForm) ...[
            Card(
              margin: const EdgeInsets.only(bottom: 24),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Posez votre question', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Votre question...',
                        border: OutlineInputBorder(),
                      ),
                      minLines: 1,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_controller.text.trim().isNotEmpty) {
                              setState(() {
                                _faqs.add({
                                  'question': _controller.text.trim(),
                                  'answer': 'Merci pour votre question ! Notre équipe vous répondra bientôt.',
                                  'likes': 0,
                                  'liked': false,
                                  'popular': false,
                                });
                                _controller.clear();
                                _showForm = false;
                              });
                            }
                          },
                          child: const Text('Envoyer'),
                        ),
                        const SizedBox(width: 12),
                        TextButton(
                          onPressed: () => setState(() => _showForm = false),
                          child: const Text('Annuler'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (popularFaqs.isNotEmpty) ...[
            const Text('FAQ populaires', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),
            ...popularFaqs.map((faq) => _FaqTile(
                  faq: faq,
                  onLike: () => setState(() => faq['liked'] = !(faq['liked'] as bool)),
                )),
            const Divider(height: 32),
          ],
          if (otherFaqs.isNotEmpty) ...[
            const Text('Toutes les FAQ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),
            ...otherFaqs.map((faq) => _FaqTile(
                  faq: faq,
                  onLike: () => setState(() => faq['liked'] = !(faq['liked'] as bool)),
                )),
          ],
          if (_faqs.isEmpty)
            const Center(child: Text('Aucune FAQ pour le moment.')),
        ],
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  final Map<String, dynamic> faq;
  final VoidCallback onLike;
  const _FaqTile({required this.faq, required this.onLike});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        title: Text(faq['question'], style: const TextStyle(fontWeight: FontWeight.w600)),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(faq['answer']),
          ),
        ],
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(faq['liked'] ? Icons.thumb_up : Icons.thumb_up_outlined, color: Colors.blue),
              onPressed: onLike,
              tooltip: 'Like',
            ),
            Text('${faq['likes'] + (faq['liked'] ? 1 : 0)}'),
          ],
        ),
      ),
    );
  }
}
