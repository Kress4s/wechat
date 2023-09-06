import 'dart:convert';

List<CircleFriendInfo> circleFriendFromJson(String str) =>
    List<CircleFriendInfo>.from(
        json.decode(str).map((v) => CircleFriendInfo.fromJson(v)));

class CircleFriendInfo {
  late int id;
  late String name;
  late int publisherID;
  late String avatar;
  late String content;
  late List images;
  late List likes;
  late int type;
  late String createAt;

  CircleFriendInfo(
      {required this.id,
      required this.name,
      required this.publisherID,
      required this.avatar,
      required this.content,
      required this.images,
      required this.likes,
      required this.type,
      required this.createAt});

  factory CircleFriendInfo.fromJson(Map<String, dynamic> json) =>
      CircleFriendInfo(
        id: json["id"],
        name: json["name"],
        publisherID: json["publisher_id"],
        avatar: json["avatar"],
        content: json["content"],
        images: json["images"],
        likes: json["likes"] ?? Null,
        type: json["type"],
        createAt: json["create_at"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "publisher_id": publisherID,
        "avatar": avatar,
        "content": content,
        "images": images,
        "likes": likes,
        "type": type,
        "create_at": createAt,
      };
}
