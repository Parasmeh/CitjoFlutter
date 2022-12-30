// Dart Imports
import 'dart:async';
import 'dart:math';

// Amplify Imports
import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/Post.dart';
import '../models/PostType.dart';
import '../models/User.dart';
import '../stores/userStore.dart';

class QueryRepositoryLive {
  StreamSubscription<QuerySnapshot<Post>>? _postStream;
  StreamSubscription<QuerySnapshot<User>>? _userStream;

  bool _isSynced = false;
  List<Post> _posts = [];
  List<User> _users = [];
  bool _loading = false;

  // observes Posts snapshots in real time
  List<Post> observePost() {
    print('observePost');
    _postStream = Amplify.DataStore.observeQuery(
      Post.classType,
      sortBy: [Post.CREATEDON.descending()],
    ).listen((QuerySnapshot<Post> snapshot) {
      _posts = snapshot.items;
      _isSynced = snapshot.isSynced;
    });
    return _posts;
  }

  // fetches all the posts sorted by likes and createdOn datetime from Amplify DataStore
  Future<List<Post>> queryAllTrendingPosts() async {
    print("Inside query All Trending Posts");
    _postStream = Amplify.DataStore.observeQuery(Post.classType,
            sortBy: [Post.LIKES.descending(), Post.CREATEDON.descending()])
        .listen((QuerySnapshot<Post> snapshot) {
      _posts = snapshot.items;
      _isSynced = snapshot.isSynced;
    });
    print("All Trending Posts Query Successful");
    return _posts;
  }

  //fetches all the posts from Amplify DataStore based on the userId
  Future<List<Post>> queryAllSubscribedPosts() async {
    print("Inside All Subscribed Posts");
    User user = UserStore().currUser;
    _postStream = Amplify.DataStore.observeQuery(Post.classType,
            sortBy: [Post.CREATEDON.descending()])
        .listen((QuerySnapshot<Post> snapshot) {
      _posts = snapshot.items;
      _isSynced = snapshot.isSynced;
    });
    List<Post> subscribedPosts = [];
    for (var post in _posts) {
      if (user.subscribed!.contains(post.userID)) {
        subscribedPosts.add(post);
      }
    }
    print("All Subscribed Post Query Successful");
    print(subscribedPosts);
    return subscribedPosts;
  }

  // fetches all posts from nearby location within 50km radius from Amplify DataStore
  Future<List<Post>> getAllLocationPosts() async {
    print("Inside getAllPosts");
    List<Post> nearbyPosts = [];
    _postStream = Amplify.DataStore.observeQuery(Post.classType)
        .listen((QuerySnapshot<Post> snapshot) {
      _posts = snapshot.items;
      _isSynced = snapshot.isSynced;
    });
    User user = UserStore().currUser;
    for (Post post in _posts) {
      print('Post"s Location: ${post.location}');
      print(user.location);
      // final String location = UserStore().currUser.location!;
      double userLat = double.parse(user.location!.split(",")[0]);
      double userLong = double.parse(user.location!.split(",")[1]);
      double postLat = double.parse(post.location!.split(",")[0]);
      double postLong = double.parse(post.location!.split(",")[1]);
      var distance = 0.5 -
          cos((userLat - postLat) * 0.017453292519943295) / 2 +
          cos(userLat * 0.017453292519943295) *
              cos(postLat * 0.017453292519943295) *
              (1 - cos((userLong - postLong) * 0.017453292519943295)) /
              2;

      if ((12742 * asin(sqrt(distance))) <= 50) {
        nearbyPosts.add(post);
      }
    }
    nearbyPosts = nearbyPosts.reversed.toList();
    return nearbyPosts;
  }

  //fetches all the video posts from Amplify DataStore - NO USAGES
  Future<List<Post>> queryAllVideoPosts() async {
    print("Inside query All Posts");
    _postStream = Amplify.DataStore.observeQuery(Post.classType,
            where: Post.POSTTYPE.eq(PostType.VIDEO),
            sortBy: [Post.CREATEDON.descending()])
        .listen((QuerySnapshot<Post> snapshot) {
      _posts = snapshot.items;
      _isSynced = snapshot.isSynced;
    });
    print("All Posts Query Successful");
    return _posts;
  }
}
