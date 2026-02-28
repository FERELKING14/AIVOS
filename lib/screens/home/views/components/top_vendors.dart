import 'package:flutter/material.dart';
import 'package:aivo/components/vendor/vendor_card.dart';
import 'package:aivo/components/skleton/vendor/vendor_card_skelton.dart';
import 'package:aivo/models/vendor_model.dart';
import 'package:aivo/services/supabase_service.dart';
import 'package:aivo/constants.dart';

class TopVendors extends StatefulWidget {
  final Function(VendorModel)? onVendorTap;
  final Function(VendorModel)? onFollowTap;

  const TopVendors({
    super.key,
    this.onVendorTap,
    this.onFollowTap,
  });

  @override
  State<TopVendors> createState() => _TopVendorsState();
}

class _TopVendorsState extends State<TopVendors> {
  late Future<List<VendorModel>> _vendors;

  @override
  void initState() {
    super.initState();
    _vendors = SupabaseService().getTopVendors();
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
                "Top Stores",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to all vendors
                },
                child: Text(
                  "View All",
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
          height: 200,
          child: FutureBuilder<List<VendorModel>>(
            future: _vendors,
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
                    child: const VendorCardSkelton(),
                  ),
                );
              }
              if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No vendors available"));
              }

              final vendors = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vendors.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: defaultPadding,
                    right: index == vendors.length - 1 ? defaultPadding : 0,
                  ),
                  child: VendorCard(
                    vendor: vendors[index],
                    onTap: () => widget.onVendorTap?.call(vendors[index]),
                    onFollowTap: () => widget.onFollowTap?.call(vendors[index]),
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

// Featured Individual Vendors/Creators Section
class FeaturedCreators extends StatefulWidget {
  final Function(VendorModel)? onVendorTap;

  const FeaturedCreators({
    super.key,
    this.onVendorTap,
  });

  @override
  State<FeaturedCreators> createState() => _FeaturedCreatorsState();
}

class _FeaturedCreatorsState extends State<FeaturedCreators> {
  late Future<List<VendorModel>> _vendors;

  @override
  void initState() {
    super.initState();
    _vendors = SupabaseService().getFeaturedIndividuals();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Featured Creators",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 70,
          child: FutureBuilder<List<VendorModel>>(
            future: _vendors,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        3,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                            left: defaultPadding,
                            right: index == 2 ? defaultPadding : 0,
                          ),
                          child: const VendorCardSmallSkelton(),
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No creators available"));
              }

              final vendors = snapshot.data!;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      vendors.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                          left: defaultPadding,
                          right: index == vendors.length - 1 ? defaultPadding : 0,
                        ),
                        child: SizedBox(
                          width: 280,
                          child: VendorCardSmall(
                            vendor: vendors[index],
                            onTap: () => widget.onVendorTap?.call(vendors[index]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
