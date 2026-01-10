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

  Future<List<dynamic>> fetchBitcoinHeadlines() async {
    final url = Uri.parse(
      'https://newsapi.org/v2/everything?q=bitcoin&apiKey=$apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<dynamic>> fetchAppleHeadlines() async {
    final url = Uri.parse(
      'https://newsapi.org/v2/everything?q=apple&from=2026-01-04&to=2026-01-04&sortBy=popularity&apiKey=$apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<dynamic>> fetchTechHeadlines() async {
    final url = Uri.parse(
      'https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=$apiKey',
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
