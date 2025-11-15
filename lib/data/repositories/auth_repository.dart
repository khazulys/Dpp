import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import '../models/user_model.dart';
import '../data_sources/dummy_data.dart';
import '../../core/constants/app_constants.dart';

class AuthRepository {
  final _uuid = Uuid();
  Box<UserModel>? _userBox;
  
  Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserModelAdapter());
    }
    _userBox = await Hive.openBox<UserModel>(AppConstants.userBox);
  }
  
  Future<Map<String, dynamic>> register({
    required String email,
    required String name,
    required String password,
    String? phone,
  }) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    
    // Check if email already exists
    final existingUser = DummyData.users.any((u) => u.email == email);
    if (existingUser) {
      return {
        'success': false,
        'message': 'Email sudah terdaftar',
      };
    }
    
    // Create new user
    final user = UserModel(
      id: _uuid.v4(),
      email: email,
      name: name,
      phone: phone,
      createdAt: DateTime.now(),
      loyaltyPoints: 100, // Welcome bonus
      isVerified: false,
    );
    
    // Save to local storage
    await _userBox?.put('current_user', user);
    
    return {
      'success': true,
      'message': 'Registrasi berhasil',
      'user': user,
    };
  }
  
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    
    // Find user by email
    final user = DummyData.users.firstWhere(
      (u) => u.email == email,
      orElse: () => UserModel(
        id: '',
        email: '',
        name: '',
        createdAt: DateTime.now(),
      ),
    );
    
    if (user.id.isEmpty) {
      return {
        'success': false,
        'message': 'Email atau password salah',
      };
    }
    
    // Save to local storage
    await _userBox?.put('current_user', user);
    
    return {
      'success': true,
      'message': 'Login berhasil',
      'user': user,
    };
  }
  
  Future<void> logout() async {
    await _userBox?.delete('current_user');
  }
  
  UserModel? getCurrentUser() {
    return _userBox?.get('current_user');
  }
  
  bool isLoggedIn() {
    return getCurrentUser() != null;
  }
  
  Future<Map<String, dynamic>> forgotPassword(String email) async {
    await Future.delayed(Duration(seconds: 1));
    
    final userExists = DummyData.users.any((u) => u.email == email);
    
    if (!userExists) {
      return {
        'success': false,
        'message': 'Email tidak terdaftar',
      };
    }
    
    return {
      'success': true,
      'message': 'Link reset password telah dikirim ke email Anda',
    };
  }
  
  Future<Map<String, dynamic>> updateProfile({
    required String name,
    String? phone,
    String? avatar,
  }) async {
    await Future.delayed(Duration(milliseconds: 500));
    
    final currentUser = getCurrentUser();
    if (currentUser == null) {
      return {
        'success': false,
        'message': 'User tidak ditemukan',
      };
    }
    
    final updatedUser = currentUser.copyWith(
      name: name,
      phone: phone,
      avatar: avatar,
    );
    
    await _userBox?.put('current_user', updatedUser);
    
    return {
      'success': true,
      'message': 'Profil berhasil diperbarui',
      'user': updatedUser,
    };
  }
  
  Future<Map<String, dynamic>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    
    // Dummy validation
    return {
      'success': true,
      'message': 'Password berhasil diubah',
    };
  }
}
