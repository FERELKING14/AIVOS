import 'package:flutter/material.dart';
import 'package:aivo/components/category/category_card_with_image.dart';
import 'package:aivo/models/category_model.dart';
import 'package:aivo/services/supabase_service.dart';
import 'package:aivo/components/skleton/product/product_card_skelton.dart';
import 'package:aivo/constants.dart';

class CategoriesSection extends StatefulWidget {
  final Function(CategoryModel)? onCategoryTap;

  const CategoriesSection({
    super.key,
    this.onCategoryTap,
  });

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  late Future<List<CategoryModel>> _categories;

  @override
  void initState() {
    super.initState();
    _categories = SupabaseService().getCategories();
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
            "Categories",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        FutureBuilder<List<CategoryModel>>(
          future: _categories,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return GridView.builder(
                padding: const EdgeInsets.all(defaultPadding),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: defaultPadding,
                  mainAxisSpacing: defaultPadding,
                ),
                itemCount: 4,
                itemBuilder: (context, index) => const ProductCardSkelton(),
              );
            }
            if (snapshot.hasError ||
                !snapshot.hasData ||
                snapshot.data!.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Center(child: Text("No categories available")),
              );
            }

            final categories = snapshot.data!;

            return GridView.builder(
              padding: const EdgeInsets.all(defaultPadding),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: defaultPadding,
                mainAxisSpacing: defaultPadding,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryCardWithImage(
                  category: categories[index],
                  onTap: () => widget.onCategoryTap?.call(categories[index]),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
