import 'package:flutter/material.dart';
import '../models/anime.dart';

class DetailScreen extends StatelessWidget {
  final Anime anime;

  const DetailScreen({
    super.key,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // POSTER
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                anime.image,
                height: 260,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            // TITLE
            Text(
              anime.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // RATING
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Text(anime.rating.toString()),
              ],
            ),

            const SizedBox(height: 12),

            // GENRES
            Wrap(
              spacing: 8,
              children: anime.genres
                  .map(
                    (g) => Chip(
                      label: Text(g),
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 16),

            // DESCRIPTION
            Text(
              anime.description,
              style: TextStyle(color: Colors.grey.shade400),
            ),

            const SizedBox(height: 24),

            // WATCH BUTTON
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Watch"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 