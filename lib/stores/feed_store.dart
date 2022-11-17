import '../models/Post.dart';
import '../repositories/comment_repository.dart';
import '../repositories/query_repository.dart';
import '../repositories/user_repository.dart';
import 'state_keeper.dart';

class FeedStore extends StateKeeper {
  FeedStore._();
  static final FeedStore _instance = FeedStore._();

  factory FeedStore() => _instance;

  final QueryRepository _queryRepo = QueryRepository();
  final CommentsRepository _commentsRepo = CommentsRepository();
  final UserRepository _userRepo = UserRepository();

  // late List<Post> searchPosts = [];
  // Future querySearchPosts(String searchText) async {
  //   searchPosts = await _queryRepo.searchAndReturnLatestPosts(searchText);
  //   notifyListeners();
  // }
}
