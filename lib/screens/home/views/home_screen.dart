import 'package:flutter/material.dart';
import 'package:aivo/components/Banner/S/banner_s_style_1.dart';
import 'package:aivo/components/Banner/S/banner_s_style_5.dart';
import 'package:aivo/constants.dart';
import 'package:aivo/route/screen_export.dart';

import 'components/best_sellers.dart';
import 'components/flash_sale.dart';
import 'components/most_popular.dart';
import 'components/offer_carousel_and_categories.dart';
import 'components/popular_products.dart';
import 'components/categories_section.dart';
import 'components/top_vendors.dart';
import 'components/trending_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 1. HERO BANNER & SEARCH
            const SliverToBoxAdapter(child: OffersCarouselAndCategories()),

            // 2. CATEGORIES WITH IMAGES
            const SliverToBoxAdapter(
              child: CategoriesSection(),
            ),

            // 3. POPULAR PRODUCTS
            const SliverToBoxAdapter(child: PopularProducts()),

            // 4. FLASH SALE / TIME-LIMITED OFFERS
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding * 1.5),
              sliver: SliverToBoxAdapter(child: FlashSale()),
            ),

            // 5. TOP VENDORS/STORES
            const SliverToBoxAdapter(
              child: TopVendors(),
            ),

            // 6. NEW ARRIVAL BANNER
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: defaultPadding / 2),
                  BannerSStyle1(
                    title: "New \narrival",
                    subtitle: "SPECIAL OFFER",
                    discountParcent: 50,
                    press: () {
                      Navigator.pushNamed(context, onSaleScreenRoute);
                    },
                  ),
                  const SizedBox(height: defaultPadding / 2),
                ],
              ),
            ),

            // 7. BEST SELLERS
            const SliverToBoxAdapter(child: BestSellers()),

            // 8. FEATURED CREATORS/INDIVIDUALS
            const SliverToBoxAdapter(
              child: FeaturedCreators(),
            ),

            // 9. TRENDING PRODUCTS
            const SliverToBoxAdapter(child: TrendingProducts()),

            // 10. MOST POPULAR
            const SliverToBoxAdapter(child: MostPopular()),

            // 11. BLACK FRIDAY BANNER / SEASONAL
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: defaultPadding * 1.5),
                  BannerSStyle5(
                    title: "Black \nfriday",
                    subtitle: "50% Off",
                    bottomText: "Collection".toUpperCase(),
                    press: () {
                      Navigator.pushNamed(context, onSaleScreenRoute);
                    },
                  ),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ),

            // 12. MORE BEST SELLERS / RELATED
            const SliverToBoxAdapter(child: BestSellers()),
          ],
        ),
      ),
    );
  }
}
