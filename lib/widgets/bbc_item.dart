import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BbcItem extends StatelessWidget {
  final String title;
  final String url;
  final String sourceName;
  final void Function() onSelect;
  final int index;
  const BbcItem({
    super.key,
    required this.title,
    required this.url,
    required this.sourceName,
    required this.onSelect,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      splashColor: Colors.white24,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    sourceName,
                    style: GoogleFonts.lato(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 12),

            Hero(
              tag: 'news-image$index',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  url,
                  height: 80,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
