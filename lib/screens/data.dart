import 'package:flutter/material.dart';
import 'package:twitter_clone/models/tweet.dart';

List<Tweet> tweets = [
  Tweet(
      userImage: 'assets/images/xKgTpvdh_400x400.jpeg',
      userName: '@craig_love',
      userFullName: 'Martha Craig',
      message:
          'UXR/UX: You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring?',
      type: TweetType.like,
      subDetails: 'Kieron Dotson and Zack John liked',
      comments: 28,
      retweets: 5,
      likes: 21,
      thread: true),
  Tweet(
      userImage: 'assets/images/user-1.png',
      userName: '@maxjacobson',
      userFullName: 'Maximmilian',
      message: "Y'all ready for the next post?",
      type: TweetType.like,
      subDetails: 'Zack John liked',
      comments: 46,
      retweets: 18,
      likes: 363),
  Tweet(
      userImage: 'assets/images/user-2.png',
      userName: '@mis_potter',
      userFullName: 'Tabitha Potter',
      message:
          "Kobe's passing is really sticking w/ me in a way I didn't expect.\n\nHe was an icon, the kind of person who wouldn't die this way. My wife compared it to Princess Di's accident",
      type: TweetType.retweet,
      subDetails: 'Kieron Dotson Retweeted',
      likedBy: ['Zack John'],
      comments: 7,
      retweets: 1,
      likes: 11),
  Tweet(
      userImage: 'assets/images/user-3.png',
      userName: '@karennne',
      userFullName: 'karennne',
      message:
          "Name a show where the lead character is the worst character on the show I'll go  with Sabrina Spellman",
      type: TweetType.like,
      subDetails: 'Zack John liked',
      comments: 1906,
      retweets: 1249,
      likes: 7461),
  Tweet(
      userImage: 'assets/images/xKgTpvdh_400x400.jpeg',
      userName: '@craig_love',
      userFullName: 'Martha Craig',
      message:
          'UXR/UX: You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring?',
      type: TweetType.like,
      subDetails: 'Kieron Dotson and Zack John liked',
      comments: 28,
      retweets: 5,
      likes: 21,
      thread: true),
  Tweet(
      userImage: 'assets/images/user-1.png',
      userName: '@maxjacobson',
      userFullName: 'Maximmilian',
      message: "Y'all ready for the next post?",
      type: TweetType.like,
      subDetails: 'Zack John liked',
      comments: 46,
      retweets: 18,
      likes: 363),
  Tweet(
      userImage: 'assets/images/user-2.png',
      userName: '@mis_potter',
      userFullName: 'Tabitha Potter',
      message:
          "Kobe's passing is really sticking w/ me in a way I didn't expect.\n\nHe was an icon, the kind of person who wouldn't die this way. My wife compared it to Princess Di's accident",
      type: TweetType.retweet,
      subDetails: 'Kieron Dotson Retweeted',
      likedBy: ['Zack John'],
      comments: 7,
      retweets: 1,
      likes: 11),
  Tweet(
      userImage: 'assets/images/user-3.png',
      userName: '@karennne',
      userFullName: 'karennne',
      message:
          "Name a show where the lead character is the worst character on the show I'll go  with Sabrina Spellman",
      type: TweetType.like,
      subDetails: 'Zack John liked',
      comments: 1906,
      retweets: 1249,
      likes: 7461),
];
