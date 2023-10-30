import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix_new/models/webtoon_detail_model.dart';
import 'package:toonflix_new/models/webtoon_episode_model.dart';
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

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseurl/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    final url = Uri.parse("$baseurl/$id/episodes");
    final response = await http.get(url);
    List<WebtoonEpisodeModel> episodes = [];

    if (response.statusCode == 200) {
      final List<dynamic> webtoonEpisodes = jsonDecode(response.body);
      for (var webtoonEpisode in webtoonEpisodes) {
        final episode = WebtoonEpisodeModel.fromJson(webtoonEpisode);
        episodes.add(episode);
      }
      return episodes;
    }
    throw Error();
  }
}
