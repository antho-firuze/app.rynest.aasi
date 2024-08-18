class Message {
  Message({
    this.id,
    required this.title,
    required this.body,
    this.icon,
    this.image,
    this.topic,
    this.createdAt,
  });

  int? id;
  String title;
  String body;
  String? icon;
  String? image;
  String? topic;
  DateTime? createdAt;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json['id'] is String ? int.parse(json['id']) : json['id'],
        title: json['title'],
        body: json['body'],
        icon: json['icon'],
        image: json['image'],
        topic: json['topic'],
        createdAt: DateTime.parse(json["created_at"]),
      );

  static List<Message>? fromJsonList(List jsonList) =>
      jsonList.map((item) => Message.fromJson(item)).toList();

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "icon": icon,
        "image": image,
        "topic": topic,
      };

  Map<String, dynamic> toJsonNotification() => {
        "title": title,
        "body": body,
        "icon": icon ?? "ic_launcher",
        "image": image,
      };
}
