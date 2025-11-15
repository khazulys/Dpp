class VoucherModel {
  final String id;
  final String code;
  final String title;
  final String description;
  final VoucherType type;
  final double value;
  final double? minPurchase;
  final double? maxDiscount;
  final DateTime startDate;
  final DateTime endDate;
  final int? usageLimit;
  final int usedCount;
  final bool isActive;

  VoucherModel({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.type,
    required this.value,
    this.minPurchase,
    this.maxDiscount,
    required this.startDate,
    required this.endDate,
    this.usageLimit,
    this.usedCount = 0,
    this.isActive = true,
  });

  bool get isValid {
    final now = DateTime.now();
    if (!isActive) return false;
    if (now.isBefore(startDate) || now.isAfter(endDate)) return false;
    if (usageLimit != null && usedCount >= usageLimit!) return false;
    return true;
  }

  bool get isExpired => DateTime.now().isAfter(endDate);

  double calculateDiscount(double subtotal) {
    if (!isValid || subtotal < (minPurchase ?? 0)) return 0;

    double discount = 0;
    if (type == VoucherType.percentage) {
      discount = subtotal * (value / 100);
      if (maxDiscount != null && discount > maxDiscount!) {
        discount = maxDiscount!;
      }
    } else {
      discount = value;
    }

    return discount;
  }

  VoucherModel copyWith({
    String? id,
    String? code,
    String? title,
    String? description,
    VoucherType? type,
    double? value,
    double? minPurchase,
    double? maxDiscount,
    DateTime? startDate,
    DateTime? endDate,
    int? usageLimit,
    int? usedCount,
    bool? isActive,
  }) {
    return VoucherModel(
      id: id ?? this.id,
      code: code ?? this.code,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      value: value ?? this.value,
      minPurchase: minPurchase ?? this.minPurchase,
      maxDiscount: maxDiscount ?? this.maxDiscount,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      usageLimit: usageLimit ?? this.usageLimit,
      usedCount: usedCount ?? this.usedCount,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'title': title,
      'description': description,
      'type': type.name,
      'value': value,
      'minPurchase': minPurchase,
      'maxDiscount': maxDiscount,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'usageLimit': usageLimit,
      'usedCount': usedCount,
      'isActive': isActive,
    };
  }

  factory VoucherModel.fromJson(Map<String, dynamic> json) {
    return VoucherModel(
      id: json['id'],
      code: json['code'],
      title: json['title'],
      description: json['description'],
      type: VoucherType.values.firstWhere((e) => e.name == json['type']),
      value: (json['value'] as num).toDouble(),
      minPurchase: json['minPurchase'] != null ? (json['minPurchase'] as num).toDouble() : null,
      maxDiscount: json['maxDiscount'] != null ? (json['maxDiscount'] as num).toDouble() : null,
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      usageLimit: json['usageLimit'],
      usedCount: json['usedCount'] ?? 0,
      isActive: json['isActive'] ?? true,
    );
  }
}

enum VoucherType {
  percentage,
  fixed,
}
