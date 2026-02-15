import 'package:flutter/material.dart';
import 'package:gen_ai_based_image_generator_app/data/model/image_model.dart';
import 'package:gen_ai_based_image_generator_app/data/service/open_api_service.dart';

class ImageGeneratorProvider extends ChangeNotifier {
  final OpenAIService _openAIService;

  ImageGeneratorProvider(this._openAIService);

  ImageModel? _currentImage;
  bool _isLoading = false;
  String? _errorMessage;

  ImageModel? get currentImage => _currentImage;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> generateImage(String prompt) async {
    print('🎬 [Provider] Starting image generation for prompt: $prompt');

    if (prompt.trim().isEmpty) {
      _errorMessage = 'Prompt cannot be empty';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      print('⏳ [Provider] Calling OpenAI service...');
      final image = await _openAIService.generateImage(prompt);
      print('✅ [Provider] Image generated successfully!');
      print('🖼️ [Provider] Image URL: ${image.url}');
      print('📅 [Provider] Created at: ${image.createdAt}');

      _currentImage = image;
      _errorMessage = null;
    } catch (e) {
      print('❌ [Provider] Error occurred: $e');
      _errorMessage = e.toString();
      _currentImage = null;
    } finally {
      _isLoading = false;
      print(
        '🏁 [Provider] Generation complete. Loading: $_isLoading, Error: $_errorMessage',
      );
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void clearCurrentImage() {
    _currentImage = null;
    notifyListeners();
  }
}
