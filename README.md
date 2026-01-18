# PulseNow Flutter Developer Assessment

This repository contains the take-home assessment for the Flutter Developer position at PulseNow.

## Implementation Summary

The Flutter app has been successfully implemented and tested on both iOS and Android platforms. Key achievements include:

- **✅ Complete API Integration**: Implemented repository pattern with remote data source connecting to the Node.js backend
- **✅ Data Models**: MarketData model with proper null safety and JSON parsing
- **✅ State Management**: Provider-based state management with loading, error, and data states
- **✅ UI Implementation**: Market data screen with ListView, loading indicators, error handling, and color-coded price changes
- **✅ Platform Configuration**: 
  - Android: Configured to use `10.0.2.2` for emulator access to localhost backend
  - iOS: Added App Transport Security settings to allow localhost connections
- **✅ Error Handling**: Comprehensive error handling with user-friendly messages and retry functionality
- **✅ Code Quality**: Clean architecture following Flutter best practices with proper separation of concerns

## Results

The app has been tested on both iOS and Android platforms with proper error handling:

### Android Emulator

**Error State** - When backend is not accessible:
![Android Error Screen](screenshots/android-error.png)
*Error handling screen showing "Network error. Please check your connection" with retry button*

**Success State** - Market data loaded successfully:
![Android Market Data Screen](screenshots/android-market-data.png)
*Market data displayed successfully on Android emulator with real-time price updates*

**Features visible:**
- List of cryptocurrency pairs (BTC/USD, ETH/USD, SOL/USD, ADA/USD, DOT/USD)
- Current prices formatted as currency
- 24h change percentages with color coding (green for positive, red for negative)
- Clean card-based UI with rounded corners
- Pull-to-refresh functionality
- Error state with retry functionality

### iOS Simulator

**Error State** - When backend is not accessible:
![iOS Error Screen](screenshots/ios-error.png)
*Error handling screen showing "Network error. Please check your connection" with retry button*

**Success State** - Market data loaded successfully:
![iOS Market Data Screen](screenshots/ios-market-data.png)
*Market data displayed successfully on iOS simulator with color-coded price changes*

**Features visible:**
- List of cryptocurrency pairs with prices
- Formatted currency and percentage displays
- Green/red color coding for positive/negative changes
- Loading states and error handling with retry functionality
- Native iOS design patterns

## Project Structure

```
.
├── backend/              # Node.js backend API with mock data
│   ├── controllers/      # API route controllers
│   ├── data/            # Mock data generators
│   ├── middlewares/     # Express middlewares
│   └── server.js        # Main server file
│
├── flutter_app/         # Flutter application (to be completed)
│   └── lib/
│       ├── models/      # Data models
│       ├── services/    # API and WebSocket services
│       ├── providers/   # State management
│       └── screens/     # UI screens
│
└── ASSESSMENT.md        # Detailed assessment instructions
```

## Quick Start

### 1. Start the Backend

```bash
cd backend
npm install
npm start
```

The backend will run on `http://localhost:3000`

**Important**: The backend server must be running before starting the Flutter app.

### 2. Start the Flutter App

```bash
cd flutter_app
flutter pub get
flutter run
```

### Platform-Specific Configuration

**For Android Emulator:**
- The app is configured to use `10.0.2.2:3000` to access the host machine's localhost
- Configuration in `lib/core/constants/app_constants.dart`

**For iOS Simulator:**
- The app uses `localhost:3000` directly
- App Transport Security settings configured in `ios/Runner/Info.plist`

## Assessment Overview

This is a focused assessment that tests your ability to:

- Integrate Flutter apps with REST APIs
- Implement state management with Provider
- Create UI components for displaying data
- Handle loading and error states
- Write clean, maintainable code

See `ASSESSMENT.md` for detailed requirements and evaluation criteria.

## Features Implemented

### Core Features
- ✅ Market data display with crypto symbols, prices, and 24h changes
- ✅ Color-coded price changes (green for positive, red for negative)
- ✅ Loading states with progress indicators
- ✅ Error handling with retry functionality
- ✅ Pull-to-refresh support
- ✅ Formatted currency and percentage displays
- ✅ Empty state handling

### Architecture
- Clean Architecture with separation of layers (data, domain, presentation)
- Repository pattern for data management
- Provider for state management
- Dependency injection ready structure
- Comprehensive error handling with custom failure types

## Backend API

The backend provides a simple **Market Data API** endpoint:
- `GET /api/market-data` - Returns list of crypto symbols with prices and 24h changes

See `backend/README.md` for API documentation.

## Questions?

Contact the hiring team if you have any questions.

Good luck! 🚀
