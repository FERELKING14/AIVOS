import 'package:flutter/material.dart';
import 'package:aivo/components/product/product_card.dart';
import 'package:aivo/components/skleton/product/product_card_skelton.dart';
import 'package:aivo/models/product_model.dart';
import 'package:aivo/route/screen_export.dart';
import 'package:aivo/services/supabase_service.dart';
import 'package:aivo/constants.dart';

class TrendingProducts extends StatefulWidget {
  const TrendingProducts({super.key});

  @override
  State<TrendingProducts> createState() => _TrendingProductsState();
}

class _TrendingProductsState extends State<TrendingProducts> {
  late Future<List<ProductModel>> _trendingProducts;

  @override
  void initState() {
    super.initState();
    // For now, use popular products as trending - can be updated to use a dedicated trending endpoint
    _trendingProducts = SupabaseService().getPopularProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending Now",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, onSaleScreenRoute);
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: FutureBuilder<List<ProductModel>>(
            future: _trendingProducts,
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
              if (snapshot.hasError ||
                  !snapshot.hasData ||
                  snapshot.data!.isEmpty) {
                return const Center(child: Text("No products available"));
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
                  child: ProductCard(
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
