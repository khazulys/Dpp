import 'package:uuid/uuid.dart';
import '../models/address_model.dart';
import '../data_sources/dummy_data.dart';

class AddressRepository {
  final _uuid = Uuid();
  final List<AddressModel> _addresses = List.from(DummyData.addresses);
  
  Future<List<AddressModel>> getUserAddresses(String userId) async {
    await Future.delayed(Duration(milliseconds: 300));
    return _addresses.where((a) => a.userId == userId).toList()
      ..sort((a, b) => b.isDefault ? 1 : -1);
  }
  
  Future<AddressModel?> getDefaultAddress(String userId) async {
    await Future.delayed(Duration(milliseconds: 200));
    try {
      return _addresses.firstWhere(
        (a) => a.userId == userId && a.isDefault,
      );
    } catch (e) {
      // Return first address if no default
      try {
        return _addresses.firstWhere((a) => a.userId == userId);
      } catch (e) {
        return null;
      }
    }
  }
  
  Future<AddressModel?> getAddressById(String addressId) async {
    await Future.delayed(Duration(milliseconds: 200));
    try {
      return _addresses.firstWhere((a) => a.id == addressId);
    } catch (e) {
      return null;
    }
  }
  
  Future<AddressModel> addAddress({
    required String userId,
    required String label,
    required String recipientName,
    required String phone,
    required String address,
    required String city,
    required String province,
    required String postalCode,
    bool isDefault = false,
  }) async {
    await Future.delayed(Duration(milliseconds: 500));
    
    // If setting as default, remove default from others
    if (isDefault) {
      _addresses.where((a) => a.userId == userId).forEach((a) {
        final index = _addresses.indexOf(a);
        _addresses[index] = a.copyWith(isDefault: false);
      });
    }
    
    final newAddress = AddressModel(
      id: _uuid.v4(),
      userId: userId,
      label: label,
      recipientName: recipientName,
      phone: phone,
      address: address,
      city: city,
      province: province,
      postalCode: postalCode,
      isDefault: isDefault,
      createdAt: DateTime.now(),
    );
    
    _addresses.add(newAddress);
    return newAddress;
  }
  
  Future<AddressModel> updateAddress({
    required String addressId,
    required String label,
    required String recipientName,
    required String phone,
    required String address,
    required String city,
    required String province,
    required String postalCode,
    bool? isDefault,
  }) async {
    await Future.delayed(Duration(milliseconds: 500));
    
    final addressIndex = _addresses.indexWhere((a) => a.id == addressId);
    if (addressIndex == -1) throw Exception('Address not found');
    
    final oldAddress = _addresses[addressIndex];
    
    // If setting as default, remove default from others
    if (isDefault == true) {
      _addresses.where((a) => a.userId == oldAddress.userId).forEach((a) {
        final index = _addresses.indexOf(a);
        _addresses[index] = a.copyWith(isDefault: false);
      });
    }
    
    final updatedAddress = oldAddress.copyWith(
      label: label,
      recipientName: recipientName,
      phone: phone,
      address: address,
      city: city,
      province: province,
      postalCode: postalCode,
      isDefault: isDefault ?? oldAddress.isDefault,
    );
    
    _addresses[addressIndex] = updatedAddress;
    return updatedAddress;
  }
  
  Future<void> deleteAddress(String addressId) async {
    await Future.delayed(Duration(milliseconds: 300));
    _addresses.removeWhere((a) => a.id == addressId);
  }
  
  Future<void> setDefaultAddress(String addressId) async {
    await Future.delayed(Duration(milliseconds: 300));
    
    final address = _addresses.firstWhere((a) => a.id == addressId);
    
    // Remove default from all user's addresses
    _addresses.where((a) => a.userId == address.userId).forEach((a) {
      final index = _addresses.indexOf(a);
      _addresses[index] = a.copyWith(isDefault: false);
    });
    
    // Set new default
    final index = _addresses.indexWhere((a) => a.id == addressId);
    _addresses[index] = address.copyWith(isDefault: true);
  }
}
