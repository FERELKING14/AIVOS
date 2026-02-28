import 'package:flutter/material.dart';

import '../../../constants.dart';

class EmptyPaymentScreen extends StatelessWidget {
  const EmptyPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Methods"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset(
              Theme.of(context).brightness == Brightness.light
                  ? "assets/Illustration/EmptyState_lightTheme.png"
                  : "assets/Illustration/EmptyState_darkTheme.png",
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            const Spacer(),
            Text(
              "No Payment Methods",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5, vertical: defaultPadding),
              child: Text(
                "You haven't added any payment methods yet. Add a card to make purchases easier.",
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to add payment method screen
                Navigator.pushNamed(context, 'add_payment_method');
              },
              child: const Text("Add Payment Method"),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
