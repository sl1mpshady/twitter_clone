class MediaKey {
  String mediaKey;
  String type;
  String url;

  MediaKey.fromJson(Map<String, dynamic> json) {
    mediaKey = json['media_key'];
    type = json['type'];
    url = json['url'];
  }
}
