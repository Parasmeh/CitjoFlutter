// Dart Imports
import 'dart:async';
import 'dart:io';
import 'dart:math';

// Flutter Imports
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

// Model Imports

// Amplify Imports
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

import '../models/Post.dart';
import '../models/User.dart';
import '../stores/userStore.dart';

class QueryRepository {
  // update Likes of a post
  Future updateLikes(String postId) async {
    // print("Inside updateLikes");
    User user = UserStore().currUser;
    Post post = (await Amplify.DataStore.query(Post.classType,
        where: Post.ID.eq(postId)))[0];
    // print("Post Query Successful");
    List<String> likes = [];
    if (post.likes != null) {
      print(post.likes);
      likes.addAll(post.likes!);
      print(post.likes);
    }
    if (!likes.contains(user.id)) {
      print('Adding..........');
      likes.add(user.id);
    } else {
      print('Removing......');
      likes.remove(user.id);
    }
    await Amplify.DataStore.save(post.copyWith(likes: likes));
    await UserStore().queryLocalPosts();
  }

  // check if post is Liked by the user
  Future isLiked(String postId) async {
    bool isLiked = false;
    // print("Inside isLiked");
    User user = UserStore().currUser;
    Post post = (await Amplify.DataStore.query(Post.classType,
        where: Post.ID.eq(postId)))[0];
    // print("Post Query Successful");
    List<String> likes = [];
    if (post.likes != null) {
      likes.addAll(post.likes!);
      // print(likes);
    }
    if (likes.contains(user.id)) {
      isLiked = true;
    }
    return isLiked;
  }

  // update Saves of a post
  Future updateSaves(String postId) async {
    // print("Inside updateSaves");
    Post post = (await Amplify.DataStore.query(Post.classType,
        where: Post.ID.eq(postId)))[0];
    // print("Post Query Successful");
    User user = UserStore().currUser;
    // print("User Query Successful");
    List<String> postSaves = [];
    if (post.saves != null) {
      postSaves.addAll(post.saves!);
    }
    if (!postSaves.contains(user.id)) {
      postSaves.add(user.id);
    } else {
      postSaves.remove(user.id);
    }
    print(postSaves);
    List<String> userSaves = [];
    if (user.saves != null) {
      userSaves.addAll(user.saves!);
    }
    if (!userSaves.contains(postId)) {
      userSaves.add(postId);
    } else {
      userSaves.remove(postId);
    }
    // print(userSaves);
    await Amplify.DataStore.save(post.copyWith(saves: postSaves));
    // print("Post Saved");
    await Amplify.DataStore.save(user.copyWith(saves: userSaves));
    // print("User Saved");
  }

  // check if post is Saved by the user
  Future isSaved(String postId) async {
    bool isSaved = false;
    // print("Inside isSaved");
    User user = UserStore().currUser;
    Post post = (await Amplify.DataStore.query(Post.classType,
        where: Post.ID.eq(postId)))[0];
    // print("Post Query Successful");
    List<String> saves = [];
    if (post.saves != null) {
      saves.addAll(post.saves!);
    }
    // if (saves.contains(authUser.userId)) {
    if (saves.contains(user.id)) {
      isSaved = true;
    }
    return isSaved;
  }

  // query all saved posts for a user
  Future querySavedPosts() async {
    // print("Inside querySavedPosts");
    User user = UserStore().currUser;
    List<Post> posts = await Amplify.DataStore.query(Post.classType,
        where: Post.SAVES.contains(user.id));
    print("Post Query Successful");
    print(posts);
    return posts;
  }

  // fetches user for a specific post from Amplify DataStore
  Future<User> queryPostUser(String postUserId) async {
    // print("Inside query Post's User");
    User user = (await Amplify.DataStore.query(User.classType,
        where: User.ID.eq(postUserId)))[0];
    // print("Post's User Query Successful");
    return user;
  }

  //fetches all the posts from Amplify DataStore based on the userId
  Future<List<Post>> queryAllUserPosts(String userId) async {
    print("Inside All Single User Posts");
    List<Post> posts = await Amplify.DataStore.query(Post.classType,
        where: Post.USERID.eq(userId), sortBy: [Post.CREATEDON.descending()]);
    print("All Single User Posts Query Successful");
    return posts;
  }
}
