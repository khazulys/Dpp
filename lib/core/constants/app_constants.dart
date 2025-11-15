class AppConstants {
  static const String appName = 'DPP Store';
  static const String appVersion = '1.0.0';
  
  // WhatsApp Admin
  static const String adminWhatsApp = '6281234567890'; // Ganti dengan nomor admin
  static const String adminWhatsAppMessage = 'Halo, saya ingin melakukan pembayaran untuk order #';
  
  // Pagination
  static const int pageSize = 20;
  
  // Image Placeholder
  static const String placeholderImage = 'https://via.placeholder.com/300x300.png?text=DPP+Store';
  
  // Currency
  static const String currency = 'Rp';
  
  // Product Categories
  static const List<String> categories = [
    'Semua',
    'Pecah Belah',
    'Bubble Wrap',
    'Best Seller',
    'New Arrivals',
  ];
  
  // Order Status
  static const String orderPending = 'Pending Payment';
  static const String orderProcessing = 'Processing';
  static const String orderShipped = 'Shipped';
  static const String orderDelivered = 'Delivered';
  static const String orderCancelled = 'Cancelled';
  static const String orderReturned = 'Returned';
  
  // Payment Methods
  static const List<String> paymentMethods = [
    'Transfer Bank',
    'E-Wallet (GoPay, OVO, Dana)',
    'COD (Cash on Delivery)',
  ];
  
  // Delivery Methods
  static const Map<String, Map<String, dynamic>> deliveryMethods = {
    'regular': {
      'name': 'Regular',
      'description': '3-5 hari kerja',
      'price': 10000,
    },
    'express': {
      'name': 'Express',
      'description': '1-2 hari kerja',
      'price': 25000,
    },
    'same_day': {
      'name': 'Same Day',
      'description': 'Hari ini',
      'price': 50000,
    },
  };
  
  // Hive Boxes
  static const String userBox = 'user_box';
  static const String cartBox = 'cart_box';
  static const String wishlistBox = 'wishlist_box';
  static const String settingsBox = 'settings_box';
}
