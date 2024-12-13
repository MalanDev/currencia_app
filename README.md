# currencia_app

A Flutter application implementing Clean Architecture with MVVM, Riverpod for state management, and Dio for network requests. The project also includes JWT token handling and a robust theming system for light and dark modes.

## Features

- Clean Architecture: Organized into core, data, domain, and presentation layers.

- MVVM Pattern: Separation of business logic and UI components.

- Riverpod State Management: Simplified and efficient state handling.

- Dio for HTTP: Advanced networking with interceptors and logging.

- Dynamic Theming: Supports light and dark themes.


## Architecture Overview

### 1. Layers

- Core: Contains common utilities like constants, theme configuration, and dependency injection.

- Data: Handles API requests and data sources. Uses Dio for HTTP and repositories for abstraction.

- Domain: Contains business logic and use cases.

- Presentation: Manages the UI, view models, and state providers.

### 2. Why Clean Architecture?

- Clean Architecture ensures:

- High maintainability.

- Separation of concerns.

- Easier testing and scalability.

## Setup Instructions

### 1. Prerequisites

- Install Flutter: Flutter Installation Guide

- Ensure you have a valid Flutter development environment (IDE, Emulator/Device).

### 2. Clone the Repository

```bash
  git clone https://github.com/MalanDev/currencia_app.git
  cd currencia_app
```

### 3. Install Dependencies

```bash
  flutter pub get
```

### 4. Configure API Base URL

```bash
 const String apiBaseUrl = "https://your-api-url.com";
```

### 5. Run the App

```bash
  flutter run
```

## Dependencies

- Flutter SDK: 3.0+

- Riverpod: State management.

- Dio: HTTP client.

- Flutter Lints: Ensures clean coding standards.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
