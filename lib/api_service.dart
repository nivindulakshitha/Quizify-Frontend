import 'package:http/http.dart' as http;
import 'dart:convert';

// Function to make a POST request:nivindulakshitha
Future<Map<String, dynamic>> postRequest(
    String endpoint, Map<String, dynamic> body) async {
  final url = Uri.parse('https://quizify-api.netlify.app/api/$endpoint');

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {
        'success': false,
        'message': 'An error occurred while processing your request',
      };
    }
  } catch (error) {
    return {
      'success': false,
      'message': 'An error occurred while processing your request',
      'error': error.toString(),
    };
  }
}

// Function to make a GET request:nivindulakshitha
Future<Map<String, dynamic>> getRequest(String endpoint) async {
	final url = Uri.parse('https://quizify-api.netlify.app/api/$endpoint');

	try {
		final response = await http.get(url);

		if (response.statusCode == 200) {
			return jsonDecode(response.body);
		} else {
			return {
				'success': false,
				'message': 'An error occurred while processing your request',
			};
		}
	} catch (error) {
		return {
			'success': false,
			'message': 'An error occurred while processing your request',
			'error': error.toString(),
		};
	}
}
