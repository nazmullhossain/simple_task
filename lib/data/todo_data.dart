class TodoData {
  final String? title;
  final String? subtitle;
  bool isDone=false;

  TodoData({this.title, this.subtitle,required this.isDone});
  TodoData copyWith({String? title, String? subtitle, bool? isDone}) {
    return TodoData(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toJson() {
    return {"title": title, "subtitle": subtitle, "isDone": isDone};
  }

  @override
  String toString() {
    return '''TodoData:{
      title:$title\n
      subtitle: $subtitle\n
      isDone:$isDone\n
      
      
  }''';
  }

  factory TodoData.fromJson(Map<String, dynamic> json) {
    return TodoData(
        title: json["title"],
        subtitle: json["subtitle"],
        isDone: json["isDone"]);
  }
}
