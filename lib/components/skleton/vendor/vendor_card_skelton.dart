import 'package:flutter/material.dart';
import 'package:aivo/components/skleton/skelton.dart';

class VendorCardSkelton extends StatelessWidget {
  const VendorCardSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo skeleton
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Skeleton(
              width: double.infinity,
              height: 100,
            ),
          ),
          // Content skeleton
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(
                  width: 120,
                  height: 12,
                ),
                const SizedBox(height: 8),
                Skeleton(
                  width: 80,
                  height: 10,
                ),
                const SizedBox(height: 8),
                Skeleton(
                  width: 130,
                  height: 10,
                ),
                const SizedBox(height: 8),
                Skeleton(
                  width: double.infinity,
                  height: 28,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VendorCardSmallSkelton extends StatelessWidget {
  const VendorCardSmallSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Skeleton(
            width: 60,
            height: 70,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Skeleton(width: 100, height: 12),
                const SizedBox(height: 4),
                Skeleton(width: 80, height: 10),
                const SizedBox(height: 4),
                Skeleton(width: 120, height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
