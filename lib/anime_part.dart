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

  for (int page = 1; page <=2; page++) {

    Uri url = Uri.parse('https://api.jikan.moe/v4/top/anime?page=$page');
    http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      break;
    }

     Map<String, dynamic> body = jsonDecode(response.body);
     List<dynamic> data = body['data'];

     for (var val in data) {
      availableAnime.add(
        AnimePart(
          id: val['mal_id'].toString(),
          title: val['title'],
          imageUrl: val['images']['jpg']['image_url'],
        )
      );
     }

     await Future.delayed(Duration(seconds: 1));
  }
}