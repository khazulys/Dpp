import 'package:uuid/uuid.dart';
import '../models/order_model.dart';
import '../models/address_model.dart';
import '../models/cart_item_model.dart';
import '../../core/constants/app_constants.dart';

class OrderRepository {
  final _uuid = Uuid();
  final List<OrderModel> _orders = [];
  
  Future<OrderModel> createOrder({
    required String userId,
    required List<CartItemModel> items,
    required double subtotal,
    required double shippingCost,
    required AddressModel shippingAddress,
    required String deliveryMethod,
    required String paymentMethod,
    double discount = 0,
    String? notes,
    String? appliedVoucher,
  }) async {
    await Future.delayed(Duration(milliseconds: 500));
    
    final orderItems = items.map((item) => OrderItem(
      productId: item.productId,
      productName: item.product?.name ?? '',
      productImage: item.product?.images.first ?? '',
      quantity: item.quantity,
      price: item.product?.price ?? 0,
      selectedVariants: item.selectedVariants,
    )).toList();
    
    final order = OrderModel(
      id: 'ORD${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      items: orderItems,
      subtotal: subtotal,
      shippingCost: shippingCost,
      discount: discount,
      total: subtotal + shippingCost - discount,
      shippingAddress: shippingAddress,
      deliveryMethod: deliveryMethod,
      paymentMethod: paymentMethod,
      status: AppConstants.orderPending,
      notes: notes,
      createdAt: DateTime.now(),
      appliedVoucher: appliedVoucher,
    );
    
    _orders.add(order);
    return order;
  }
  
  Future<List<OrderModel>> getUserOrders(String userId) async {
    await Future.delayed(Duration(milliseconds: 300));
    return _orders.where((o) => o.userId == userId).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }
  
  Future<OrderModel?> getOrderById(String orderId) async {
    await Future.delayed(Duration(milliseconds: 200));
    try {
      return _orders.firstWhere((o) => o.id == orderId);
    } catch (e) {
      return null;
    }
  }
  
  Future<List<OrderModel>> getOrdersByStatus(String userId, String status) async {
    await Future.delayed(Duration(milliseconds: 300));
    return _orders
        .where((o) => o.userId == userId && o.status == status)
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }
  
  Future<OrderModel> cancelOrder(String orderId, String reason) async {
    await Future.delayed(Duration(milliseconds: 500));
    
    final order = _orders.firstWhere((o) => o.id == orderId);
    final updatedOrder = order.copyWith(
      status: AppConstants.orderCancelled,
      cancelledAt: DateTime.now(),
      cancellationReason: reason,
    );
    
    final index = _orders.indexWhere((o) => o.id == orderId);
    _orders[index] = updatedOrder;
    
    return updatedOrder;
  }
  
  Future<OrderModel> updateOrderStatus(String orderId, String status) async {
    await Future.delayed(Duration(milliseconds: 500));
    
    final order = _orders.firstWhere((o) => o.id == orderId);
    OrderModel updatedOrder;
    
    switch (status) {
      case 'Processing':
        updatedOrder = order.copyWith(
          status: AppConstants.orderProcessing,
          paidAt: DateTime.now(),
        );
        break;
      case 'Shipped':
        updatedOrder = order.copyWith(
          status: AppConstants.orderShipped,
          shippedAt: DateTime.now(),
          trackingNumber: 'TRK${DateTime.now().millisecondsSinceEpoch}',
        );
        break;
      case 'Delivered':
        updatedOrder = order.copyWith(
          status: AppConstants.orderDelivered,
          deliveredAt: DateTime.now(),
        );
        break;
      default:
        updatedOrder = order.copyWith(status: status);
    }
    
    final index = _orders.indexWhere((o) => o.id == orderId);
    _orders[index] = updatedOrder;
    
    return updatedOrder;
  }
  
  Future<void> reOrder(String orderId) async {
    // This will add items back to cart
    await Future.delayed(Duration(milliseconds: 500));
  }
  
  int getTotalOrders(String userId) {
    return _orders.where((o) => o.userId == userId).length;
  }
  
  double getTotalSpent(String userId) {
    return _orders
        .where((o) => o.userId == userId && o.status != AppConstants.orderCancelled)
        .fold(0, (sum, order) => sum + order.total);
  }
}
