import 'dart:convert';

import 'package:http/http.dart' as http;

class AnimeCharacterPart {
  String id;
  String name;
  String imageUrl;
  String animeTitle;

  AnimeCharacterPart({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.animeTitle,
  });
}

List<AnimeCharacterPart> availableCharacters = [];

Future<void> loadAnimeCharacterParts() async {
  availableCharacters = [];

  String query = ''' 
  query {
    Page(page: 1, perPage: 50) {
      characters(sort: FAVOURITES_DESC) {
        id
        name {
          full
        }
        image {
          large
        }
         media(perPage: 1) {
          nodes {
            title {
              romaji
              english
            }
          }
        }
      }
    }
  }''';

  Uri url = Uri.parse('https://graphql.anilist.co');
  http.Response response;

  try {
    response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'query': query}),
    );
  } catch (e) {
    return;
  }

  if (response.statusCode != 200) return;
  Map<String, dynamic> body = jsonDecode(response.body);
  List<dynamic> data = body['data']['Page']['characters'];

    for (var val in data) {
     String imageUrl = val['image']['large'];
    if (imageUrl.contains('default')) continue;

    String animeTitle = '';
    List<dynamic> nodes = val['media']['nodes'];
    if (nodes.isNotEmpty) {
      animeTitle = nodes[0]['title']['romaji'];
      if (nodes[0]['title']['english'] != null) {
        animeTitle = nodes[0]['title']['english'];
      }
    }

    availableCharacters.add(
      AnimeCharacterPart(
        id: val['id'].toString(),
        name: val['name']['full'],
        imageUrl: imageUrl,
        animeTitle: animeTitle,
      ),
    );
  }
}