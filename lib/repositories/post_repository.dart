// Dart Imports
import 'dart:async';
import 'dart:io';

// Amplify Imports
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
// Flutter Imports
import 'package:uuid/uuid.dart';

import '../models/Post.dart';
import '../models/PostStatus.dart';
import '../models/PostType.dart';
import '../models/User.dart';
import '../stores/userStore.dart';

class PostRepository {
  String _postVideoKey = '';
  String _postThumbKey = '';
  String _postVideoUrl = '';
  String _postThumbUrl = '';
  bool _loading = false;

  // stores video in S3 bucket
  Future storeVideo(File videoFile) async {
    _loading = true;
    var uuid = Uuid().v1();
    Map<String, String> metadata = <String, String>{};
    metadata['name'] = "user_$uuid";
    metadata['desc'] = 'post video';
    //compress video

    // Prepare to upload Video to s3
    S3UploadFileOptions options = S3UploadFileOptions(
        accessLevel: StorageAccessLevel.guest, metadata: metadata);
    try {
      UploadFileResult result = await Amplify.Storage.uploadFile(
        key: "videos/$uuid.mp4",
        local: videoFile,
        options: options,
      );
      _postVideoKey = result.key;
      print("the key is $_postVideoKey");

      // Get url of the uploaded Video to display on the frontend
      _postVideoUrl =
          "https://d37h3jquy7xla8.cloudfront.net/public/$_postVideoKey";
      print(_postVideoUrl);
      _loading = false;
    } on StorageException catch (e) {
      print("error message is${e.message}");
      _loading = false;
    }
    return _postVideoUrl;
  }

  // stores video in S3 bucket
  Future storeThumb(File thumbFilePath) async {
    _loading = true;
    var uuid = Uuid().v1();
    Map<String, String> metadata = <String, String>{};
    metadata['name'] = "user_$uuid";
    metadata['desc'] = 'post thumb';

    // Prepare to upload thumb to s3
    S3UploadFileOptions options = S3UploadFileOptions(
        accessLevel: StorageAccessLevel.guest, metadata: metadata);
    try {
      UploadFileResult result = await Amplify.Storage.uploadFile(
        key: "thumbs/$uuid.jpg",
        local: thumbFilePath,
        options: options,
      );
      _postThumbKey = result.key;
      print("the key is $_postThumbKey");

      // Get url of the uploaded Thumb to display on the frontend
      _postThumbUrl =
          "https://d37h3jquy7xla8.cloudfront.net/public/$_postThumbKey";
      print(_postThumbUrl);
      _loading = false;
    } on StorageException catch (e) {
      print("error message is${e.message}");
      _loading = false;
    }
    return _postThumbUrl;
  }

  // creates New Video Post only if a user is of Type Publisher
  Future<bool> createVideoPost(
      {required String desc,
      required String postVideoUrl,
      required String thumbUrl,
      required String tags,
      required String location,
      required List<String> categories,
      required bool allowComments}) async {
    print("Inside createVideoPost");
    _loading = true;
    try {
      User user = UserStore().currUser;
      print("User Query Successful");
      print(user.id);
      Post post = Post(
        desc: desc,
        postType: PostType.VIDEO,
        postStatus: PostStatus.CREATED,
        userID: user.id,
        postVideoUrl: postVideoUrl,
        postVoiceUrl: '',
        postThumbUrl: thumbUrl,
        tags: tags,
        category: categories,
        location: location,
        Reports: const [],
        Comments: const [],
        likes: const [],
        saves: const [],
        allowComments: allowComments,
        createdOn: TemporalDateTime.now(),
        updatedOn: TemporalDateTime.now(),
        // PostBelongToUser: user,
      );
      await Amplify.DataStore.save(post);
      print("New Video Post Saved");
      _loading = false;
      return true;
    } catch (ex) {
      print("Inside Video Post Else");
      print(ex.toString());
      _loading = false;
      return false;
    }
  }

  //creates New Article Post - NO USAGES
  Future<bool> createArticlePost(
      {required String desc,
      required String tags,
      required String location,
      required List<String> categories,
      required bool allowComments}) async {
    print("Inside createArticlePost");
    _loading = true;
    try {
      User user = UserStore().currUser;
      // print("User Query Successful");
      // print("User details ${user}");
      Post post = Post(
          desc: desc,
          postType: PostType.ARTICLE,
          postStatus: PostStatus.CREATED,
          userID: user.id,
          postVideoUrl: '',
          postVoiceUrl: '',
          postThumbUrl: '',
          tags: tags,
          category: categories,
          location: location,
          Reports: const [],
          Comments: const [],
          likes: const [],
          saves: const [],
          allowComments: allowComments,
          createdOn: TemporalDateTime.now(),
          updatedOn: TemporalDateTime.now());
      await Amplify.DataStore.save(post);
      print("Article Post Saved");
      _loading = false;
      return true;
    } catch (ex) {
      print("Inside Article Post Else");
      print(ex.toString());
      _loading = false;
      return false;
    }
  }

  // creates New RePost - NO USAGES
  Future<bool> createRePost({required String desc}) async {
    print("Inside createRePost");
    _loading = true;
    try {
      User user = UserStore().currUser;
      // print("User Query Successful");
      // print("User details $_users");
      Post post = Post(
          desc: desc,
          postType: PostType.REPOST,
          postStatus: PostStatus.CREATED,
          userID: user.id,
          postVideoUrl: '',
          postVoiceUrl: '',
          postThumbUrl: '',
          tags: '',
          category: const [],
          location: "",
          Reports: const [],
          Comments: const [],
          likes: const [],
          saves: const [],
          allowComments: true,
          createdOn: TemporalDateTime.now(),
          updatedOn: TemporalDateTime.now());
      await Amplify.DataStore.save(post);
      print("Article Post Saved");
      _loading = false;
      return true;
    } catch (ex) {
      print("Inside Article Post Else");
      print(ex.toString());
      _loading = false;
      return false;
    }
  }

  // delete post from Amplify DataStore
  Future<void> deletePost(String postId) async {
    Post post = (await Amplify.DataStore.query(
      Post.classType,
      where: Post.ID.eq(postId),
    ))[0];
    try {
      User user = UserStore().currUser;
      Post post = Post(
          postStatus: PostStatus.DELETED,
          userID: user.id,
          updatedOn: TemporalDateTime.now());
      await Amplify.DataStore.delete(post);
      print('Post Deleted');
    } on DataStoreException catch (e) {
      print('Delete failed: $e');
    }
  }
}
