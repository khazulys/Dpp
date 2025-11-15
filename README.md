# DPP Store - Aplikasi Toko Online

Aplikasi Android toko online untuk menjual produk pecah belah dan bubble wrap.

## 🎨 Features

### Authentication
- ✅ Register dengan validasi email & password
- ✅ Login (Email & Password)
- ✅ Forgot Password
- ✅ Session Management dengan Hive

### Home & Discovery
- ✅ Hero Banner dengan carousel promo
- ✅ Category Tabs (Pecah Belah, Bubble Wrap, Best Seller, New Arrivals)
- ✅ Featured Products
- ✅ Flash Sale dengan countdown timer
- ✅ Search Bar dengan autocomplete

### Products
- ✅ 50+ Produk Dummy (Pecah Belah & Bubble Wrap)
- ✅ Product List dengan filter & sort
- ✅ Product Detail lengkap (gallery, variants, reviews)
- ✅ Related Products
- ✅ Product Reviews & Ratings
- ✅ Add to Cart & Wishlist

### Shopping
- ✅ Shopping Cart (add/remove, quantity, voucher)
- ✅ Wishlist functionality
- ✅ Voucher system (10+ vouchers)
- ✅ Real-time price calculation

### Checkout & Orders
- ✅ Checkout flow lengkap
- ✅ Address Management (add, edit, delete, set default)
- ✅ Delivery Method selection
- ✅ **WhatsApp Integration untuk Payment** (redirect ke admin WhatsApp)
- ✅ Order History dengan status tracking
- ✅ Order Detail dengan tracking number
- ✅ Cancel Order & Return/Refund Request
- ✅ Re-order functionality

### Profile & Settings
- ✅ User Profile Management
- ✅ Multiple Address Management
- ✅ Loyalty Points System
- ✅ Theme Toggle (Light/Dark)
- ✅ Notification Preferences

### Notifications
- ✅ In-app Notifications
- ✅ Order Updates
- ✅ Promo Alerts
- ✅ Stock Alerts

## 🛠️ Tech Stack

- **Framework**: Flutter 3.35.0+
- **UI Library**: ForUI (Minimalistic UI Library)
- **State Management**: Riverpod 2.x
- **Navigation**: Go Router
- **Local Storage**: Hive + SharedPreferences
- **Theme**: Custom Red & White (DPP Brand Colors)

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # UI
  forui: ^0.16.0
  
  # State Management
  flutter_riverpod: ^2.5.1
  
  # Navigation
  go_router: ^14.2.7
  
  # Storage
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  shared_preferences: ^2.2.3
  
  # Network & Images
  cached_network_image: ^3.3.1
  url_launcher: ^6.3.0
  
  # Forms
  flutter_form_builder: ^9.3.0
  form_builder_validators: ^10.0.1
  
  # Utils
  intl: ^0.19.0
  uuid: ^4.4.0
```

## 🚀 Setup & Installation

### Prerequisites
- Flutter SDK 3.35.0 or higher
- Dart SDK 3.9.2 or higher
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**
```bash
git clone <repository-url>
cd dpp
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Generate code (untuk Hive & Riverpod)**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Configure WhatsApp Admin Number**
Edit file `lib/core/constants/app_constants.dart`:
```dart
static const String adminWhatsApp = '6281234567890'; // Ganti dengan nomor admin Anda
```

5. **Run the app**
```bash
flutter run
```

## 🏗️ Build untuk Production

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle (untuk Google Play)
```bash
flutter build appbundle --release
```

### iOS (memerlukan Mac)
```bash
flutter build ios --release
```

## 🤖 GitHub Actions CI/CD

Aplikasi ini dilengkapi dengan GitHub Actions untuk otomatis build APK & IPA.

**Workflow**: `.github/workflows/build.yml`

### Triggers:
- Push ke branch `main` atau `develop`
- Pull Request ke `main` atau `develop`
- Manual trigger (workflow_dispatch)

### Output:
- **Android APK**: `build/app/outputs/flutter-apk/app-release.apk`
- **iOS IPA**: `build/ios/iphoneos/dpp-store.ipa`

### Cara Manual Trigger:
1. Buka tab **Actions** di GitHub
2. Pilih workflow **Build DPP Store**
3. Klik **Run workflow**
4. Download artifact setelah build selesai

## 📱 Payment Flow (WhatsApp Integration)

Saat user melakukan checkout:
1. User memilih produk dan masuk ke checkout
2. User memilih alamat pengiriman dan delivery method
3. User memilih "Bayar via WhatsApp"
4. Aplikasi akan membuka WhatsApp dengan message pre-filled:
   ```
   Halo, saya ingin melakukan pembayaran untuk order #ORD12345
   
   Detail Order:
   - Product 1 x2
   - Product 2 x1
   Total: Rp 250.000
   ```
5. User mengirim message ke admin
6. Admin memproses pembayaran manual
7. Admin update status order di sistem

## 📂 Project Structure

```
lib/
├── core/
│   ├── constants/        # App constants
│   ├── theme/           # ForUI custom theme
│   ├── utils/           # Utilities (formatters, validators)
│   ├── router/          # Go Router configuration
│   └── providers/       # Riverpod providers
├── data/
│   ├── models/          # Data models (User, Product, Order, dll)
│   ├── repositories/    # Repository layer
│   └── data_sources/    # Dummy data
├── presentation/
│   ├── auth/            # Login, Register pages
│   ├── home/            # Home page
│   ├── products/        # Product list & detail
│   ├── cart/            # Shopping cart
│   ├── wishlist/        # Wishlist
│   ├── checkout/        # Checkout flow
│   ├── orders/          # Order history & detail
│   ├── profile/         # User profile & settings
│   ├── notifications/   # Notifications
│   ├── vouchers/        # Vouchers page
│   └── widgets/         # Reusable widgets
└── main.dart
```

## 🎨 Color Scheme

- **Primary Red**: `#DC143C` (Crimson)
- **Dark Red**: `#8B0000`
- **White**: `#FFFFFF`
- **Light Gray**: `#F5F5F5`
- **Success**: `#10B981`
- **Warning**: `#F59E0B`
- **Error**: `#EF4444`

## 📝 Dummy Data

### Users (3 users)
- john@example.com
- jane@example.com
- bob@example.com
*Password: any (dummy auth)*

### Products (50+ products)
- 25 Produk Pecah Belah (piring, gelas, mangkuk, dll)
- 25 Produk Bubble Wrap (berbagai ukuran dan jenis)

### Vouchers (10 vouchers)
- WELCOME50: Diskon Rp 50.000
- DISKON20: Diskon 20%
- FREESHIP: Gratis ongkir
- FLASH50: Flash sale 50%
- dll.

## 🔧 Development Notes

### Generate Hive Adapters
Jika ada perubahan pada model dengan `@HiveType`:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Code Generation untuk Riverpod
```bash
flutter pub run build_runner watch
```

### Analyze Code
```bash
flutter analyze
```

### Run Tests
```bash
flutter test
```

## 📱 Minimum Requirements

- **Android**: Android 5.0 (API level 21) or higher
- **iOS**: iOS 12.0 or higher

## 📄 License

Private - DPP Store

## 👨‍💻 Developer

Developed for DPP Store

---

**Note**: Ini adalah aplikasi dengan dummy data untuk development dan testing. Untuk production, replace dummy data dengan real API integration.
