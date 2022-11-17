// Dart Imports
import 'dart:async';

// Flutter Imports
import 'package:flutter/material.dart';

// Model Imports

// Amplify Imports
import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/Post.dart';
import '../models/User.dart';

class SearchRepository {
  StreamSubscription<QuerySnapshot<Post>>? _postStream;
  StreamSubscription<QuerySnapshot<User>>? _userStream;
  bool _isSynced = false;
  List<Post> _posts = [];
  List<User> _users = [];
  bool _loading = false;

  // fetches all top posts from Amplify DataStore for search screen
  List<Post> searchAndReturnTopPosts(String searchText) {
    // print("Inside Search And Return Top Posts");
    _postStream = Amplify.DataStore.observeQuery(Post.classType,
            where: Post.DESC.contains(searchText),
            sortBy: [Post.LIKES.descending()])
        .listen((QuerySnapshot<Post> snapshot) {
      _posts = snapshot.items;
      _isSynced = snapshot.isSynced;
    });
    return _posts;
  }

  // fetches all latest posts from Amplify DataStore for search screen
  List<Post> searchAndReturnLatestPosts(String searchText) {
    // print("Inside Search And Return Latest Posts");
    _postStream = Amplify.DataStore.observeQuery(Post.classType,
            where: Post.DESC.contains(searchText),
            sortBy: [Post.CREATEDON.descending()])
        .listen((QuerySnapshot<Post> snapshot) {
      _posts = snapshot.items;
      _isSynced = snapshot.isSynced;
    });
    return _posts;
  }

  // fetches all users from Amplify DataStore for search screen
  List<User> searchAndReturnUsers(String searchText) {
    // print("Inside Search And Return Users");
    _userStream = Amplify.DataStore.observeQuery(
      User.classType,
      where: User.USERNAME.contains(searchText),
    ).listen((QuerySnapshot<User> snapshot) {
      _users = snapshot.items;
      _isSynced = snapshot.isSynced;
    });
    // print(_users.length);
    return _users;
  }
}
