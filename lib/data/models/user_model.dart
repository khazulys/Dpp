import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String email;
  
  @HiveField(2)
  final String name;
  
  @HiveField(3)
  final String? phone;
  
  @HiveField(4)
  final String? avatar;
  
  @HiveField(5)
  final DateTime createdAt;
  
  @HiveField(6)
  final int loyaltyPoints;
  
  @HiveField(7)
  final bool isVerified;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    this.avatar,
    required this.createdAt,
    this.loyaltyPoints = 0,
    this.isVerified = false,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
    String? avatar,
    DateTime? createdAt,
    int? loyaltyPoints,
    bool? isVerified,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      createdAt: createdAt ?? this.createdAt,
      loyaltyPoints: loyaltyPoints ?? this.loyaltyPoints,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'avatar': avatar,
      'createdAt': createdAt.toIso8601String(),
      'loyaltyPoints': loyaltyPoints,
      'isVerified': isVerified,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      avatar: json['avatar'],
      createdAt: DateTime.parse(json['createdAt']),
      loyaltyPoints: json['loyaltyPoints'] ?? 0,
      isVerified: json['isVerified'] ?? false,
    );
  }
}
