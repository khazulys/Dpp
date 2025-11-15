# Setup Guide - DPP Store

## Langkah-langkah Setup Lengkap

### 1. Prerequisites

Pastikan Anda sudah install:
- Flutter SDK 3.35.0+ ([Download](https://flutter.dev))
- Android Studio atau VS Code
- Git

Cek versi Flutter:
```bash
flutter --version
```

### 2. Clone & Setup Project

```bash
# Clone repository
git clone <repository-url>
cd dpp

# Install dependencies
flutter pub get

# Check apakah ada issues
flutter doctor
```

### 3. Konfigurasi WhatsApp Admin

Edit file `lib/core/constants/app_constants.dart`:

```dart
class AppConstants {
  // Ganti dengan nomor WhatsApp admin Anda (format: 62xxx)
  static const String adminWhatsApp = '6281234567890';
  
  // Custom message bisa disesuaikan
  static const String adminWhatsAppMessage = 'Halo, saya ingin melakukan pembayaran untuk order #';
}
```

### 4. Generate Code (Opsional - jika ada error)

Jika ada error terkait Hive atau Riverpod code generation:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 5. Run Aplikasi

#### Development Mode
```bash
# Run di emulator/device yang tersambung
flutter run

# Run dengan hot reload
flutter run --hot
```

#### Release Mode (untuk testing performa)
```bash
flutter run --release
```

### 6. Build APK

```bash
# Build APK Debug (untuk testing)
flutter build apk --debug

# Build APK Release (untuk production)
flutter build apk --release

# APK akan ada di:
# build/app/outputs/flutter-apk/app-release.apk
```

### 7. Build App Bundle (Google Play Store)

```bash
flutter build appbundle --release

# File .aab akan ada di:
# build/app/outputs/bundle/release/app-release.aab
```

## 🔧 Troubleshooting

### Error: "Hive box already open"

**Solusi:**
1. Uninstall aplikasi dari device
2. Hapus folder build: `flutter clean`
3. Install ulang: `flutter run`

### Error: "ForUI widgets not found"

**Solusi:**
```bash
flutter pub get
flutter pub upgrade forui --major-versions
```

### Error: "Go Router navigation issue"

**Solusi:**
1. Pastikan semua page sudah di-import di `app_router.dart`
2. Restart aplikasi (hot restart: `R` di terminal)

### Error: "Build runner conflicts"

**Solusi:**
```bash
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Android Build Error

**Solusi:**
1. Update Android SDK di Android Studio
2. Update gradle:
   ```bash
   cd android
   ./gradlew clean
   cd ..
   flutter clean
   flutter pub get
   ```

## 📱 Testing

### Test di Emulator Android

1. Buka Android Studio
2. AVD Manager → Create Virtual Device
3. Pilih device (misal: Pixel 4)
4. Download system image (Android 11+)
5. Start emulator
6. Run: `flutter run`

### Test di Real Device Android

1. Enable Developer Options di HP
2. Enable USB Debugging
3. Sambungkan HP ke komputer
4. Cek device: `flutter devices`
5. Run: `flutter run`

### Test di iOS (memerlukan Mac)

1. Buka Xcode
2. Open project: `ios/Runner.xcworkspace`
3. Select device/simulator
4. Run dari Xcode atau terminal: `flutter run`

## 🚀 Deploy ke GitHub & Auto Build

### 1. Push ke GitHub

```bash
git add .
git commit -m "Initial commit - DPP Store"
git branch -M main
git remote add origin <your-repo-url>
git push -u origin main
```

### 2. GitHub Actions akan otomatis:
- Build APK Android
- Build IPA iOS (no codesign)
- Upload artifacts

### 3. Download Build Artifacts

1. Buka repository di GitHub
2. Tab **Actions**
3. Pilih workflow run terakhir
4. Download artifacts di bagian bawah

## 📦 Struktur Build Output

```
build/
├── app/
│   └── outputs/
│       ├── flutter-apk/
│       │   └── app-release.apk       # APK untuk install langsung
│       └── bundle/
│           └── release/
│               └── app-release.aab   # App Bundle untuk Play Store
```

## 🔐 App Signing (untuk Production)

### Generate Keystore

```bash
keytool -genkey -v -keystore ~/dpp-store-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias dppstore
```

### Configure di Android

1. Create file `android/key.properties`:
```properties
storePassword=<password>
keyPassword=<password>
keyAlias=dppstore
storeFile=<path-to-keystore>/dpp-store-key.jks
```

2. Update `android/app/build.gradle` (sudah ada template di file)

3. Build signed APK:
```bash
flutter build apk --release
```

## 📝 Customization

### Ubah App Name

**Android**: `android/app/src/main/AndroidManifest.xml`
```xml
<application android:label="DPP Store">
```

**iOS**: `ios/Runner/Info.plist`
```xml
<key>CFBundleName</key>
<string>DPP Store</string>
```

### Ubah App Icon

1. Prepare icon (1024x1024 px)
2. Install package:
```bash
flutter pub add flutter_launcher_icons
```
3. Configure di `pubspec.yaml`
4. Generate:
```bash
flutter pub run flutter_launcher_icons
```

### Ubah Package Name

```bash
flutter pub add change_app_package_name
flutter pub run change_app_package_name:main com.dppstore.app
```

## ⚡ Performance Tips

1. **Build Release Mode** untuk testing performa:
   ```bash
   flutter run --release
   ```

2. **Profile Mode** untuk debugging performa:
   ```bash
   flutter run --profile
   ```

3. **Analyze code** sebelum build:
   ```bash
   flutter analyze
   ```

4. **Check APK size**:
   ```bash
   flutter build apk --analyze-size
   ```

## 📚 Resources

- [Flutter Docs](https://docs.flutter.dev)
- [ForUI Docs](https://forui.dev/docs)
- [Riverpod Docs](https://riverpod.dev)
- [Go Router Docs](https://pub.dev/packages/go_router)

## ✅ Pre-Launch Checklist

- [ ] Test di berbagai ukuran layar
- [ ] Test dark mode
- [ ] Test semua navigation flows
- [ ] Test payment flow (WhatsApp redirect)
- [ ] Test dengan internet lambat
- [ ] Update nomor WhatsApp admin
- [ ] Update app icon & splash screen
- [ ] Hapus debug banner
- [ ] Build & test release APK
- [ ] Check APK size < 50MB
- [ ] Prepare Play Store assets (screenshots, description)

---

Jika ada pertanyaan atau issue, silakan hubungi developer.
