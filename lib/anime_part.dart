import 'dart:convert';

import 'package:http/http.dart' as http;

class AnimePart {
  String id;
  String title;
  String imageUrl;
  String description;
  int episodes;

  AnimePart({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.episodes,
  });
}

List<AnimePart> availableAnime = [];

Future<void> loadAnimeParts() async {
  availableAnime = [];

  String query = '''
  query {
    Page(page: 1, perPage: 50) {
      media(type: ANIME, sort: POPULARITY_DESC, isAdult: false) {
        id
        title {
          romaji
          english
        }
        coverImage {
          large
        }
        description(asHtml: false)
        episodes
      }
    }
  }
  ''';

  Uri url = Uri.parse('https://graphql.anilist.co');
  http.Response response;

  try {
    response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'query': query}),
    );
  } catch (error) {
    return;
  }

  if (response.statusCode != 200) {
    return;
  }

  Map<String, dynamic> body = jsonDecode(response.body);
  List<dynamic> data = body['data']['Page']['media'];

  for (var val in data) {
    String romajiTitle = val['title']['romaji'];
    String title = romajiTitle;
    if (val['title']['english'] != null) {
      title = val['title']['english'];
    }

    String description = '';
    if (val['description'] != null) {
      description = val['description'];
      description = description.replaceAll(RegExp(r'~!.*?!~', dotAll: true), '');
      description = description.replaceAll(RegExp(r'<[^>]*>'), ' ');
      description = description.replaceAll(RegExp(r'\(Source:[^)]*\)'), '');
      description = description.replaceAll(RegExp(r'\s+'), ' ').trim();
      description = description.replaceAll(romajiTitle, '_____');
      description = description.replaceAll(title, '_____');
      if (description.length > 250) {
        description = '${description.substring(0, 250)}...';      }
    }

    int episodes = 0;
    if (val['episodes'] != null) {
      episodes = val['episodes'];
    }

    availableAnime.add(
      AnimePart(
        id: val['id'].toString(),
        title: title,
        imageUrl: val['coverImage']['large'],
        description: description,
        episodes: episodes,
      ),
    );
  }
}