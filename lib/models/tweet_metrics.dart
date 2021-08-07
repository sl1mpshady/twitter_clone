class TweetMetrics {
  int retweetCount;
  int replyCount;
  int likeCount;
  int quoteCount;

  TweetMetrics();

  TweetMetrics.fromJson(Map<String, dynamic> json) {
    retweetCount = json['retweet_count'];
    replyCount = json['reply_count'];
    likeCount = json['like_count'];
    quoteCount = json['quote_count'];
  }
}
