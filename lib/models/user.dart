import 'user_metrics.dart';

class User {
  String id;
  String createdAt;
  String description;
  String username;
  String profileImageUrl;
  String url;
  bool protected;
  String name;
  bool verified;
  UserMetrics userMetrics;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    description = json['description'];
    username = json['username'];
    profileImageUrl = json['profile_image_url'];
    url = json['url'];
    protected = json['protected'];
    name = json['name'];
    verified = json['verified'];
    userMetrics = UserMetrics.fromJson(json['public_metrics']);
  }
}
