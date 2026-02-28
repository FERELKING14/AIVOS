import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:aivo/models/product_model.dart';
import 'package:aivo/models/category_model.dart';
import 'package:aivo/models/vendor_model.dart';
import 'package:aivo/services/logger_service.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  late final SupabaseClient _supabase;

  factory SupabaseService() {
    return _instance;
  }

  SupabaseService._internal() {
    _supabase = Supabase.instance.client;
  }

  // ===================== PRODUCTS =====================

  Future<List<ProductModel>> getPopularProducts() async {
    try {
      final response = await _supabase
          .from('products')
          .select()
          .contains('tags', '["popular"]')
          .limit(10);

      final products =
          (response as List).map((p) => ProductModel.fromJson(p)).toList();

      // Fallback to demo data if empty
      return products.isNotEmpty ? products : demoPopularProducts;
    } catch (e) {
      LoggerService().e('Error fetching popular products: $e');
      return demoPopularProducts;
    }
  }

  Future<List<ProductModel>> getFlashSaleProducts() async {
    try {
      final response = await _supabase
          .from('products')
          .select()
          .contains('tags', '["flash_sale"]')
          .limit(10);

      final products =
          (response as List).map((p) => ProductModel.fromJson(p)).toList();

      return products.isNotEmpty ? products : demoFlashSaleProducts;
    } catch (e) {
      LoggerService().e('Error fetching flash sale products: $e');
      return demoFlashSaleProducts;
    }
  }

  Future<List<ProductModel>> getBestSellersProducts() async {
    try {
      final response = await _supabase
          .from('products')
          .select()
          .contains('tags', '["bestseller"]')
          .limit(10);

      final products =
          (response as List).map((p) => ProductModel.fromJson(p)).toList();

      return products.isNotEmpty ? products : demoBestSellersProducts;
    } catch (e) {
      LoggerService().e('Error fetching best sellers: $e');
      return demoBestSellersProducts;
    }
  }

  Future<List<ProductModel>> getKidsProducts() async {
    try {
      final response = await _supabase
          .from('products')
          .select()
          .contains('tags', '["kids"]')
          .limit(10);

      final products =
          (response as List).map((p) => ProductModel.fromJson(p)).toList();

      return products.isNotEmpty ? products : kidsProducts;
    } catch (e) {
      LoggerService().e('Error fetching kids products: $e');
      return kidsProducts;
    }
  }

  Future<List<ProductModel>> getProductsByCategory(String categoryId) async {
    try {
      final response = await _supabase
          .from('products')
          .select()
          .eq('category_id', categoryId);

      return (response as List).map((p) => ProductModel.fromJson(p)).toList();
    } catch (e) {
      LoggerService().e('Error fetching products by category: $e');
      return [];
    }
  }

  Future<ProductModel?> getProductById(String id) async {
    try {
      final response =
          await _supabase.from('products').select().eq('id', id).single();

      return ProductModel.fromJson(response);
    } catch (e) {
      LoggerService().e('Error fetching product: $e');
      return null;
    }
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      final response = await _supabase
          .from('products')
          .select()
          .ilike('title', '%$query%')
          .limit(20);

      return (response as List).map((p) => ProductModel.fromJson(p)).toList();
    } catch (e) {
      LoggerService().e('Error searching products: $e');
      return [];
    }
  }

  // ===================== CATEGORIES =====================

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _supabase.from('categories').select();

      return (response as List).map((c) => CategoryModel.fromJson(c)).toList();
    } catch (e) {
      LoggerService().e('Error fetching categories: $e');
      return [];
    }
  }

  Future<CategoryModel?> getCategoryById(String id) async {
    try {
      final response =
          await _supabase.from('categories').select().eq('id', id).single();

      return CategoryModel.fromJson(response);
    } catch (e) {
      LoggerService().e('Error fetching category: $e');
      return null;
    }
  }

  // ===================== VENDORS =====================

  Future<List<VendorModel>> getTopVendors({int limit = 10}) async {
    try {
      final response = await _supabase
          .from('vendors')
          .select()
          .eq('vendor_type', 'professional')
          .order('rating', ascending: false)
          .limit(limit);

      final vendors =
          (response as List).map((v) => VendorModel.fromJson(v)).toList();

      // Fallback to demo data if empty
      return vendors.isNotEmpty ? vendors : demoTopVendors;
    } catch (e) {
      LoggerService().e('Error fetching top vendors: $e');
      return demoTopVendors;
    }
  }

  Future<List<VendorModel>> getFeaturedIndividuals({int limit = 6}) async {
    try {
      final response = await _supabase
          .from('vendors')
          .select()
          .eq('vendor_type', 'individual')
          .eq('is_verified', true)
          .order('rating', ascending: false)
          .limit(limit);

      final vendors =
          (response as List).map((v) => VendorModel.fromJson(v)).toList();

      return vendors.isNotEmpty ? vendors : demoFeaturedIndividuals;
    } catch (e) {
      LoggerService().e('Error fetching featured individuals: $e');
      return demoFeaturedIndividuals;
    }
  }

  Future<List<VendorModel>> searchVendors(String query,
      {int limit = 20}) async {
    try {
      final response = await _supabase
          .from('vendors')
          .select()
          .ilike('name', '%$query%')
          .limit(limit);

      return (response as List).map((v) => VendorModel.fromJson(v)).toList();
    } catch (e) {
      LoggerService().e('Error searching vendors: $e');
      return [];
    }
  }

  Future<VendorModel?> getVendorById(String id) async {
    try {
      final response =
          await _supabase.from('vendors').select().eq('id', id).single();

      return VendorModel.fromJson(response);
    } catch (e) {
      LoggerService().e('Error fetching vendor: $e');
      return null;
    }
  }

  Future<List<VendorModel>> getVendorsByType(String vendorType,
      {int limit = 20}) async {
    try {
      final response = await _supabase
          .from('vendors')
          .select()
          .eq('vendor_type', vendorType)
          .order('rating', ascending: false)
          .limit(limit);

      return (response as List).map((v) => VendorModel.fromJson(v)).toList();
    } catch (e) {
      LoggerService().e('Error fetching vendors by type: $e');
      return [];
    }
  }
}
