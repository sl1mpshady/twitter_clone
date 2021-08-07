import 'api.dart';
import '../models/tweet.dart';

class Tweets {
  static Future<List<Tweet>> fetchTweets() async {
    Map<String, dynamic> data = await API.get(
        'https://api.twitter.com/2/users/1572616332/tweets?max_results=100&tweet.fields=created_at,public_metrics,attachments,author_id,lang,source,text&expansions=attachments.poll_ids,attachments.media_keys,author_id,geo.place_id,in_reply_to_user_id,referenced_tweets.id,entities.mentions.username,referenced_tweets.id.author_id&user.fields=created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified&media.fields=preview_image_url,url');

    return (data['data'] as List)
        .map((tweet) => Tweet.fromJson(tweet, data['includes']))
        .toList();
  }
}
