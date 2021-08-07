class UserMetrics {
  int followersCount;
  int followingCount;
  int tweetCount;
  int listedCount;

  UserMetrics.fromJson(Map<String, dynamic> json) {
    followersCount = json['followers_count'];
    followingCount = json['following_count'];
    tweetCount = json['tweet_count'];
    listedCount = json['listed_count'];
  }
}
