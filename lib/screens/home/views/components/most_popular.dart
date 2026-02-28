import 'package:flutter/material.dart';
import 'package:aivo/components/product/secondary_product_card.dart';
import 'package:aivo/models/product_model.dart';
import 'package:aivo/services/supabase_service.dart';

import 'package:aivo/components/skleton/product/product_card_skelton.dart';
import '../../../../constants.dart';
import '../../../../route/route_constants.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({
    super.key,
  });

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  late Future<List<ProductModel>> _mostPopularProducts;

  @override
  void initState() {
    super.initState();
    _mostPopularProducts = SupabaseService().getPopularProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Most popular",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 114,
          child: FutureBuilder<List<ProductModel>>(
            future: _mostPopularProducts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      left: defaultPadding,
                      right: index == 3 ? defaultPadding : 0,
                    ),
                    child: const ProductCardSkelton(),
                  ),
                );
              }
              if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No popular products"));
              }
              final products = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: defaultPadding,
                    right: index == products.length - 1 ? defaultPadding : 0,
                  ),
                  child: SecondaryProductCard(
                    image: products[index].imageUrl ?? productDemoImg1,
                    brandName: products[index].brand ?? "Brand",
                    title: products[index].title,
                    price: products[index].price,
                    priceAfetDiscount: products[index].priceAfetDiscount,
                    dicountpercent: products[index].dicountpercent,
                    press: () {
                      Navigator.pushNamed(context, productDetailsScreenRoute,
                          arguments: products[index].id);
                    },
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
