# Running the App on iOS Simulator and Android Emulator

## Prerequisites

1. Backend server must be running:
   ```bash
   cd backend
   npm install
   npm start
   ```
   Backend runs on `http://localhost:3000`

2. Both devices must be available:
   - iOS Simulator: iPhone 16 Plus
   - Android Emulator: emulator-5554

## Important: API URL Configuration

The app uses different base URLs for iOS and Android:
- **iOS Simulator**: Uses `localhost:3000` (iOS simulator can access localhost)
- **Android Emulator**: Uses `10.0.2.2:3000` (Android emulator maps localhost to 10.0.2.2)

## Option 1: Run on iOS Simulator First

1. Ensure `app_constants.dart` has:
   ```dart
   static const String baseUrl = 'http://localhost:3000/api';
   ```

2. Run iOS simulator:
   ```bash
   cd flutter_app
   flutter run -d 0039E584-6149-4878-AFD4-8045BBE1B9A4
   ```

## Option 2: Run on Android Emulator

1. Update `app_constants.dart` to:
   ```dart
   static const String baseUrl = 'http://10.0.2.2:3000/api';
   ```

2. Run Android emulator:
   ```bash
   cd flutter_app
   flutter run -d emulator-5554
   ```

## Option 3: Run Both Simultaneously (Different Terminals)

Since they need different base URLs, you'll need to:

1. **Terminal 1 - iOS Simulator**:
   ```bash
   cd flutter_app
   # Ensure baseUrl is 'http://localhost:3000/api'
   flutter run -d 0039E584-6149-4878-AFD4-8045BBE1B9A4
   ```

2. **Terminal 2 - Android Emulator**:
   ```bash
   cd flutter_app
   # Change baseUrl to 'http://10.0.2.2:3000/api' in app_constants.dart
   flutter run -d emulator-5554
   ```

## Quick Commands

**Check available devices:**
```bash
flutter devices
```

**Check backend status:**
```bash
curl http://localhost:3000/health
```

**Current configuration:**
- Base URL is set for **Android Emulator** (10.0.2.2)
- To use iOS Simulator, change to `localhost` in `lib/core/constants/app_constants.dart`

## Testing

After the app launches:
- App should display "PulseNow" in the app bar
- Market data list should load automatically
- Pull to refresh should work
- Error states should display properly if backend is down
