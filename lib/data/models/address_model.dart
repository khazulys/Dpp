class AddressModel {
  final String id;
  final String userId;
  final String label;
  final String recipientName;
  final String phone;
  final String address;
  final String city;
  final String province;
  final String postalCode;
  final bool isDefault;
  final DateTime createdAt;

  AddressModel({
    required this.id,
    required this.userId,
    required this.label,
    required this.recipientName,
    required this.phone,
    required this.address,
    required this.city,
    required this.province,
    required this.postalCode,
    this.isDefault = false,
    required this.createdAt,
  });

  AddressModel copyWith({
    String? id,
    String? userId,
    String? label,
    String? recipientName,
    String? phone,
    String? address,
    String? city,
    String? province,
    String? postalCode,
    bool? isDefault,
    DateTime? createdAt,
  }) {
    return AddressModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      label: label ?? this.label,
      recipientName: recipientName ?? this.recipientName,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      city: city ?? this.city,
      province: province ?? this.province,
      postalCode: postalCode ?? this.postalCode,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'label': label,
      'recipientName': recipientName,
      'phone': phone,
      'address': address,
      'city': city,
      'province': province,
      'postalCode': postalCode,
      'isDefault': isDefault,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      userId: json['userId'],
      label: json['label'],
      recipientName: json['recipientName'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      province: json['province'],
      postalCode: json['postalCode'],
      isDefault: json['isDefault'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
  
  String get fullAddress => '$address, $city, $province $postalCode';
}
