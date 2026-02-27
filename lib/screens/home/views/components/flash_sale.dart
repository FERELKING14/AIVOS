import 'package:flutter/material.dart';
import 'package:aivo/route/route_constants.dart';
import 'package:aivo/services/supabase_service.dart';

import '/components/Banner/M/banner_m_with_counter.dart';
import '../../../../components/product/product_card.dart';
import '../../../../constants.dart';
import '../../../../models/product_model.dart';

class FlashSale extends StatefulWidget {
  const FlashSale({
    super.key,
  });

  @override
  State<FlashSale> createState() => _FlashSaleState();
}

class _FlashSaleState extends State<FlashSale> {
  late Future<List<ProductModel>> _flashSaleProducts;

  @override
  void initState() {
    super.initState();
    _flashSaleProducts = SupabaseService().getFlashSaleProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BannerMWithCounter(
          duration: const Duration(hours: 8),
          text: "Super Flash Sale \n50% Off",
          press: () {},
        ),
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Flash sale",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 220,
          child: FutureBuilder<List<ProductModel>>(
            future: _flashSaleProducts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No flash sale products"));
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
        ),
      ],
    );
  }
}
