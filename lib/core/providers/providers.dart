import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/product_repository.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/cart_repository.dart';
import '../../data/repositories/order_repository.dart';
import '../../data/repositories/voucher_repository.dart';
import '../../data/repositories/wishlist_repository.dart';
import '../../data/repositories/address_repository.dart';
import '../../data/repositories/notification_repository.dart';
import '../../data/models/user_model.dart';
import '../../data/models/product_model.dart';
import '../../data/models/cart_item_model.dart';
import '../../data/models/order_model.dart';
import '../../data/models/voucher_model.dart';
import '../../data/models/address_model.dart';
import '../../data/models/notification_model.dart';

// Repository Providers
final productRepositoryProvider = Provider((ref) => ProductRepository());
final authRepositoryProvider = Provider((ref) => AuthRepository());
final cartRepositoryProvider = Provider((ref) => CartRepository());
final orderRepositoryProvider = Provider((ref) => OrderRepository());
final voucherRepositoryProvider = Provider((ref) => VoucherRepository());
final wishlistRepositoryProvider = Provider((ref) => WishlistRepository());
final addressRepositoryProvider = Provider((ref) => AddressRepository());
final notificationRepositoryProvider = Provider((ref) => NotificationRepository());

// Auth State Providers
final currentUserProvider = StateProvider<UserModel?>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return authRepo.getCurrentUser();
});

final isLoggedInProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  return user != null;
});

// Product Providers
final allProductsProvider = FutureProvider<List<ProductModel>>((ref) async {
  final repo = ref.watch(productRepositoryProvider);
  return repo.getAllProducts();
});

final featuredProductsProvider = FutureProvider<List<ProductModel>>((ref) async {
  final repo = ref.watch(productRepositoryProvider);
  return repo.getFeaturedProducts();
});

final flashSaleProductsProvider = FutureProvider<List<ProductModel>>((ref) async {
  final repo = ref.watch(productRepositoryProvider);
  return repo.getFlashSaleProducts();
});

final productsByCategoryProvider = FutureProvider.family<List<ProductModel>, String>((ref, category) async {
  final repo = ref.watch(productRepositoryProvider);
  return repo.getProductsByCategory(category);
});

final productDetailProvider = FutureProvider.family<ProductModel?, String>((ref, productId) async {
  final repo = ref.watch(productRepositoryProvider);
  return repo.getProductById(productId);
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider<List<ProductModel>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.isEmpty) return [];
  
  final repo = ref.watch(productRepositoryProvider);
  return repo.searchProducts(query);
});

// Cart Providers
final cartItemsProvider = FutureProvider<List<CartItemModel>>((ref) async {
  final repo = ref.watch(cartRepositoryProvider);
  return repo.getCartItems();
});

final cartCountProvider = FutureProvider<int>((ref) async {
  final repo = ref.watch(cartRepositoryProvider);
  return repo.getCartCount();
});

final cartTotalProvider = FutureProvider<double>((ref) async {
  final repo = ref.watch(cartRepositoryProvider);
  return repo.getCartTotal();
});

// Wishlist Providers
final wishlistProvider = FutureProvider<List<ProductModel>>((ref) async {
  final repo = ref.watch(wishlistRepositoryProvider);
  return repo.getWishlist();
});

final wishlistCountProvider = FutureProvider<int>((ref) async {
  final repo = ref.watch(wishlistRepositoryProvider);
  return repo.getWishlistCount();
});

final isInWishlistProvider = Provider.family<bool, String>((ref, productId) {
  final repo = ref.watch(wishlistRepositoryProvider);
  return repo.isInWishlist(productId);
});

// Order Providers
final userOrdersProvider = FutureProvider<List<OrderModel>>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return [];
  
  final repo = ref.watch(orderRepositoryProvider);
  return repo.getUserOrders(user.id);
});

final orderDetailProvider = FutureProvider.family<OrderModel?, String>((ref, orderId) async {
  final repo = ref.watch(orderRepositoryProvider);
  return repo.getOrderById(orderId);
});

// Voucher Providers
final availableVouchersProvider = FutureProvider<List<VoucherModel>>((ref) async {
  final repo = ref.watch(voucherRepositoryProvider);
  return repo.getAvailableVouchers();
});

final appliedVoucherProvider = StateProvider<VoucherModel?>((ref) => null);

// Address Providers
final userAddressesProvider = FutureProvider<List<AddressModel>>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return [];
  
  final repo = ref.watch(addressRepositoryProvider);
  return repo.getUserAddresses(user.id);
});

final defaultAddressProvider = FutureProvider<AddressModel?>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return null;
  
  final repo = ref.watch(addressRepositoryProvider);
  return repo.getDefaultAddress(user.id);
});

final selectedAddressProvider = StateProvider<AddressModel?>((ref) => null);

// Notification Providers
final notificationsProvider = FutureProvider<List<NotificationModel>>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return [];
  
  final repo = ref.watch(notificationRepositoryProvider);
  return repo.getUserNotifications(user.id);
});

final unreadNotificationCountProvider = FutureProvider<int>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return 0;
  
  final repo = ref.watch(notificationRepositoryProvider);
  return repo.getUnreadCount(user.id);
});

// UI State Providers
final selectedCategoryProvider = StateProvider<String>((ref) => 'Semua');
final sortByProvider = StateProvider<String>((ref) => 'default');
final selectedDeliveryMethodProvider = StateProvider<String>((ref) => 'regular');
final bottomNavIndexProvider = StateProvider<int>((ref) => 0);
final isDarkModeProvider = StateProvider<bool>((ref) => false);
