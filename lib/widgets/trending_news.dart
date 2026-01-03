import 'package:flutter/material.dart';
import 'package:news_app/widgets/trending_item.dart';

class TrendingNews extends StatelessWidget {
  final Future<List<dynamic>> articles;
  const TrendingNews({super.key, required this.articles});
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

              if (imageUrl == null || title == null) {
                return const SizedBox.shrink();
              }

              return TrendingItem(url: imageUrl, title: title);
            },
          );
        }
      },
    );
  }
}
