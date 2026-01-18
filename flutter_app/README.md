# PulseNow Flutter Application

> Flutter mobile application for cryptocurrency trading and analytics

---

## 📋 Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Project Structure](#project-structure)
- [Running the App](#running-the-app)
- [Architecture](#architecture)
- [Assessment Requirements](#assessment-requirements)

---

## 🎯 Overview

This Flutter application displays cryptocurrency market data with real-time
updates, analytics, and portfolio management features. Built following Clean
Architecture principles with Provider state management.

**Key Technologies:**
- Flutter 3.0+
- Dart
- Provider (State Management)
- Clean Architecture
- RESTful API Integration
- WebSocket Support

---

## 📦 Prerequisites

Before running the application, ensure you have:

- ✅ **Flutter SDK** 3.0 or higher installed
- ✅ **Dart SDK** (included with Flutter)
- ✅ **Backend server** running (see
  [`../backend/README.md`](../backend/README.md))
- ✅ **iOS Simulator** or **Android Emulator** running

### Verify Flutter Installation

```bash
flutter --version
flutter doctor
```

---

## ⚙️ Setup

### Step 1: Install Dependencies

```bash
cd flutter_app
flutter pub get
```

### Step 2: Verify Backend Server

Ensure the backend server is running on `http://localhost:3000`

> **Note:** For Android emulator, use `10.0.2.2` instead of `localhost` in
> `lib/core/constants/app_constants.dart`

### Step 3: Run the Application

```bash
# Run on connected device/emulator
flutter run

# Run on specific device
flutter run -d <device-id>

# Run with hot reload (default)
flutter run
```

---

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
│
├── core/                     # Core utilities and infrastructure
│   ├── constants/           # App-wide constants and strings
│   ├── errors/              # Custom error types and failures
│   ├── interfaces/          # Repository interfaces
│   └── theme/               # App theming and styling
│
├── data/                     # Data layer
│   ├── datasources/         # API and local data sources
│   └── repositories/        # Repository implementations
│
├── models/                   # Data models
│   ├── analytics_model.dart
│   ├── market_data_model.dart
│   └── portfolio_model.dart
│
├── presentation/             # Presentation layer
│   └── widgets/             # Reusable UI widgets
│
├── providers/                # State management
│   ├── analytics_provider.dart
│   ├── market_data_provider.dart
│   └── portfolio_provider.dart
│
├── screens/                  # App screens
│   ├── home_screen.dart
│   └── market_data_screen.dart
│
├── services/                 # External services
│   ├── api_service.dart      # REST API service
│   └── websocket_service.dart # WebSocket service
│
└── utils/                    # Utility functions
    ├── constants.dart
    └── market_data_formatter.dart
```

---

## 🏃 Running the App

### Development Mode

```bash
# Start the app with hot reload
flutter run

# Run on specific platform
flutter run -d ios
flutter run -d android
```

### Release Mode

```bash
# Build for release
flutter build apk        # Android
flutter build ios        # iOS
flutter build web        # Web
```

### Debugging

```bash
# Run in debug mode with verbose logging
flutter run --debug

# Analyze code
flutter analyze

# Format code
dart format lib/
```

---

## 🏗️ Architecture

### Clean Architecture

The app follows **Clean Architecture** principles with clear separation of concerns:

```
┌─────────────────────────────────────┐
│      Presentation Layer             │
│  (Screens, Widgets, Providers)      │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│         Domain Layer                │
│  (Interfaces, Models, Use Cases)    │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│          Data Layer                 │
│  (Repositories, Data Sources)       │
└─────────────────────────────────────┘
```

### State Management

**Provider** is used for state management throughout the app:
- `MarketDataProvider` - Manages market data state
- `AnalyticsProvider` - Handles analytics state
- `PortfolioProvider` - Manages portfolio state

### Key Design Patterns

- ✅ **Repository Pattern** - Abstraction of data sources
- ✅ **Provider Pattern** - State management
- ✅ **Dependency Injection** - Loose coupling
- ✅ **Error Handling** - Custom Failure types

---

## 📋 Assessment Requirements

For detailed requirements and evaluation criteria, see:

- **Root Assessment:** [`../ASSESSMENT.md`](../ASSESSMENT.md)
- **Setup Guide:** [`../SETUP.md`](../SETUP.md)

### Implementation Status

✅ **Completed:**
- Market data display
- Error handling
- Loading states
- Pull-to-refresh
- Clean Architecture
- State management
- Code quality & linting

---

## 📝 Additional Notes

### Configuration

- **API Base URL:** Configured in
  `lib/core/constants/app_constants.dart`
- **Theming:** Defined in `lib/core/theme/`
- **Linting:** Rules in `analysis_options.yaml`

### Testing

See [`../README.md`](../README.md) for testing instructions and coverage details.

---

## 🔗 Related Documentation

- **Main README:** [`../README.md`](../README.md)
- **Backend API:** [`../backend/README.md`](../backend/README.md)
- **Architecture:** [`ARCHITECTURE.md`](ARCHITECTURE.md) (if exists)


---
