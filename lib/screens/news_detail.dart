import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsDetail extends StatefulWidget {
  final String sourceName;
  final String authorName;
  final String title;
  final String description;
  final String imgUrl;
  final String content;

  const NewsDetail({
    super.key,
    required this.sourceName,
    required this.authorName,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.content,
  });
  @override
  State<NewsDetail> createState() {
    return _NewsDetailState();
  }
}

class _NewsDetailState extends State<NewsDetail> {
  Future<void> addOrRemoveNews(
    String sourceName,
    String authorName,
    String title,
    String description,
    String imgUrl,
    String content,
  ) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final ref = FirebaseDatabase.instance.ref('news/$uid');

    final snapshot = await ref.get();
    bool alreadyExists = false;

    if (snapshot.exists) {
      final data = snapshot.value as Map;
      for (var key in data.keys) {
        if (data[key]['title'] == title) {
          alreadyExists = true;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("News Already Present")));
          break;
        }
      }
    }

    if (!alreadyExists) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("News Added ")));
      await ref.push().set({
        'source': sourceName,
        'author': authorName,
        'title': title,
        'description': description,
        'imgUrl': imgUrl,
        'content': content,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF111A22),
        actions: [
          IconButton(
            onPressed: () async {
              await addOrRemoveNews(
                widget.sourceName,
                widget.authorName,
                widget.title,
                widget.description,
                widget.imgUrl,
                widget.content,
              );
            },
            icon: Icon(Icons.favorite, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Color(0xFF111A22),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  widget.imgUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, color: Colors.grey);
                  },
                ),
                Positioned(
                  left: 12,
                  bottom: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.75),
                          Colors.black.withOpacity(0.35),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      widget.sourceName.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              widget.title,
              style: GoogleFonts.merriweather(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.6),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/user.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  widget.authorName,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color(0xFF233648),
                    thickness: 1,
                    endIndent: 0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.description,
                style: GoogleFonts.lato(
                  fontSize: 19.5,
                  height: 1.6,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade100,
                ),
              ),
            ),

            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.content,
                style: GoogleFonts.merriweather(
                  fontSize: 15.5,
                  height: 1.75,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
