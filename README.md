# AI Image Generator App

A Flutter application that generates images using OpenAI's DALL-E 2 API. Enter a text prompt and watch as AI creates unique images based on your description.

<td align="center">
      <img src="https://github.com/user-attachments/assets/167daa3d-1229-4f13-a591-d45fba61d187" width="250" />
</td>
    
## Features

- **AI-Powered Image Generation** - Uses OpenAI's DALL-E 2 model
- **Simple Text Input** - Enter any description to generate images
- **Image Display** - View generated images with caching support
- **Real-time Feedback** - Loading states and error handling
- **Clean Architecture** - Organized with Provider state management
- **Material Design 3** - Modern UI with Flutter's latest design system

## Screenshots

<!-- Add screenshots of your app here -->

## Project Structure

```
lib/
├── data/
│   ├── model/
│   │   └── image_model.dart          # Image data model
│   └── service/
│       ├── network_caller.dart        # HTTP request handler
│       ├── network_response.dart      # Network response wrapper
│       └── open_api_service.dart      # OpenAI API integration
├── presentation/
│   └── home/
│       ├── provider/
│       │   └── image_generator_provider.dart  # State management
│       ├── screen/
│       │   └── home_screen.dart       # Main UI screen
│       └── widget/
│           └── image_display_widget.dart      # Image display component
└── main.dart                          # App entry point
```

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (^3.10.8)
- [Dart SDK](https://dart.dev/get-dart) (^3.10.8)
- An IDE (VS Code, Android Studio, or IntelliJ IDEA)
- An [OpenAI API Key](https://platform.openai.com/api-keys)

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd gen_ai_based_image_generator_app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Set up environment variables**

   Create a `.env` file in the root directory:

   ```bash
   touch .env
   ```

   Add your OpenAI API key to the `.env` file:

   ```env
   # OpenAI API Configuration
   OPENAI_API_KEY=your_openai_api_key_here
   ```

   > **Important**: Never commit your `.env` file to version control. It's already included in `.gitignore`.

4. **Get your OpenAI API Key**

   - Visit [OpenAI Platform](https://platform.openai.com/api-keys)
   - Sign up or log in to your account
   - Navigate to API Keys section
   - Create a new secret key
   - Copy the key and paste it in your `.env` file

### Running the App

#### On Android/iOS Emulator

```bash
flutter run
```

#### On Chrome (Web)

```bash
flutter run -d chrome
```

#### On Windows

```bash
flutter run -d windows
```

#### Build for Production

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# Windows
flutter build windows --release
```

## Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| [http](https://pub.dev/packages/http) | ^1.6.0 | HTTP requests to OpenAI API |
| [provider](https://pub.dev/packages/provider) | ^6.1.5+1 | State management |
| [cached_network_image](https://pub.dev/packages/cached_network_image) | ^3.4.1 | Image caching and display |
| [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) | ^5.1.0 | Environment variable management |
| [cupertino_icons](https://pub.dev/packages/cupertino_icons) | ^1.0.8 | iOS-style icons |

## How to Use

1. **Launch the app** on your preferred device/emulator
2. **Enter a prompt** in the text field (e.g., "A beautiful sunset over mountains")
3. **Tap "Generate Image"** button
4. **Wait** for the AI to generate your image (usually 5-15 seconds)
5. **View** your generated image!

### Example Prompts

- "A futuristic city with flying cars at night"
- "A cute cat wearing a space helmet"
- "An oil painting of a serene lake surrounded by autumn trees"
- "A robot playing guitar on stage"
- "A magical forest with glowing mushrooms"

## Configuration

### Image Generation Settings

The app currently uses these default settings (configurable in `open_api_service.dart`):

- **Model**: `dall-e-2`
- **Image Count**: `1` image per request
- **Image Size**: `512x512` pixels

To modify these settings, edit the `generateImage` method in `lib/data/service/open_api_service.dart`:

```dart
body: {
  'model': 'dall-e-2',      // or 'dall-e-3'
  'prompt': prompt,
  'n': 1,                   // number of images (1-10)
  'size': '512x512',        // '256x256', '512x512', or '1024x1024'
},
```

## Architecture

This app follows a **clean architecture** pattern with clear separation of concerns:

### Data Layer
- **Models**: Data structures (`ImageModel`)
- **Services**: API integration and network calls

### Presentation Layer
- **Providers**: State management using Provider pattern
- **Screens**: UI pages
- **Widgets**: Reusable UI components

### State Management
Uses **Provider** pattern for reactive state management, making the UI automatically update when data changes.

## Troubleshooting

### Common Issues

**Issue**: "Failed to generate image" error

- **Solution**: Check your OpenAI API key in `.env` file
- Ensure you have sufficient credits in your OpenAI account
- Verify your internet connection

**Issue**: App crashes on startup

- **Solution**: Run `flutter clean` then `flutter pub get`
- Ensure `.env` file exists in the root directory

**Issue**: Images not loading

- **Solution**: Check internet connectivity
- Clear app cache and restart

**Issue**: "API key not found" error

- **Solution**: Verify `.env` file is in the root directory (same level as `pubspec.yaml`)
- Ensure the key name is exactly `OPENAI_API_KEY`
- Restart the app after adding the `.env` file

## API Costs

OpenAI's DALL-E 2 API is a paid service:

- **DALL-E 2**: ~$0.020 per image (512×512)
- **DALL-E 3**: ~$0.040 per image (1024×1024)

Check [OpenAI Pricing](https://openai.com/pricing) for current rates.

## Contributing

This is an educational project. Feel free to fork and experiment!

## License

This project is created for educational purposes as part of Ostad Batch 11.

## Acknowledgments

- [OpenAI](https://openai.com/) for the DALL-E API
- [Flutter](https://flutter.dev/) team for the amazing framework
- Ostad for the learning opportunity

## Additional Resources

- [OpenAI API Documentation](https://platform.openai.com/docs)
- [Flutter Documentation](https://docs.flutter.dev/)
- [Provider Package Documentation](https://pub.dev/packages/provider)
- [DALL-E 2 Guide](https://platform.openai.com/docs/guides/images)


