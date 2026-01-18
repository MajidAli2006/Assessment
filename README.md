# PulseNow Flutter Developer Assessment

> Take-home assessment for the Flutter Developer position at PulseNow

---

## 📋 Table of Contents

- [Overview](#overview)
- [Results](#results)
- [Quick Start](#quick-start)
- [Features Implemented](#features-implemented)
- [Project Structure](#project-structure)
- [Code Quality](#code-quality)
- [Testing](#testing)
- [Backend API](#backend-api)
- [Documentation](#documentation)
- [Support](#support)

---

## 🎯 Overview

This repository contains a complete Flutter application implementation with a
Node.js backend for displaying cryptocurrency market data. The app has been
tested and verified on both iOS and Android platforms.

**Technologies Used:**
- Flutter 3.0+
- Dart
- Node.js / Express
- Provider (State Management)
- Clean Architecture

---

## ✅ Results

The application has been successfully tested on both iOS and Android platforms with comprehensive error handling.

### 📱 Android Emulator

#### Error State
When backend is not accessible:

![Android Error Screen](screenshots/android-error.png)

**Error Handling:**

- Network error detection
- User-friendly error message: "Network error. Please check your connection"
- Retry functionality

#### Success State
Market data loaded successfully:

![Android Market Data Screen](screenshots/android-market-data.png)

**Features Demonstrated:**

- ✅ List of cryptocurrency pairs (BTC/USD, ETH/USD, SOL/USD, ADA/USD,
  DOT/USD)
- ✅ Current prices formatted as currency
- ✅ 24h change percentages with color coding (green for positive, red for
  negative)
- ✅ Clean card-based UI with rounded corners
- ✅ Pull-to-refresh functionality
- ✅ Error state with retry functionality

---

### 🍎 iOS Simulator

#### Error State
When backend is not accessible:

![iOS Error Screen](screenshots/ios-error.png)

**Error Handling:**

- Network error detection
- User-friendly error message with retry button
- Native iOS design patterns

#### Success State
Market data displayed successfully:

![iOS Market Data Screen](screenshots/ios-market-data.png)

**Features Demonstrated:**

- ✅ List of cryptocurrency pairs with prices
- ✅ Formatted currency and percentage displays
- ✅ Green/red color coding for positive/negative changes
- ✅ Loading states and error handling with retry functionality
- ✅ Native iOS design patterns

---

## 🚀 Quick Start

### Prerequisites

- Flutter 3.0+ installed
- Node.js 14+ installed
- iOS Simulator or Android Emulator running

### Step 1: Start the Backend

```bash
cd backend
npm install
npm start
```

**Backend runs on:** `http://localhost:3000`

### Step 2: Start the Flutter App

```bash
cd flutter_app
flutter pub get
flutter run
```

> **Note:** For Android emulator, update
> `lib/core/constants/app_constants.dart` to use `10.0.2.2` instead of
> `localhost`.

---

## ✨ Features Implemented

### Core Features

- ✅ **Market Data Display** - Cryptocurrency symbols, prices, and 24h changes
- ✅ **Color-Coded Changes** - Visual indicators (green for positive, red for negative)
- ✅ **State Management** - Loading, error, and empty states
- ✅ **Pull-to-Refresh** - Manual data refresh support
- ✅ **Error Handling** - Comprehensive error handling with retry functionality

### Architecture & Code Quality

- ✅ **Clean Architecture** - Repository pattern implementation
- ✅ **State Management** - Provider-based state management
- ✅ **Error Handling** - Custom Failure types and error handling
- ✅ **Type Safety** - Strict type checking with 80+ lint rules

---

## 📁 Project Structure

```
flutter_app/lib/
├── core/              # Core utilities
│   ├── constants/     # App constants and strings
│   ├── errors/        # Custom error types
│   ├── interfaces/    # Repository interfaces
│   └── theme/         # App theming
├── data/              # Data layer
│   ├── datasources/   # API data sources
│   └── repositories/  # Repository implementations
├── models/            # Data models
│   ├── analytics_model.dart
│   ├── market_data_model.dart
│   └── portfolio_model.dart
├── presentation/      # UI layer
│   └── widgets/       # Reusable widgets
├── providers/         # State management
│   ├── analytics_provider.dart
│   ├── market_data_provider.dart
│   └── portfolio_provider.dart
├── screens/           # App screens
│   ├── home_screen.dart
│   └── market_data_screen.dart
├── services/          # External services
│   ├── api_service.dart
│   └── websocket_service.dart
└── utils/             # Utility functions
    ├── constants.dart
    └── market_data_formatter.dart
```

---

## 🔍 Code Quality

### Linting

**Configuration:** `flutter_app/analysis_options.yaml`

- ✅ 80+ lint rules enabled
- ✅ Strict type checking
- ✅ Flutter best practices enforced

**Commands:**

```bash
cd flutter_app

# Run analysis
flutter analyze

# Auto-fix issues
dart fix --apply
```

**Key Rules:**
- Type safety requirements
- Const constructor usage
- Package import organization
- Flutter framework best practices

---

## 🧪 Testing

### Test Suite

The project includes comprehensive unit tests and widget tests.

### Running Tests

```bash
cd flutter_app

# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/models/market_data_model_test.dart
```

### Test Coverage

| Component | Status | Description |
|-----------|--------|-------------|
| `MarketDataFormatter` | ✅ | All formatting functions tested |
| `MarketData` Model | ✅ | JSON parsing, validation, serialization |
| `MarketDataListItem` | ✅ | UI display and formatting |
| `LoadingWidget` | ✅ | Loading indicator widget |
| `PulseNowApp` | ✅ | App initialization |

---

## 🌐 Backend API

### Endpoints

**Market Data:**

- `GET /api/market-data` - Returns list of crypto symbols with prices and 24h
  changes

> **Full API Documentation:** See [`backend/README.md`](backend/README.md)
> for complete API reference.

---

## 📚 Documentation

### Additional Resources

- **Assessment Requirements:** [`ASSESSMENT.md`](ASSESSMENT.md) - Detailed
  requirements and evaluation criteria
- **Backend API Docs:** [`backend/README.md`](backend/README.md) - Complete
  backend API documentation
- **Flutter App Docs:** [`flutter_app/README.md`](flutter_app/README.md) -
  Flutter app setup and structure
- **Setup Instructions:** [`SETUP.md`](SETUP.md) - Detailed setup guide

---

## 💬 Support

### Questions?

For questions regarding:

- **Assessment requirements** - Refer to `ASSESSMENT.md`
- **Technical issues** - Check the documentation files above
- **General inquiries** - Contact the hiring team

---

## 🎉 Good Luck!

Happy coding! 🚀

