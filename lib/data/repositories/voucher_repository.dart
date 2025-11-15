import '../models/voucher_model.dart';
import '../data_sources/dummy_data_extended.dart';

class VoucherRepository {
  Future<List<VoucherModel>> getAllVouchers() async {
    await Future.delayed(Duration(milliseconds: 300));
    return DummyDataExtended.vouchers;
  }
  
  Future<List<VoucherModel>> getAvailableVouchers() async {
    await Future.delayed(Duration(milliseconds: 300));
    return DummyDataExtended.vouchers.where((v) => v.isValid).toList();
  }
  
  Future<List<VoucherModel>> getExpiredVouchers() async {
    await Future.delayed(Duration(milliseconds: 300));
    return DummyDataExtended.vouchers.where((v) => v.isExpired).toList();
  }
  
  Future<VoucherModel?> getVoucherByCode(String code) async {
    await Future.delayed(Duration(milliseconds: 200));
    try {
      return DummyDataExtended.vouchers.firstWhere(
        (v) => v.code.toUpperCase() == code.toUpperCase(),
      );
    } catch (e) {
      return null;
    }
  }
  
  Future<Map<String, dynamic>> validateVoucher(String code, double subtotal) async {
    await Future.delayed(Duration(milliseconds: 300));
    
    final voucher = await getVoucherByCode(code);
    
    if (voucher == null) {
      return {
        'success': false,
        'message': 'Kode voucher tidak valid',
      };
    }
    
    if (!voucher.isValid) {
      if (voucher.isExpired) {
        return {
          'success': false,
          'message': 'Voucher sudah kadaluarsa',
        };
      }
      if (voucher.usageLimit != null && voucher.usedCount >= voucher.usageLimit!) {
        return {
          'success': false,
          'message': 'Voucher sudah habis digunakan',
        };
      }
      return {
        'success': false,
        'message': 'Voucher tidak aktif',
      };
    }
    
    if (voucher.minPurchase != null && subtotal < voucher.minPurchase!) {
      return {
        'success': false,
        'message': 'Minimal belanja Rp ${voucher.minPurchase!.toStringAsFixed(0)} untuk voucher ini',
      };
    }
    
    final discount = voucher.calculateDiscount(subtotal);
    
    return {
      'success': true,
      'message': 'Voucher berhasil diterapkan',
      'voucher': voucher,
      'discount': discount,
    };
  }
  
  Future<void> claimVoucher(String voucherId) async {
    await Future.delayed(Duration(milliseconds: 500));
    // In real app, this would save to user's claimed vouchers
  }
}
