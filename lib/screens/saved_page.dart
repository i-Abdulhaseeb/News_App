import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/widgets/saved_item.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});
  Future<List<Map<String, dynamic>>> getSavedNews() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final ref = FirebaseDatabase.instance.ref('news/$uid');

    final snapshot = await ref.get();
    List<Map<String, dynamic>> newsList = [];
    if (snapshot.exists) {
      final data = snapshot.value as Map;
      data.forEach((key, value) {
        newsList.add({
          'key': key,
          'source': value['source'],
          'author': value['author'],
          'title': value['title'],
          'description': value['description'],
          'imgUrl': value['imgUrl'],
          'content': value['content'],
        });
      });
    }
    return newsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111A22),
      appBar: AppBar(
        backgroundColor: Color(0xFF111A22),
        title: Text(
          "Saved",
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getSavedNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No saved news yet',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          final newsList = snapshot.data!;
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final news = newsList[index];
              final imageUrl = news['imgUrl'];
              final title = news['title'];
              final source = news['source'];
              final author = news['author'];
              final content = news['content'];
              final description = news['description'];
              return SavedItem(
                author: author,
                content: content,
                description: description,
                source: source,
                title: title,
                url: imageUrl,
              );
            },
          );
        },
      ),
    );
  }
}
