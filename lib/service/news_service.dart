import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiKey = '2bf5914822994a13acc76e130d6643f8';

  Future<List<dynamic>> fetchTopHeadlines({String country = "us"}) async {
    final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<dynamic>> fetchBBCHeadlines() async {
    final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=$apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}
