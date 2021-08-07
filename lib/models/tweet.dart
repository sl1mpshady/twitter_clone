import 'referenced_tweet.dart';
import 'tweet_metrics.dart';
import 'user.dart';
import 'media_key.dart';

enum TweetType { retweet, like, mentioned }

class Tweet {
  String userName;
  String userFullName;
  String message;
  String userImage;
  TweetType type;
  List<String> likedBy;
  int comments;
  int retweets;
  int likes;
  String subDetails;
  bool thread;

  String id;
  String text;
  TweetMetrics metrics;
  String source;
  List<ReferencedTweet> referencedTweets;
  String authorId;
  User author;
  Tweet retweetedTweet;
  Tweet mentionedTweet;
  List<MediaKey> mediaKeys;
  DateTime createdAt;

  Tweet(
      {this.userName,
      this.userFullName,
      this.message,
      this.userImage,
      this.type,
      this.likedBy,
      this.subDetails,
      this.comments = 0,
      this.retweets = 0,
      this.likes = 0,
      this.thread = false});

  Tweet.fromJson(Map<String, dynamic> json, Map<String, dynamic> inclusions) {
    List<dynamic> users = inclusions['users'];

    id = json['id'];
    text = json['text'];
    metrics = TweetMetrics.fromJson(json['public_metrics']);
    source = json['source'];
    referencedTweets = json['referenced_tweets'] != null
        ? (json['referenced_tweets'] as List)
            .map((refTweet) => ReferencedTweet.fromJson(refTweet))
            .toList()
        : [];
    authorId = json['author_id'];
    author = User.fromJson(users.where((user) => user['id'] == authorId).first);

    if (referencedTweets != null && referencedTweets.isNotEmpty) {
      switch (referencedTweets.first.type) {
        case 'retweeted':
          type = TweetType.retweet;
          break;
        case 'quoted':
          type = TweetType.mentioned;
          break;
        case 'liked':
          type = TweetType.like;
          break;
        default:
      }
    }

    if (type == TweetType.retweet || type == TweetType.mentioned) {
      List<dynamic> tweets = inclusions['tweets'];

      Tweet referenceTweet = Tweet.fromJson(
          tweets.firstWhere((includedTweet) =>
              includedTweet['id'] == referencedTweets.first.id),
          inclusions);

      type == TweetType.retweet
          ? retweetedTweet = referenceTweet
          : mentionedTweet = referenceTweet;
    }

    if (json['attachments'] != null &&
        json['attachments']['media_keys'] != null &&
        (json['attachments']['media_keys'] as List).isNotEmpty) {
      mediaKeys = (json['attachments']['media_keys'] as List).map((media) {
        var foundMedias = (inclusions['media'] as List)
            .where((includedMedia) => includedMedia['media_key'] == media)
            .toList();

        if (foundMedias != null && foundMedias.isNotEmpty)
          return MediaKey.fromJson(foundMedias.first);
      }).toList();
    } else
      mediaKeys = [];

    createdAt = DateTime.parse(json['created_at']);

    subDetails = type == TweetType.retweet ? '${author.name} Retweeted' : '';
  }
}
