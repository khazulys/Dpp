# Changelog

All notable changes to DPP Store will be documented in this file.

## [1.0.0] - 2025-11-14

### Added
- ✨ Initial release of DPP Store
- 🔐 Authentication system (Register, Login, Forgot Password)
- 🏠 Home page with featured products and flash sales
- 📦 50+ dummy products (Pecah Belah & Bubble Wrap)
- 🛒 Shopping cart with real-time calculation
- ❤️ Wishlist functionality
- 💳 Checkout flow with WhatsApp payment integration
- 📍 Address management (add, edit, delete, set default)
- 📋 Order history and tracking
- 🎟️ Voucher system with 10+ vouchers
- 🔔 Notifications center
- 👤 User profile management
- ⚙️ Settings (theme toggle, preferences)
- 🎨 Custom ForUI theme (Red & White)
- 📱 Responsive UI for various screen sizes
- 🚀 GitHub Actions CI/CD for automatic builds

### Features in Detail

#### Authentication
- Email & password validation
- Session management with Hive
- Auto login on app start
- Secure logout

#### Products
- Category filtering (Pecah Belah, Bubble Wrap)
- Product search with autocomplete
- Sort by price, rating, newest
- Product detail with image gallery
- Product variants support
- Reviews & ratings system

#### Shopping
- Add to cart with quantity selection
- Multiple item management
- Voucher code application
- Auto price calculation with discounts
- Save for later functionality

#### Orders
- Complete order history
- Order status tracking (Pending, Processing, Shipped, Delivered)
- Cancel order with reason
- Return/refund request
- Re-order quick action
- Download invoice (simulated)

#### Profile
- Edit profile information
- Upload avatar (placeholder)
- Loyalty points display
- Order statistics

### Technical
- Flutter 3.35.0+
- ForUI 0.16.0 for UI components
- Riverpod 2.x for state management
- Go Router for navigation
- Hive for local storage
- Dummy data architecture

### Known Limitations
- Using dummy data (no real backend)
- WhatsApp payment is manual (requires admin confirmation)
- Images are placeholder URLs
- No real payment gateway integration

## [Future Releases]

### [1.1.0] - Planned
- 🔌 Backend API integration
- 💳 Real payment gateway (Midtrans, Xendit)
- 📸 Real product images upload
- 🔍 Advanced search with filters
- 📊 Admin dashboard
- 📧 Email notifications
- 🌍 Multi-language support
- 🔄 Automatic order status updates
- 📱 Push notifications (FCM)

### [1.2.0] - Planned
- 🎯 Product recommendations
- 💬 Live chat support
- 📍 Google Maps integration for delivery
- 🏪 Multiple seller support
- 🎁 Gift card system
- 📈 Analytics dashboard
- ⭐ Advanced review system with photos
- 🔐 Social login (Google, Facebook)

---

For detailed commit history, see [GitHub Commits](https://github.com/yourusername/dpp-store/commits)
