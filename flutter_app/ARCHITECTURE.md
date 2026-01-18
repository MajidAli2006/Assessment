# Architecture Documentation

This document describes the architecture and design patterns used in the PulseNow Flutter application.

## Architecture Overview

The application follows **Clean Architecture** principles with clear separation of concerns across multiple layers:

```
lib/
├── core/                    # Core domain layer - interfaces, errors, constants
│   ├── constants/          # App-wide constants and strings
│   ├── errors/             # Error handling (Failures)
│   └── interfaces/         # Abstract interfaces (abstractions)
├── data/                   # Data layer - repository implementations
│   ├── datasources/        # Remote/local data sources
│   └── repositories/       # Repository implementations
├── domain/                 # Domain layer (models are in models/)
│   └── models/             # Domain models
├── presentation/           # Presentation layer - UI components
│   ├── screens/            # Full screen widgets
│   └── widgets/            # Reusable UI widgets
└── providers/              # State management (Provider pattern)
```

## Design Principles

### SOLID Principles

1. **Single Responsibility Principle (SRP)**
   - Each class has one reason to change
   - `MarketDataRepository` - only handles data retrieval
   - `MarketDataProvider` - only manages state
   - `MarketDataListItem` - only displays one item

2. **Open/Closed Principle (OCP)**
   - Classes are open for extension, closed for modification
   - Interfaces allow extension without modifying existing code
   - New data sources can be added without changing repository

3. **Liskov Substitution Principle (LSP)**
   - Implementations can be substituted with their interfaces
   - `MarketDataRemoteDataSource` implements `IMarketDataDataSource`
   - `MarketDataRepository` implements `IMarketDataRepository`

4. **Interface Segregation Principle (ISP)**
   - Clients don't depend on interfaces they don't use
   - Separate interfaces for different concerns
   - `IMarketDataDataSource` - only data fetching methods
   - `IMarketDataRepository` - only business logic methods

5. **Dependency Inversion Principle (DIP)**
   - Depend on abstractions, not concretions
   - `MarketDataProvider` depends on `IMarketDataRepository`, not concrete implementation
   - `MarketDataRepository` depends on `IMarketDataDataSource`, not concrete implementation

## Design Patterns

### 1. Repository Pattern
- **Location**: `lib/data/repositories/market_data_repository.dart`
- **Purpose**: Abstracts data access logic
- **Benefits**: 
  - Single source of truth for data
  - Easy to switch data sources (remote/local/cache)
  - Testable - can mock repository interface

### 2. Data Source Pattern
- **Location**: `lib/data/datasources/market_data_remote_datasource.dart`
- **Purpose**: Handles specific data source implementation
- **Benefits**: 
  - Separates data fetching from business logic
  - Can have multiple data sources (remote, local, cache)

### 3. Provider Pattern (State Management)
- **Location**: `lib/providers/market_data_provider.dart`
- **Purpose**: Manages application state
- **Benefits**: 
  - Reactive UI updates
  - Separation of business logic from UI

### 4. Factory Pattern
- **Location**: `lib/models/market_data_model.dart`
- **Purpose**: Creates objects from JSON
- **Benefits**: 
  - Centralized object creation
  - Type-safe deserialization

### 5. Dependency Injection
- **Implementation**: Constructor injection
- **Purpose**: Loose coupling between components
- **Example**: 
  ```dart
  MarketDataProvider({
    IMarketDataRepository? repository,
  }) : _repository = repository ?? MarketDataRepository(...);
  ```

## Layer Responsibilities

### Core Layer
- **Purpose**: Domain-independent abstractions
- **Contains**: 
  - Interfaces (contracts)
  - Error types (Failures)
  - Constants and strings
- **Dependencies**: None (most independent)

### Data Layer
- **Purpose**: Data access and persistence
- **Contains**:
  - Repository implementations
  - Data source implementations
  - API clients
- **Dependencies**: Core layer

### Domain Layer (Models)
- **Purpose**: Business entities
- **Contains**:
  - Domain models (MarketData)
  - Business rules
- **Dependencies**: Core layer

### Presentation Layer
- **Purpose**: UI and user interaction
- **Contains**:
  - Screens
  - Widgets
  - State management
- **Dependencies**: Data layer, Domain layer, Core layer

## Error Handling

Custom error types in `lib/core/errors/failures.dart`:
- `ServerFailure` - Server errors (500+)
- `NetworkFailure` - Network connectivity issues
- `InvalidDataFailure` - Invalid data format
- `UnknownFailure` - Unexpected errors

Benefits:
- Type-safe error handling
- Clear error categorization
- Easy to handle different error types in UI

## Constants & Strings Separation

### Constants (`lib/core/constants/app_constants.dart`)
- API URLs and endpoints
- HTTP status codes
- UI constants (padding, elevation, etc.)
- Design system values (colors, sizes)

### Strings (`lib/core/constants/app_strings.dart`)
- All user-facing strings
- Error messages
- Button labels
- Screen titles

**Benefits**:
- Easy to localize (i18n)
- Centralized string management
- Prevents hardcoded strings in widgets

## Dependency Flow

```
Presentation → Data → Core
     ↓          ↓       ↓
  Provider  Repository  Interface
```

- Presentation depends on Data and Core
- Data depends on Core only
- Core has no dependencies

## Testing Strategy

With this architecture:
- **Unit Tests**: Can test each layer independently
- **Mocking**: Easy to mock interfaces
- **Integration Tests**: Can test repository + data source
- **Widget Tests**: Can test UI with mock providers

## Benefits of This Architecture

1. **Maintainability**: Clear separation of concerns
2. **Testability**: Each layer can be tested independently
3. **Scalability**: Easy to add new features
4. **Flexibility**: Easy to swap implementations
5. **Code Reusability**: Core abstractions can be reused
6. **Team Collaboration**: Clear boundaries for different developers

## Future Enhancements

With this architecture, we can easily add:
- Local caching (new data source)
- Offline support (cache repository)
- WebSocket updates (new data source)
- Different UI themes (presentation layer)
- Unit tests (mock interfaces)
- Integration tests (test data flow)
