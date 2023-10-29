import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix_new/models/webtoon_model.dart';

class ApiService {
  static const String baseurl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('$baseurl/$today');
    final response = await http.get(url);
    List<WebtoonModel> toons = [];

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final toon = WebtoonModel.fromJson(webtoon);
        toons.add(toon);
      }
      return toons;
    }
    throw Error();
  }
}
