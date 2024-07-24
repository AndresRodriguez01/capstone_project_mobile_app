import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthorizedEmails {
  static List<String> authorizedEmailList = [];

  static Future<void> initializeEmails() async {
    const String url = 'https://raw.githubusercontent.com/AndresRodriguez01/authorization-test/main/emails.json';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        
        // Assuming your JSON structure for emails is simple and matches the provided example
        authorizedEmailList = List<String>.from((jsonData['authorized_emails'] as List)
            .map((item) => item['email'] as String));

      } else {
        throw Exception('Failed to load authorized emails with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load authorized emails: ${e.toString()}');
    }
  }
}
