import 'address_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final List<OrderItem> items;
  final double subtotal;
  final double shippingCost;
  final double discount;
  final double total;
  final AddressModel shippingAddress;
  final String deliveryMethod;
  final String paymentMethod;
  final String status;
  final String? trackingNumber;
  final String? notes;
  final DateTime createdAt;
  final DateTime? paidAt;
  final DateTime? shippedAt;
  final DateTime? deliveredAt;
  final DateTime? cancelledAt;
  final String? cancellationReason;
  final String? appliedVoucher;

  OrderModel({
    required this.id,
    required this.userId,
    required this.items,
    required this.subtotal,
    required this.shippingCost,
    this.discount = 0,
    required this.total,
    required this.shippingAddress,
    required this.deliveryMethod,
    required this.paymentMethod,
    required this.status,
    this.trackingNumber,
    this.notes,
    required this.createdAt,
    this.paidAt,
    this.shippedAt,
    this.deliveredAt,
    this.cancelledAt,
    this.cancellationReason,
    this.appliedVoucher,
  });

  bool get canBeCancelled => status == 'Pending Payment' || status == 'Processing';
  bool get canBeReviewed => status == 'Delivered';
  bool get isCompleted => status == 'Delivered';

  OrderModel copyWith({
    String? id,
    String? userId,
    List<OrderItem>? items,
    double? subtotal,
    double? shippingCost,
    double? discount,
    double? total,
    AddressModel? shippingAddress,
    String? deliveryMethod,
    String? paymentMethod,
    String? status,
    String? trackingNumber,
    String? notes,
    DateTime? createdAt,
    DateTime? paidAt,
    DateTime? shippedAt,
    DateTime? deliveredAt,
    DateTime? cancelledAt,
    String? cancellationReason,
    String? appliedVoucher,
  }) {
    return OrderModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      shippingCost: shippingCost ?? this.shippingCost,
      discount: discount ?? this.discount,
      total: total ?? this.total,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      deliveryMethod: deliveryMethod ?? this.deliveryMethod,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      paidAt: paidAt ?? this.paidAt,
      shippedAt: shippedAt ?? this.shippedAt,
      deliveredAt: deliveredAt ?? this.deliveredAt,
      cancelledAt: cancelledAt ?? this.cancelledAt,
      cancellationReason: cancellationReason ?? this.cancellationReason,
      appliedVoucher: appliedVoucher ?? this.appliedVoucher,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((i) => i.toJson()).toList(),
      'subtotal': subtotal,
      'shippingCost': shippingCost,
      'discount': discount,
      'total': total,
      'shippingAddress': shippingAddress.toJson(),
      'deliveryMethod': deliveryMethod,
      'paymentMethod': paymentMethod,
      'status': status,
      'trackingNumber': trackingNumber,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'paidAt': paidAt?.toIso8601String(),
      'shippedAt': shippedAt?.toIso8601String(),
      'deliveredAt': deliveredAt?.toIso8601String(),
      'cancelledAt': cancelledAt?.toIso8601String(),
      'cancellationReason': cancellationReason,
      'appliedVoucher': appliedVoucher,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      userId: json['userId'],
      items: (json['items'] as List).map((i) => OrderItem.fromJson(i)).toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      shippingCost: (json['shippingCost'] as num).toDouble(),
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      total: (json['total'] as num).toDouble(),
      shippingAddress: AddressModel.fromJson(json['shippingAddress']),
      deliveryMethod: json['deliveryMethod'],
      paymentMethod: json['paymentMethod'],
      status: json['status'],
      trackingNumber: json['trackingNumber'],
      notes: json['notes'],
      createdAt: DateTime.parse(json['createdAt']),
      paidAt: json['paidAt'] != null ? DateTime.parse(json['paidAt']) : null,
      shippedAt: json['shippedAt'] != null ? DateTime.parse(json['shippedAt']) : null,
      deliveredAt: json['deliveredAt'] != null ? DateTime.parse(json['deliveredAt']) : null,
      cancelledAt: json['cancelledAt'] != null ? DateTime.parse(json['cancelledAt']) : null,
      cancellationReason: json['cancellationReason'],
      appliedVoucher: json['appliedVoucher'],
    );
  }
}

class OrderItem {
  final String productId;
  final String productName;
  final String productImage;
  final int quantity;
  final double price;
  final Map<String, String>? selectedVariants;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.quantity,
    required this.price,
    this.selectedVariants,
  });

  double get totalPrice => price * quantity;

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'quantity': quantity,
      'price': price,
      'selectedVariants': selectedVariants,
    };
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'],
      productName: json['productName'],
      productImage: json['productImage'],
      quantity: json['quantity'],
      price: (json['price'] as num).toDouble(),
      selectedVariants: json['selectedVariants'] != null 
          ? Map<String, String>.from(json['selectedVariants']) 
          : null,
    );
  }
}
