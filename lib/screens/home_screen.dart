import 'package:flutter/material.dart';
import '../services/anime_api_service.dart';
import '../widgets/anime_card.dart';
import '../models/anime.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Anime>> _animeFuture;

  @override
  void initState() {
    super.initState();
    _animeFuture = AnimeApiService.fetchAnimeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Anime>>(
        future: _animeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Ошибка загрузки',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Нет данных',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final animeList = snapshot.data!;

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: animeList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              return AnimeCard(anime: animeList[index]);
            },
          );
        },
      ),
    );
  }
}
