import 'dart:convert';

import 'package:http/http.dart' as http;

class AnimePart {
  String id;
  String title;
  String imageUrl;

  AnimePart({
    required this.id,
    required this.title,
    required this.imageUrl,
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
    String title = val['title']['romaji'];
    if (val['title']['english'] != null) {
      title = val['title']['english'];
    }

    availableAnime.add(
      AnimePart(
        id: val['id'].toString(),
        title: title,
        imageUrl: val['coverImage']['large'],
      ),
    );
  }
}