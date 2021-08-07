import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import 'package:twitter_clone/models/tweet.dart';

import 'utils.dart';

class TweetPost extends StatefulWidget {
  TweetPost({Key key, this.tweet}) : super(key: key);

  final Tweet tweet;

  @override
  _TweetPostState createState() => _TweetPostState(tweet: this.tweet);
}

class _TweetPostState extends State<TweetPost> {
  Tweet tweet;
  _TweetPostState({this.tweet});

  @override
  Widget build(BuildContext context) {
    Tweet finalTweet =
        tweet.retweetedTweet == null ? tweet : tweet.retweetedTweet;

    finalTweet
      ..subDetails = tweet.subDetails
      ..type = tweet.type;

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Theme.of(context).dividerColor, width: 0.1))),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            renderSubDetails(context, tweet: finalTweet),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (tweet.type == TweetType.retweet ||
                      tweet.type == TweetType.like)
                    Text(
                      tweet.subDetails ?? '',
                      style: GoogleFonts.ubuntu(
                          fontSize: 12, color: Theme.of(context).accentColor),
                    ),
                  SizedBox(
                    height: 5,
                  ),
                  renderName(context, tweet: finalTweet),
                  SizedBox(
                    height: 5,
                  ),
                  renderMessage(context, tweet: finalTweet),
                  if (finalTweet.mentionedTweet != null)
                    renderQoutedtweet(context, tweet: finalTweet),
                  SizedBox(
                    height: 8,
                  ),
                  if (finalTweet.mediaKeys.isNotEmpty) ...[
                    renderMedia(context, tweet: finalTweet),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: (tweet.thread ?? false) ? 20 : 5),
                    child: controls(context, tweet: tweet),
                  ),
                  if (tweet.thread ?? false) renderShowThread(context)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
