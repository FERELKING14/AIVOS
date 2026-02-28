import 'package:flutter/material.dart';
import 'package:aivo/components/network_image_with_loader.dart';
import 'package:aivo/models/category_model.dart';
import 'package:aivo/constants.dart';

class CategoryCardWithImage extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;

  const CategoryCardWithImage({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Colors.grey[200],
        ),
        child: Stack(
          children: [
            // Background Image
            if (category.imageUrl != null && category.imageUrl!.isNotEmpty)
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: NetworkImageWithLoader(
                  category.imageUrl!,
                  fit: BoxFit.cover,
                  radius: 12,
                ),
              )
            else
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
              ),
            // Gradient overlay for better text visibility
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.3),
                    Colors.black.withValues(alpha: 0.5),
                  ],
                ),
              ),
            ),
            // Category Name and Count
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding / 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category Name
                    Text(
                      category.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Product count (if available from backend)
                    if (category.description != null)
                      Text(
                        category.description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 11,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Category grid for home screen - shows main categories with images
class CategoriesGrid extends StatefulWidget {
  final List<CategoryModel>? categories;
  final Function(CategoryModel) onCategoryTap;

  const CategoriesGrid({
    super.key,
    this.categories,
    required this.onCategoryTap,
  });

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  @override
  Widget build(BuildContext context) {
    if (widget.categories == null || widget.categories!.isEmpty) {
      return const Center(
        child: Text("No categories available"),
      );
    }

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
      itemCount: widget.categories!.length,
      itemBuilder: (context, index) {
        return CategoryCardWithImage(
          category: widget.categories![index],
          onTap: () => widget.onCategoryTap(widget.categories![index]),
        );
      },
    );
  }
}
