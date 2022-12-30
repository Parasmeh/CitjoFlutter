// Dart Imports
import 'dart:async';

// Amplify Imports
import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/Comment.dart';
import '../models/User.dart';
import '../stores/userStore.dart';

class CommentsRepository {
  StreamSubscription<QuerySnapshot<Comment>>? _commentStream;
  StreamSubscription<QuerySnapshot<User>>? _userStream;
  bool _isSynced = false;
  List<Comment> _comments = [];
  List<User> _users = [];
  bool _loading = false;

  // fetches all comments for a post from Amplify DataStore
  Future<List<Comment>> queryAllCommentsForPost(String postId) async {
    print("Inside query All Comments for a Post");
    _commentStream = Amplify.DataStore.observeQuery(Comment.classType,
            where: Comment.POSTID.eq(postId),
            sortBy: [Comment.CREATEDON.descending()])
        .listen((QuerySnapshot<Comment> snapshot) {
      _comments = snapshot.items;
      _isSynced = snapshot.isSynced;
    });
    print("Query for All Comments for a Post Successful");
    print("Comments are $_comments");
    return _comments;
  }

  // fetches user for specific comment from Amplify DataStore
  Future<User> queryCommentUser(String commentUserId) async {
    print("Inside query Comment's User");
    User commentUser = (await Amplify.DataStore.query(User.classType,
        where: User.ID.eq(commentUserId)))[0];
    print("Comment's User Query Successful");
    return commentUser;
  }

  // creates a new comment for a post in Amplify DataStore
  Future<bool> createComment(String postId, String commentText) async {
    print("Inside create Comment");
    _loading = true;
    try {
      User user = UserStore().currUser;
      print("User Query Successfull");
      print("User details $user");
      Comment comment = Comment(
          commentText: commentText,
          userId: user.id,
          postID: postId,
          likes: const [],
          createdOn: TemporalDateTime.now(),
          updatedOn: TemporalDateTime.now());
      print(comment);
      await Amplify.DataStore.save(comment);
      print("Creating comment Successful");
      _loading = false;
      return true;
    } catch (ex) {
      print("Inside Create Comment Catch");
      print(ex.toString());
      _loading = false;
      return false;
    }
  }

  // update Likes of a comment - NO USAGES
  Future updateLikes(String commentId) async {
    print("Inside updateLikes");
    User user = UserStore().currUser;
    _commentStream = Amplify.DataStore.observeQuery(Comment.classType,
            where: Comment.ID.eq(commentId))
        .listen((QuerySnapshot<Comment> snapshot) {
      _comments = snapshot.items;
      _isSynced = snapshot.isSynced;
    });
    print("Comment Query Successful");
    List<String> likes = [];
    if (_comments[0].likes != null) {
      print(_comments[0].likes);
      likes.addAll(_comments[0].likes!);
    }
    if (!likes.contains(user.id)) {
      likes.add(user.id);
      print(likes);
    } else {
      print(likes);
      likes.remove(user.id);
      print(likes);
    }
    await Amplify.DataStore.save(_comments[0].copyWith(likes: likes));
    print("Post Saved");
  }
}

// delete Comment from Amplify DataStore - NO USAGES
Future<void> deleteComment(String commentId) async {
  Comment comment = (await Amplify.DataStore.query(
    Comment.classType,
    where: Comment.ID.eq(commentId),
  ))[0];
  try {
    await Amplify.DataStore.delete(comment);
    print('Deleted comment');
  } on DataStoreException catch (e) {
    print('Delete failed: $e');
  }
}
