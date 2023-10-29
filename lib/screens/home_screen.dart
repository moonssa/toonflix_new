import 'package:flutter/material.dart';
import 'package:toonflix_new/models/webtoon_model.dart';
import 'package:toonflix_new/services/api_services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("오늘의 웹툰",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              )),
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          elevation: 1,
        ),
        body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Text("There is Data!!");
            }
            return const Text("Loading.....");
          },
        ));
  }
}
