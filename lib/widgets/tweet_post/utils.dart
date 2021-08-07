import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:twitter_clone/models/tweet.dart';
import 'package:twitter_clone/widgets/avatar/avatar.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget userThumbnail(BuildContext context, {String image, double size = 45}) {
  return Container(
    height: size ?? 45,
    child: Avatar(
        radius: 100,
        image: Image.network(
          image,
          fit: BoxFit.cover,
          width: size ?? 45,
        )),
  );
}

Widget iconLabel(BuildContext context, {IconData icon, String label}) {
  return Row(
    children: [
      Icon(icon, size: 18, color: Theme.of(context).accentColor),
      SizedBox(
        width: 2,
      ),
      if (label != null && label != '0')
        Text(
          label,
          style: GoogleFonts.ubuntu(
              fontSize: 13, color: Theme.of(context).accentColor),
        )
    ],
  );
}

Widget renderSubDetails(BuildContext context, {Tweet tweet}) {
  return Container(
      width: 50,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (tweet.type == TweetType.retweet ||
                  tweet.type == TweetType.like)
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    tweet.type == TweetType.like
                        ? Ionicons.heart
                        : Ionicons.git_compare_outline,
                    size: 18,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              SizedBox(
                height: 5,
              ),
              userThumbnail(context, image: tweet.author.profileImageUrl),
            ],
          ),
          if (tweet.thread ?? false)
            Expanded(
                child: Stack(
              children: [
                VerticalDivider(
                  color: Theme.of(context).accentColor,
                  thickness: 1,
                  width: 50,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: userThumbnail(context,
                        image: tweet.userImage, size: 30)),
              ],
            ))
        ],
      ));
}

Widget renderName(BuildContext context,
    {Tweet tweet, bool withChevron = true, double width}) {
  String timeAgo =
      timeago.format(tweet.createdAt, locale: 'en_short').replaceAll(' ', '');
  return Container(
    width: width ?? MediaQuery.of(context).size.width,
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tweet.author.name,
          maxLines: 1,
          style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w500, color: Theme.of(context).focusColor),
        ),
        Expanded(
          child: Text(
            ' @${tweet.author.username}',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GoogleFonts.ubuntu(color: Theme.of(context).accentColor),
          ),
        ),
        Text(timeAgo,
            style: GoogleFonts.ubuntu(color: Theme.of(context).accentColor)),
        // if (withChevron)
        //   Icon(
        //     Ionicons.chevron_down,
        //     size: 20,
        //     color: Theme.of(context).accentColor,
        //   )
      ],
    ),
  );
}

TextSpan generateTextSpan(int index, List<String> words, BuildContext context) {
  List<String> additional = [];
  // if (words[index][0] == '#' && words[index].split('#').length > 1)
  // additional = words[index].split('#')..removeAt(0);

  if (words[index].trim() == '&amp;') words[index] = '&';
  return TextSpan(
      text: '${index > 0 ? ' ' : ''}${words[index]} ',
      style: GoogleFonts.ubuntu(
          color:
              words[index] != '' && ['#', '\$', '@'].contains(words[index][0])
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).focusColor),
      children: index == words.length - 1
          ? []
          : [
              generateTextSpan(index + 1, [...additional, ...words], context)
            ]);
}

Widget renderMessage(BuildContext context, {Tweet tweet}) {
  return RichText(text: generateTextSpan(0, tweet.text.split(' '), context));
}

Widget renderQoutedtweet(BuildContext context, {Tweet tweet}) {
  return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).focusColor, width: 0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 20,
                  child: userThumbnail(
                    context,
                    image: tweet.mentionedTweet.author.profileImageUrl,
                    size: 20,
                  )),
              SizedBox(
                width: 5,
              ),
              renderName(context,
                  tweet: tweet.mentionedTweet,
                  withChevron: false,
                  width: MediaQuery.of(context).size.width - 150),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          renderMessage(context, tweet: tweet.mentionedTweet)
        ],
      ));
}

Widget renderShowThread(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Text('Show this thread',
        style: GoogleFonts.ubuntu(color: Theme.of(context).primaryColor)),
  );
}

Widget controls(BuildContext context, {Tweet tweet}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      iconLabel(context,
          icon: Ionicons.chatbubble_outline,
          label: tweet.metrics.replyCount.toString() ?? ''),
      iconLabel(context,
          icon: Ionicons.git_compare_outline,
          label: tweet.metrics.retweetCount.toString() ?? ''),
      iconLabel(context,
          icon: Ionicons.heart_outline,
          label: tweet.metrics.likeCount.toString() ?? ''),
      iconLabel(context, icon: Ionicons.share_outline),
    ],
  );
}

Widget renderMedia(BuildContext context, {Tweet tweet}) {
  String url = tweet.mediaKeys?.first?.url;
  if (url == null) return SizedBox();
  return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Image.network(tweet.mediaKeys?.first?.url));
}
