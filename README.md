# Anime Shopping Cart

A Flutter anime merchandise and character shopping app. The app includes an animated video intro, a browsable anime catalog, item detail pages, a cart, profile and login screens, and Firebase email/password authentication. Product and artwork assets are bundled in `lib/`.

## Requirements

- Flutter SDK compatible with Dart `^3.10.7` (see `pubspec.yaml`)
- Android Studio with an Android emulator, or a connected Android device
- For web: a browser supported by Flutter, such as Chrome
- For iOS/macOS: Xcode on macOS

Check the local Flutter setup with:

```bash
flutter doctor
```

## Run the app

Open a terminal in this project directory (the folder containing `pubspec.yaml`):

```bash
cd ty
flutter pub get
flutter devices
flutter run
```

If you are already in the `ty` directory, omit `cd ty`. To choose a device, pass its ID from `flutter devices`:

```bash
flutter run -d <device-id>
```

To run the Flutter web UI in Chrome:

```bash
flutter run -d chrome
```

To run on Android, start an emulator in Android Studio or connect a device with USB debugging enabled, then run `flutter run`. You can also select the device from your IDE's Flutter device menu and start a debug session.

## Firebase configuration

The app initializes Firebase in `lib/main.dart` and uses Firebase Authentication. The repository currently includes FlutterFire configuration for project `cart-ec052` in `lib/firebase_options.dart`, plus Android configuration in `android/app/google-services.json`.

To use your own Firebase project:

1. Create a Firebase project and register the app platforms you plan to run.
2. Enable **Email/Password** under **Authentication → Sign-in method**.
3. Install/configure the FlutterFire CLI if needed, then from this directory run:

   ```bash
   flutterfire configure
   ```

4. Use the generated `lib/firebase_options.dart` and platform configuration files for your Firebase project.

Firebase configuration values are project-specific. Do not commit private service credentials or administrator keys. Firebase client configuration files and API keys should be restricted according to Firebase guidance for your project.

## Useful commands

```bash
flutter analyze                 # Check the Dart source
flutter build apk               # Build an Android APK
flutter build web               # Build the web app
```

## Project layout

```text
ty/
├── lib/
│   ├── main.dart          # App entry point and intro screen
│   ├── home.dart          # Product browsing UI
│   ├── detail.dart        # Product details
│   ├── CartPg.dart        # Shopping cart UI
│   ├── login.dart         # Login and registration UI
│   ├── auth.dart          # Firebase Authentication service
│   └── ...                # Profile, explore screens, and bundled assets
├── android/               # Android runner and Firebase config
├── ios/                   # iOS runner
├── web/                   # Web runner
└── pubspec.yaml           # Flutter dependencies and asset declarations
```
