import 'package:flutter/material.dart';

import 'package:twitter_clone/widgets/tweet_post/tweet_post.dart';

import 'package:twitter_clone/models/tweet.dart';
import 'package:twitter_clone/widgets/app_bar/app_bar.dart';

import 'package:twitter_clone/services/tweets.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Tweet> tweets1 = [];

  @override
  void initState() {
    Tweets.fetchTweets().then((result) => setState(() {
          tweets1 = result;
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: ApplicationBar(),
      body: Container(
          child: tweets1.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: tweets1.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          bottom: index == tweets1.length - 1 ? 100 : 0),
                      child: TweetPost(
                        tweet: tweets1[index],
                      ),
                    );
                  })),
    );
  }
}
