import 'package:flutter/material.dart';
import 'package:news_app/service/news_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<dynamic>> _articles;

  @override
  void initState() {
    super.initState();
    _articles = NewsService().fetchTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: _articles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No articles found'));
          } else {
            final articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  leading: article['urlToImage'] != null
                      ? Image.network(
                          article['urlToImage'],
                          width: 100,
                          fit: BoxFit.cover,
                        )
                      : null,
                  title: Text(article['title'] ?? 'No title'),
                  subtitle: Text(article['description'] ?? ''),
                );
              },
            );
          }
        },
      ),
    );
  }
}
