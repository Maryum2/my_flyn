# My Flyn — Flutter (GetX) Test Assignment

A clean, production-style Flutter app built with **GetX** following the assignment requirements: strict **View/Controller** separation, **reactive UI** with `Obx`/`Rx`, **native permission handling** (Android + iOS), reusable **common widgets**, and **no hard-coded UI strings**.

---

## ✨ Highlights

- **Architecture:** View (widgets) ⟷ Controller (business/state) with GetX
- **Reactive UI:** `Rx<T>` in controllers, `Obx` in views
- **Permissions:**  
  - Android: native camera permission (Kotlin/Manifest)  
  - iOS: native camera permission (Swift + `Info.plist`)
- **Common components:** `CommonAppBar`, `CommonTextField`, `PrimaryButton`, etc.
- **Theming:** `AppTheme.light` with **Pretendard** font
- **No hard-coded strings:** all in `AppStrings`
- **Screens:** Splash, Home, Campaign List, My Info → Basic Info, Password Settings, Interests, Notice, FAQ, Terms

---

## 🗂️ Project Structure


## 🧱 Architecture

- **Controllers** (`GetxController`) own state & logic.  
- **Views** are stateless; they **read** controller state with `Obx` and **call** controller methods.  
- **Bindings**: `InitialBindings` registers global controllers once at app start.



# My Flyn — Flutter (GetX) Test Assignment

A clean, production-style Flutter app built with **GetX** following the assignment requirements: strict **View/Controller** separation, **reactive UI** with `Obx`/`Rx`, **native permission handling** (Android + iOS), reusable **common widgets**, and **no hard-coded UI strings**.

---

## ✨ Highlights

- **Architecture:** View (widgets) ⟷ Controller (business/state) with GetX
- **Reactive UI:** `Rx<T>` in controllers, `Obx` in views
- **Permissions:**  
  - Android: native camera permission (Kotlin/Manifest)  
  - iOS: native camera permission (Swift + `Info.plist`)
- **Common components:** `CommonAppBar`, `CommonTextField`, `PrimaryButton`, etc.
- **Theming:** `AppTheme.light` with **Pretendard** font
- **No hard-coded strings:** all in `AppStrings`
- **Screens:** Splash, Home, Campaign List, My Info → Basic Info, Password Settings, Interests, Notice, FAQ, Terms

---

## 🗂️ Project Structure

```
lib/
  controllers/
    compaigns/
      compaign_controller.dart
    permissions/
      permissions_controller.dart
    profile/
      profile_controller.dart
  core/
    bindings/
      initial_bindings.dart
    components/
      common_app_bar.dart
      common_text_field.dart
      primary_button.dart
  resources/
    app_colors.dart
    app_strings.dart
    app_text_styles.dart
    app_theme.dart
  routes/
    app_routes.dart
  views/
    splash/
      splash_view.dart
    home/
      home_view.dart
    campaigns/
      campaign_list_view.dart
    profile/
      my_info_view.dart
      basic_info_view.dart
      password_settings_view.dart
      interests_view.dart
    misc/
      notice_view.dart
      faq_view.dart
      terms_view.dart
main.dart
```

---

## 🧱 Architecture

- **Controllers** (`GetxController`) own state & logic.  
- **Views** are stateless; they **read** controller state with `Obx` and **call** controller methods.  
- **Bindings**: `InitialBindings` registers global controllers once at app start.

---

## 🔁 Reactivity Example

```dart
// controller
final newPassword = ''.obs;
bool get canSubmitPassword => newPassword.value.length >= 8;

// view
Obx(() => PrimaryButton(
  label: AppStrings.passwordDone,
  onPressed: c.canSubmitPassword ? c.updatePassword : null,
));
```

---

## 🔐 Permissions

### Android
- Add to **AndroidManifest.xml**:
```xml
<uses-permission android:name="android.permission.CAMERA"/>
```

### iOS
- Add to **Info.plist**:
```xml
<key>NSCameraUsageDescription</key>
<string>This app requires camera access to take photos.</string>
```

---

## 🎨 Theme & Fonts

- **Font:** Pretendard  
- Registered in `pubspec.yaml` under `fonts:`  
- Applied globally via `AppTheme.light`

---

## 📱 Screens Implemented

- **Home** → Greeting, camera button, My Campaign status card, menu list  
- **Campaign List** → 3-tab strip, campaign rows, bottom fade overlay  
- **My Info** → Basic Info, Password Settings, Interests  
- **Misc** → Notice, FAQ, Terms (placeholders)

---

## 🧭 Routes

All screens are wired with named routes inside `AppRoutes`.

---

## ✅ Assignment Requirements Checklist

- [x] GetX architecture  
- [x] View/Controller separation  
- [x] Rx/Obx reactivity  
- [x] Android & iOS native permissions  
- [x] All Figma screens  
- [x] Common components  
- [x] No hard-coded strings  
- [x] Performance optimizations (`const`, minimal rebuilds)

---

## 🛠️ Setup & Run

```bash
flutter clean
flutter pub get
flutter run
```

### iOS setup
- Open `ios/Runner.xcworkspace` in Xcode  
- Set unique **Bundle Identifier**  
- Enable **Automatically manage signing**

---

## 🔌 Initial Bindings

```dart
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController(), permanent: true);
  }
}
```

Injected in `GetMaterialApp(initialBinding: InitialBindings())`.

---

## 📦 Git Workflow

```bash
git add .
git commit -m "feat: initial Flutter app with GetX, permissions, and screens"
git push origin main
```




