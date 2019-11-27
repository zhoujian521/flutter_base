class Article {
  final String title;
  final String content;

  Article({this.title, this.content});
  Article.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'];
  Map<String, dynamic> toJson() => {'title': title, 'email': content};
}