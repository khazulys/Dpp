import '../models/product_model.dart';
import '../models/review_model.dart';
import '../data_sources/dummy_data.dart';
import '../data_sources/dummy_data_extended.dart';

class ProductRepository {
  List<ProductModel> getAllProducts() {
    return DummyData.products;
  }
  
  List<ProductModel> getProductsByCategory(String category) {
    if (category == 'Semua') return DummyData.products;
    return DummyData.products.where((p) => p.category == category).toList();
  }
  
  List<ProductModel> getFeaturedProducts() {
    return DummyData.products.where((p) => p.isFeatured).toList();
  }
  
  List<ProductModel> getFlashSaleProducts() {
    return DummyData.products.where((p) => p.isFlashSale).toList();
  }
  
  List<ProductModel> getNewArrivals() {
    final products = List<ProductModel>.from(DummyData.products);
    products.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return products.take(10).toList();
  }
  
  List<ProductModel> getBestSellers() {
    final products = List<ProductModel>.from(DummyData.products);
    products.sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
    return products.take(10).toList();
  }
  
  ProductModel? getProductById(String id) {
    try {
      return DummyData.products.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
  
  List<ProductModel> searchProducts(String query) {
    final lowerQuery = query.toLowerCase();
    return DummyData.products.where((p) {
      return p.name.toLowerCase().contains(lowerQuery) ||
          p.description.toLowerCase().contains(lowerQuery) ||
          p.tags.any((tag) => tag.toLowerCase().contains(lowerQuery));
    }).toList();
  }
  
  List<ProductModel> filterProducts({
    String? category,
    double? minPrice,
    double? maxPrice,
    double? minRating,
    bool? inStock,
  }) {
    var products = DummyData.products;
    
    if (category != null && category != 'Semua') {
      products = products.where((p) => p.category == category).toList();
    }
    
    if (minPrice != null) {
      products = products.where((p) => p.price >= minPrice).toList();
    }
    
    if (maxPrice != null) {
      products = products.where((p) => p.price <= maxPrice).toList();
    }
    
    if (minRating != null) {
      products = products.where((p) => p.rating >= minRating).toList();
    }
    
    if (inStock == true) {
      products = products.where((p) => p.isInStock).toList();
    }
    
    return products;
  }
  
  List<ProductModel> sortProducts(List<ProductModel> products, String sortBy) {
    final sorted = List<ProductModel>.from(products);
    
    switch (sortBy) {
      case 'price_low_high':
        sorted.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'price_high_low':
        sorted.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'rating':
        sorted.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'newest':
        sorted.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case 'popular':
        sorted.sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
        break;
      default:
        break;
    }
    
    return sorted;
  }
  
  List<ProductModel> getRelatedProducts(String productId) {
    final product = getProductById(productId);
    if (product == null) return [];
    
    return DummyData.products
        .where((p) => p.id != productId && p.category == product.category)
        .take(6)
        .toList();
  }
  
  List<ReviewModel> getProductReviews(String productId) {
    return DummyDataExtended.reviews
        .where((r) => r.productId == productId)
        .toList();
  }
  
  Map<int, int> getReviewDistribution(String productId) {
    final reviews = getProductReviews(productId);
    final distribution = <int, int>{5: 0, 4: 0, 3: 0, 2: 0, 1: 0};
    
    for (var review in reviews) {
      distribution[review.rating.toInt()] = (distribution[review.rating.toInt()] ?? 0) + 1;
    }
    
    return distribution;
  }
}
