import 'package:flutter/material.dart';
import 'package:aivo/components/product/product_card.dart';
import 'package:aivo/constants.dart';

// Widget Preview Test - Best Sellers Component
class BestSellersPreview extends StatelessWidget {
  const BestSellersPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: defaultPadding / 2),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "Best sellers",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    left: defaultPadding,
                    right: index == 2 ? defaultPadding : 0,
                  ),
                  child: ProductCard(
                    image: productDemoImg1,
                    brandName: "Brand ${index + 1}",
                    title: "Product ${index + 1}",
                    price: 99.99,
                    priceAfetDiscount: 79.99,
                    dicountpercent: 20,
                    press: () {},
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
