class ProductModel {
  final String id;
  final String name;
  final String description;
  final String category;
  final double price;
  final double? originalPrice;
  final int stock;
  final List<String> images;
  final double rating;
  final int reviewCount;
  final List<ProductVariant> variants;
  final List<String> tags;
  final DateTime createdAt;
  final bool isFeatured;
  final bool isFlashSale;
  final DateTime? flashSaleEndTime;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    this.originalPrice,
    required this.stock,
    required this.images,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.variants = const [],
    this.tags = const [],
    required this.createdAt,
    this.isFeatured = false,
    this.isFlashSale = false,
    this.flashSaleEndTime,
  });

  bool get hasDiscount => originalPrice != null && originalPrice! > price;
  
  int get discountPercentage {
    if (!hasDiscount) return 0;
    return (((originalPrice! - price) / originalPrice!) * 100).round();
  }
  
  bool get isInStock => stock > 0;
  
  bool get isLowStock => stock > 0 && stock <= 10;

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    double? price,
    double? originalPrice,
    int? stock,
    List<String>? images,
    double? rating,
    int? reviewCount,
    List<ProductVariant>? variants,
    List<String>? tags,
    DateTime? createdAt,
    bool? isFeatured,
    bool? isFlashSale,
    DateTime? flashSaleEndTime,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      stock: stock ?? this.stock,
      images: images ?? this.images,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      variants: variants ?? this.variants,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      isFeatured: isFeatured ?? this.isFeatured,
      isFlashSale: isFlashSale ?? this.isFlashSale,
      flashSaleEndTime: flashSaleEndTime ?? this.flashSaleEndTime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'originalPrice': originalPrice,
      'stock': stock,
      'images': images,
      'rating': rating,
      'reviewCount': reviewCount,
      'variants': variants.map((v) => v.toJson()).toList(),
      'tags': tags,
      'createdAt': createdAt.toIso8601String(),
      'isFeatured': isFeatured,
      'isFlashSale': isFlashSale,
      'flashSaleEndTime': flashSaleEndTime?.toIso8601String(),
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      originalPrice: json['originalPrice'] != null ? (json['originalPrice'] as num).toDouble() : null,
      stock: json['stock'],
      images: List<String>.from(json['images']),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] ?? 0,
      variants: (json['variants'] as List?)?.map((v) => ProductVariant.fromJson(v)).toList() ?? [],
      tags: List<String>.from(json['tags'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      isFeatured: json['isFeatured'] ?? false,
      isFlashSale: json['isFlashSale'] ?? false,
      flashSaleEndTime: json['flashSaleEndTime'] != null ? DateTime.parse(json['flashSaleEndTime']) : null,
    );
  }
}

class ProductVariant {
  final String name;
  final List<String> options;

  ProductVariant({
    required this.name,
    required this.options,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'options': options,
    };
  }

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      name: json['name'],
      options: List<String>.from(json['options']),
    );
  }
}
