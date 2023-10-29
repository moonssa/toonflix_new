class WebtoonModel {
  final String title, thumb, id;

  // 생성자 초기화 방법 예시 . named constructor parameter
  WebtoonModel({
    required this.title,
    required this.thumb,
    required this.id,
  });

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
