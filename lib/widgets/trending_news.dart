import 'package:flutter/material.dart';
import 'package:news_app/screens/news_detail.dart';
import 'package:news_app/widgets/trending_item.dart';

class TrendingNews extends StatelessWidget {
  final Future<List<dynamic>> articles;
  const TrendingNews({super.key, required this.articles});
  bool isValidImageUrl(String? url) {
    if (url == null || url.isEmpty) return false;

    final uri = Uri.tryParse(url);
    return uri != null &&
        uri.hasAbsolutePath &&
        (uri.scheme == 'http' || uri.scheme == 'https');
  }

  void goToDetails(
    BuildContext context,
    String source,
    String author,
    String title,
    String description,
    String url,
    String content,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => NewsDetail(
          sourceName: source,
          authorName: author,
          content: content,
          imgUrl: url,
          description: description,
          title: title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: articles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No articles found'));
        } else {
          final trending = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trending.length,
            itemBuilder: (context, index) {
              final t1 = trending[index];

              final imageUrl = t1['urlToImage'] as String?;
              final title = t1['title'] as String?;
              final source = t1['source']['name'];
              final author = t1['author'];
              final content = t1['content'];
              final description = t1['description'];

              if (!isValidImageUrl(imageUrl) || title == null) {
                return const SizedBox.shrink();
              }

              return TrendingItem(
                url: imageUrl!,
                title: title,
                onSelect: () {
                  goToDetails(
                    context,
                    source ?? 'Unknown Source',
                    author ?? 'Unknown Author',
                    title,
                    description ?? 'Description Currently Not Available',
                    imageUrl,
                    content ?? 'Content Currently Not Available',
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
