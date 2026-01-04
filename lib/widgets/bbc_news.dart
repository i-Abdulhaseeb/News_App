import 'package:flutter/material.dart';
import 'package:news_app/screens/news_detail.dart';
import 'package:news_app/widgets/bbc_item.dart';

class BbcNews extends StatelessWidget {
  final Future<List<dynamic>> articles;
  const BbcNews({super.key, required this.articles});
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
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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

              return index == 0
                  ? InkWell(
                      onTap: () {
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
                      splashColor: Colors.white24,
                      child: Card(
                        color: Color(0xFF1A2430),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: 'news-image${index + 100}',
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                child: SizedBox(
                                  height: 180,
                                  width: double.infinity,
                                  child: Image.network(
                                    imageUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title
                                  Text(
                                    title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 4),

                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.public,
                                        color: Colors.grey,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        source,
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : BbcItem(
                      title: title,
                      url: imageUrl!,
                      sourceName: source,
                      index: index,
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
