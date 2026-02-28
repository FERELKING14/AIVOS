// Supabase Integration
const String vendorDemoImg1 = "https://i.imgur.com/VE8HF1L.png";
const String vendorDemoImg2 = "https://i.imgur.com/PEkASmJ.png";
const String vendorDemoImg3 = "https://i.imgur.com/M5x5Oy0.png";
const String vendorDemoImg4 = "https://i.imgur.com/tQvPrwJ.png";
const String vendorDemoImg5 = "https://i.imgur.com/8z7NlK9.png";

enum VendorType { professional, individual }

class VendorModel {
  final String id;
  final String name;
  final String? description;
  final String? logoUrl;
  final String? bannerUrl;
  final double rating;
  final int reviewCount;
  final VendorType vendorType; // professional or individual
  final bool isVerified;
  final int productCount;
  final String? location;
  final List<String> categories;
  final DateTime? createdAt;
  final String? website;
  final bool isFollowed;

  VendorModel({
    required this.id,
    required this.name,
    this.description,
    this.logoUrl,
    this.bannerUrl,
    this.rating = 4.5,
    this.reviewCount = 0,
    this.vendorType = VendorType.professional,
    this.isVerified = false,
    this.productCount = 0,
    this.location,
    this.categories = const [],
    this.createdAt,
    this.website,
    this.isFollowed = false,
  });

  // Helper constructor for demo/mock data compatibility
  VendorModel.fromMock({
    required String id,
    required String name,
    String? description,
    String? logoUrl,
    String? bannerUrl,
    double rating = 4.5,
    int reviewCount = 0,
    VendorType vendorType = VendorType.professional,
    bool isVerified = false,
    int productCount = 0,
    String? location,
    List<String> categories = const [],
    String? website,
    bool isFollowed = false,
  }) : this(
          id: id,
          name: name,
          description: description,
          logoUrl: logoUrl,
          bannerUrl: bannerUrl,
          rating: rating,
          reviewCount: reviewCount,
          vendorType: vendorType,
          isVerified: isVerified,
          productCount: productCount,
          location: location,
          categories: categories,
          createdAt: null,
          website: website,
          isFollowed: isFollowed,
        );

  // Factory constructor to create VendorModel from JSON (Supabase)
  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? 'Unknown Vendor',
      description: json['description'] as String?,
      logoUrl: json['logo_url'] as String?,
      bannerUrl: json['banner_url'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 4.5,
      reviewCount: json['review_count'] as int? ?? 0,
      vendorType: json['vendor_type'] == 'individual'
          ? VendorType.individual
          : VendorType.professional,
      isVerified: json['is_verified'] as bool? ?? false,
      productCount: json['product_count'] as int? ?? 0,
      location: json['location'] as String?,
      categories: json['categories'] != null
          ? List<String>.from(json['categories'] as List)
          : [],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      website: json['website'] as String?,
      isFollowed: json['is_followed'] as bool? ?? false,
    );
  }

  // Convert VendorModel to JSON for Supabase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'logo_url': logoUrl,
      'banner_url': bannerUrl,
      'rating': rating,
      'review_count': reviewCount,
      'vendor_type':
          vendorType == VendorType.individual ? 'individual' : 'professional',
      'is_verified': isVerified,
      'product_count': productCount,
      'location': location,
      'categories': categories,
      'created_at': createdAt?.toIso8601String(),
      'website': website,
      'is_followed': isFollowed,
    };
  }

  // Badge text for vendor type
  String get vendorTypeLabel =>
      vendorType == VendorType.individual ? 'Creator' : 'Professional';

  // Get rating stars
  int get ratingStars => rating.toInt();
}

// Demo data
List<VendorModel> demoTopVendors = [
  VendorModel.fromMock(
    id: '1',
    name: 'Fashion Palace',
    description: 'Premium clothing & accessories',
    logoUrl: vendorDemoImg1,
    rating: 4.8,
    reviewCount: 342,
    vendorType: VendorType.professional,
    isVerified: true,
    productCount: 245,
    location: 'New York, USA',
    categories: ['Fashion', 'Accessories'],
  ),
  VendorModel.fromMock(
    id: '2',
    name: 'Vintage Crafts Co',
    description: 'Handmade vintage items & crafts',
    logoUrl: vendorDemoImg2,
    rating: 4.6,
    reviewCount: 156,
    vendorType: VendorType.individual,
    isVerified: true,
    productCount: 87,
    location: 'Portland, USA',
    categories: ['Crafts', 'Vintage'],
  ),
  VendorModel.fromMock(
    id: '3',
    name: 'Urban Style Store',
    description: 'Modern urban fashion',
    logoUrl: vendorDemoImg3,
    rating: 4.7,
    reviewCount: 298,
    vendorType: VendorType.professional,
    isVerified: true,
    productCount: 180,
    location: 'Los Angeles, USA',
    categories: ['Fashion', 'Street Wear'],
  ),
  VendorModel.fromMock(
    id: '4',
    name: 'Artisan Goods',
    description: 'Unique handcrafted items',
    logoUrl: vendorDemoImg4,
    rating: 4.5,
    reviewCount: 89,
    vendorType: VendorType.individual,
    isVerified: false,
    productCount: 45,
    location: 'Brooklyn, USA',
    categories: ['Handmade', 'Art'],
  ),
  VendorModel.fromMock(
    id: '5',
    name: 'Global Traders',
    description: 'International products & gifts',
    logoUrl: vendorDemoImg5,
    rating: 4.4,
    reviewCount: 267,
    vendorType: VendorType.professional,
    isVerified: true,
    productCount: 512,
    location: 'Singapore',
    categories: ['Gifts', 'Electronics', 'Home'],
  ),
];

List<VendorModel> demoFeaturedIndividuals = [
  VendorModel.fromMock(
    id: '10',
    name: 'Luna Designs',
    description: 'Creative jewelry artist',
    logoUrl: vendorDemoImg2,
    rating: 4.9,
    reviewCount: 134,
    vendorType: VendorType.individual,
    isVerified: true,
    productCount: 32,
    location: 'Austin, USA',
    categories: ['Jewelry', 'Art'],
  ),
  VendorModel.fromMock(
    id: '11',
    name: 'Heritage Textiles',
    description: 'Traditional handwoven fabrics',
    logoUrl: vendorDemoImg4,
    rating: 4.7,
    reviewCount: 78,
    vendorType: VendorType.individual,
    isVerified: true,
    productCount: 28,
    location: 'India',
    categories: ['Textiles', 'Home'],
  ),
  VendorModel.fromMock(
    id: '12',
    name: 'Ceramic Artist Studio',
    description: 'Hand-thrown ceramics & pottery',
    logoUrl: vendorDemoImg1,
    rating: 4.8,
    reviewCount: 96,
    vendorType: VendorType.individual,
    isVerified: true,
    productCount: 42,
    location: 'California, USA',
    categories: ['Home', 'Art'],
  ),
];
