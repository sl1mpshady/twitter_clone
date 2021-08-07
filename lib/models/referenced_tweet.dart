class ReferencedTweet {
  String type;
  String id;

  ReferencedTweet();

  ReferencedTweet.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
  }
}
