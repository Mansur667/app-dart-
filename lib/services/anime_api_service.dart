import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/anime.dart';

class AnimeApiService {
  static const String _url = 'https://graphql.anilist.co';

  static Future<List<Anime>> fetchAnimeList() async {
    const query = '''
    query {
      Page(perPage: 20) {
        media(type: ANIME, sort: POPULARITY_DESC) {
          title {
            romaji
          }
          coverImage {
            large
          }
          averageScore
          genres
          description
        }
      }
    }
    ''';

    final response = await http.post(
      Uri.parse(_url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'query': query}),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List data = decoded['data']['Page']['media'];
      return data.map((e) => Anime.fromAniList(e)).toList();
    } else {
      throw Exception('AniList API Error');
    }
  }
}
