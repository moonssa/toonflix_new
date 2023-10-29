import 'package:flutter/material.dart';
import 'package:toonflix_new/models/webtoon_model.dart';
import 'package:toonflix_new/services/api_services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();
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
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var webtoon = snapshot.data![index];
                  return Text(webtoon.title);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 20),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
