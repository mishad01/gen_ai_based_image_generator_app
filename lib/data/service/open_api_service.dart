import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gen_ai_based_image_generator_app/data/model/image_model.dart';
import 'network_caller.dart';

class OpenAIService {
  final String _baseUrl = 'https://api.openai.com/v1/images/generations';

  String get apiKey => dotenv.env['OPENAI_API_KEY'] ?? '';

  Future<ImageModel> generateImage(String prompt) async {
    final response = await NetworkCaller.postRequest(
      url: _baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: {'model': 'dall-e-2', 'prompt': prompt, 'n': 1, 'size': '512x512'},
    );

    if (response.isSuccess) {
      final imageUrl = response.responseData['data'][0]['url'];

      return ImageModel(
        url: imageUrl,
        prompt: prompt,
        createdAt: DateTime.now().toString(),
      );
    } else {
      if (response.responseData != null &&
          response.responseData['error'] != null) {
        throw Exception(
          response.responseData['error']['message'] ??
              'Failed to generate image',
        );
      } else {
        throw Exception(response.errorMessage ?? 'Failed to generate image');
      }
    }
  }
}
