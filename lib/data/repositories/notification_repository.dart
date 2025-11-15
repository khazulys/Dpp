import '../models/notification_model.dart';
import '../data_sources/dummy_data_extended.dart';

class NotificationRepository {
  final List<NotificationModel> _notifications = List.from(DummyDataExtended.notifications);
  
  Future<List<NotificationModel>> getUserNotifications(String userId) async {
    await Future.delayed(Duration(milliseconds: 300));
    return _notifications
        .where((n) => n.userId == userId)
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }
  
  Future<List<NotificationModel>> getUnreadNotifications(String userId) async {
    await Future.delayed(Duration(milliseconds: 300));
    return _notifications
        .where((n) => n.userId == userId && !n.isRead)
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }
  
  int getUnreadCount(String userId) {
    return _notifications.where((n) => n.userId == userId && !n.isRead).length;
  }
  
  Future<void> markAsRead(String notificationId) async {
    await Future.delayed(Duration(milliseconds: 200));
    
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      _notifications[index] = _notifications[index].copyWith(isRead: true);
    }
  }
  
  Future<void> markAllAsRead(String userId) async {
    await Future.delayed(Duration(milliseconds: 300));
    
    for (var i = 0; i < _notifications.length; i++) {
      if (_notifications[i].userId == userId && !_notifications[i].isRead) {
        _notifications[i] = _notifications[i].copyWith(isRead: true);
      }
    }
  }
  
  Future<void> deleteNotification(String notificationId) async {
    await Future.delayed(Duration(milliseconds: 200));
    _notifications.removeWhere((n) => n.id == notificationId);
  }
  
  Future<void> clearAllNotifications(String userId) async {
    await Future.delayed(Duration(milliseconds: 300));
    _notifications.removeWhere((n) => n.userId == userId);
  }
}
