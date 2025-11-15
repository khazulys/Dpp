import 'package:hive/hive.dart';
import 'product_model.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 1)
class CartItemModel {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String productId;
  
  @HiveField(2)
  final int quantity;
  
  @HiveField(3)
  final Map<String, String>? selectedVariants;
  
  @HiveField(4)
  final DateTime addedAt;
  
  @HiveField(5)
  final bool isSelected;

  // Non-Hive field (akan di-fetch dari repository)
  ProductModel? product;

  CartItemModel({
    required this.id,
    required this.productId,
    required this.quantity,
    this.selectedVariants,
    required this.addedAt,
    this.isSelected = true,
    this.product,
  });

  double get totalPrice {
    if (product == null) return 0;
    return product!.price * quantity;
  }

  CartItemModel copyWith({
    String? id,
    String? productId,
    int? quantity,
    Map<String, String>? selectedVariants,
    DateTime? addedAt,
    bool? isSelected,
    ProductModel? product,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      selectedVariants: selectedVariants ?? this.selectedVariants,
      addedAt: addedAt ?? this.addedAt,
      isSelected: isSelected ?? this.isSelected,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'quantity': quantity,
      'selectedVariants': selectedVariants,
      'addedAt': addedAt.toIso8601String(),
      'isSelected': isSelected,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      productId: json['productId'],
      quantity: json['quantity'],
      selectedVariants: json['selectedVariants'] != null 
          ? Map<String, String>.from(json['selectedVariants']) 
          : null,
      addedAt: DateTime.parse(json['addedAt']),
      isSelected: json['isSelected'] ?? true,
    );
  }
}
