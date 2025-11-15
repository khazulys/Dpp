import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/auth/login_page.dart';
import '../../presentation/auth/register_page.dart';
import '../../presentation/auth/forgot_password_page.dart';
import '../../presentation/home/home_page.dart';
import '../../presentation/products/product_list_page.dart';
import '../../presentation/products/product_detail_page.dart';
import '../../presentation/cart/cart_page.dart';
import '../../presentation/wishlist/wishlist_page.dart';
import '../../presentation/checkout/checkout_page.dart';
import '../../presentation/orders/orders_page.dart';
import '../../presentation/orders/order_detail_page.dart';
import '../../presentation/profile/profile_page.dart';
import '../../presentation/profile/edit_profile_page.dart';
import '../../presentation/profile/address_list_page.dart';
import '../../presentation/profile/add_address_page.dart';
import '../../presentation/profile/settings_page.dart';
import '../../presentation/notifications/notifications_page.dart';
import '../../presentation/vouchers/vouchers_page.dart';
import '../../presentation/main_scaffold.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      // Auth Routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      
      // Main App Routes with Bottom Navigation
      ShellRoute(
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/products',
            name: 'products',
            builder: (context, state) {
              final category = state.uri.queryParameters['category'] ?? 'Semua';
              return ProductListPage(category: category);
            },
          ),
          GoRoute(
            path: '/cart',
            name: 'cart',
            builder: (context, state) => const CartPage(),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
      
      // Product Detail
      GoRoute(
        path: '/product/:id',
        name: 'product-detail',
        builder: (context, state) {
          final productId = state.pathParameters['id']!;
          return ProductDetailPage(productId: productId);
        },
      ),
      
      // Wishlist
      GoRoute(
        path: '/wishlist',
        name: 'wishlist',
        builder: (context, state) => const WishlistPage(),
      ),
      
      // Checkout
      GoRoute(
        path: '/checkout',
        name: 'checkout',
        builder: (context, state) => const CheckoutPage(),
      ),
      
      // Orders
      GoRoute(
        path: '/orders',
        name: 'orders',
        builder: (context, state) => const OrdersPage(),
      ),
      GoRoute(
        path: '/orders/:id',
        name: 'order-detail',
        builder: (context, state) {
          final orderId = state.pathParameters['id']!;
          return OrderDetailPage(orderId: orderId);
        },
      ),
      
      // Profile Related
      GoRoute(
        path: '/edit-profile',
        name: 'edit-profile',
        builder: (context, state) => const EditProfilePage(),
      ),
      GoRoute(
        path: '/addresses',
        name: 'addresses',
        builder: (context, state) => const AddressListPage(),
      ),
      GoRoute(
        path: '/add-address',
        name: 'add-address',
        builder: (context, state) {
          final addressId = state.uri.queryParameters['id'];
          return AddAddressPage(addressId: addressId);
        },
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
      
      // Notifications
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationsPage(),
      ),
      
      // Vouchers
      GoRoute(
        path: '/vouchers',
        name: 'vouchers',
        builder: (context, state) => const VouchersPage(),
      ),
    ],
  );
}
