import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix_new/models/webtoon_model.dart';

class ApiService {
  final String baseurl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";
  List<WebtoonModel> toons = [];
  Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('$baseurl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        toons.add(WebtoonModel.fromJson(webtoon));
      }
      return toons;
    }
    throw Error();
  }
}
