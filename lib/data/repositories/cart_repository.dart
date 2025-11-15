import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import '../models/cart_item_model.dart';
import '../models/product_model.dart';
import '../../core/constants/app_constants.dart';
import 'product_repository.dart';

class CartRepository {
  final _uuid = Uuid();
  final _productRepository = ProductRepository();
  Box<CartItemModel>? _cartBox;
  
  Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CartItemModelAdapter());
    }
    _cartBox = await Hive.openBox<CartItemModel>(AppConstants.cartBox);
  }
  
  Future<List<CartItemModel>> getCartItems() async {
    final items = _cartBox?.values.toList() ?? [];
    
    // Populate product data
    for (var item in items) {
      item.product = _productRepository.getProductById(item.productId);
    }
    
    return items;
  }
  
  Future<void> addToCart({
    required String productId,
    int quantity = 1,
    Map<String, String>? selectedVariants,
  }) async {
    final product = _productRepository.getProductById(productId);
    if (product == null) throw Exception('Product not found');
    
    // Check if item already exists
    final existingItem = _cartBox?.values.firstWhere(
      (item) => item.productId == productId && _variantsMatch(item.selectedVariants, selectedVariants),
      orElse: () => CartItemModel(
        id: '',
        productId: '',
        quantity: 0,
        addedAt: DateTime.now(),
      ),
    );
    
    if (existingItem != null && existingItem.id.isNotEmpty) {
      // Update quantity
      await updateCartItem(existingItem.id, existingItem.quantity + quantity);
    } else {
      // Add new item
      final cartItem = CartItemModel(
        id: _uuid.v4(),
        productId: productId,
        quantity: quantity,
        selectedVariants: selectedVariants,
        addedAt: DateTime.now(),
        isSelected: true,
      );
      
      await _cartBox?.put(cartItem.id, cartItem);
    }
  }
  
  bool _variantsMatch(Map<String, String>? v1, Map<String, String>? v2) {
    if (v1 == null && v2 == null) return true;
    if (v1 == null || v2 == null) return false;
    if (v1.length != v2.length) return false;
    
    for (var key in v1.keys) {
      if (v1[key] != v2[key]) return false;
    }
    return true;
  }
  
  Future<void> updateCartItem(String itemId, int quantity) async {
    final item = _cartBox?.get(itemId);
    if (item == null) return;
    
    if (quantity <= 0) {
      await removeFromCart(itemId);
    } else {
      final updatedItem = item.copyWith(quantity: quantity);
      await _cartBox?.put(itemId, updatedItem);
    }
  }
  
  Future<void> removeFromCart(String itemId) async {
    await _cartBox?.delete(itemId);
  }
  
  Future<void> toggleItemSelection(String itemId) async {
    final item = _cartBox?.get(itemId);
    if (item == null) return;
    
    final updatedItem = item.copyWith(isSelected: !item.isSelected);
    await _cartBox?.put(itemId, updatedItem);
  }
  
  Future<void> selectAll(bool selected) async {
    final items = _cartBox?.values.toList() ?? [];
    for (var item in items) {
      final updatedItem = item.copyWith(isSelected: selected);
      await _cartBox?.put(item.id, updatedItem);
    }
  }
  
  Future<void> clearCart() async {
    await _cartBox?.clear();
  }
  
  Future<void> removeSelectedItems() async {
    final items = _cartBox?.values.where((item) => item.isSelected).toList() ?? [];
    for (var item in items) {
      await _cartBox?.delete(item.id);
    }
  }
  
  int getCartCount() {
    return _cartBox?.values.length ?? 0;
  }
  
  double getCartTotal() {
    final items = _cartBox?.values.where((item) => item.isSelected).toList() ?? [];
    double total = 0;
    
    for (var item in items) {
      final product = _productRepository.getProductById(item.productId);
      if (product != null) {
        total += product.price * item.quantity;
      }
    }
    
    return total;
  }
  
  List<CartItemModel> getSelectedItems() {
    final items = _cartBox?.values.where((item) => item.isSelected).toList() ?? [];
    
    // Populate product data
    for (var item in items) {
      item.product = _productRepository.getProductById(item.productId);
    }
    
    return items;
  }
}
