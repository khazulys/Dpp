import 'package:hive_flutter/hive_flutter.dart';
import '../models/product_model.dart';
import '../../core/constants/app_constants.dart';
import 'product_repository.dart';

class WishlistRepository {
  final _productRepository = ProductRepository();
  Box<String>? _wishlistBox;
  
  Future<void> init() async {
    await Hive.initFlutter();
    _wishlistBox = await Hive.openBox<String>(AppConstants.wishlistBox);
  }
  
  Future<List<ProductModel>> getWishlist() async {
    final productIds = _wishlistBox?.values.toList() ?? [];
    final products = <ProductModel>[];
    
    for (var id in productIds) {
      final product = _productRepository.getProductById(id);
      if (product != null) {
        products.add(product);
      }
    }
    
    return products;
  }
  
  Future<void> addToWishlist(String productId) async {
    if (!isInWishlist(productId)) {
      await _wishlistBox?.add(productId);
    }
  }
  
  Future<void> removeFromWishlist(String productId) async {
    final index = _wishlistBox?.values.toList().indexOf(productId);
    if (index != null && index >= 0) {
      await _wishlistBox?.deleteAt(index);
    }
  }
  
  Future<void> toggleWishlist(String productId) async {
    if (isInWishlist(productId)) {
      await removeFromWishlist(productId);
    } else {
      await addToWishlist(productId);
    }
  }
  
  bool isInWishlist(String productId) {
    return _wishlistBox?.values.contains(productId) ?? false;
  }
  
  int getWishlistCount() {
    return _wishlistBox?.values.length ?? 0;
  }
  
  Future<void> clearWishlist() async {
    await _wishlistBox?.clear();
  }
}
