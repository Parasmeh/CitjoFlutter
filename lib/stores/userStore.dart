import '../models/ModelProvider.dart';
import '../repositories/auth_repository.dart';
import '../repositories/comment_repository.dart';
import '../repositories/post_repository.dart';
import '../repositories/query_repository.dart';
import '../repositories/query_repository_live.dart';
import '../repositories/report_repository.dart';
import '../repositories/search_repository.dart';
import '../repositories/user_repository.dart';
import 'state_keeper.dart';

class UserStore extends StateKeeper {
  UserStore._();

  static final UserStore _instance = UserStore._();

  factory UserStore() => _instance;

  final QueryRepository _queryRepository = QueryRepository();
  final ReportsRepository _reportRepository = ReportsRepository();
  final CommentsRepository _commentsRepository = CommentsRepository();
  final UserRepository _userRepository = UserRepository();
  final QueryRepositoryLive _queryRepositoryLive = QueryRepositoryLive();
  final SearchRepository _searchRepository = SearchRepository();
  final PostRepository _postRepository = PostRepository();
  final AuthRepository _authRepository = AuthRepository();

  User currUser = User();
  List<User>? allOtherUsers;

  late List<Post> currUserPosts = [];
  late List<Post> savedPosts = [];
  late List<Post> localPosts = [];

  Future init() async {
    currUser = await _authRepository.getCurrUser();
    // localCategories = currUser.category != null ? currUser.category! : [];
    if (currUser.category != null) {
      localCategories.addAll(currUser.category!);
    }
    currUserPosts = await _queryRepository.queryAllUserPosts(currUser.id);
    savedPosts = await _queryRepository.querySavedPosts();

    subscribedPosts = await _queryRepositoryLive.queryAllSubscribedPosts();
    localPosts = await _queryRepositoryLive.getAllLocationPosts();
    allTrendingPosts = await _queryRepositoryLive.queryAllTrendingPosts();
    allPosts = await _queryRepositoryLive.observePost();
    notifyListeners();
  }

  late List<Post> allPosts = [];
  late List<Post> allTrendingPosts = [];
  late List<User> allPostsUsers = [];

  Future queryAllPosts() async {
    // allPosts = await _queryRepo.queryAllPosts();
    allPosts = _queryRepositoryLive.observePost();
    // print(allPosts.length);
    notifyListeners();
  }

  Future queryAllTrendingPosts() async {
    // allPosts = await _queryRepo.queryAllPosts();
    allTrendingPosts = await _queryRepositoryLive.queryAllTrendingPosts();
    // print(allPosts.length);
    notifyListeners();
  }

  Future queryLocalPosts() async {
    localPosts = await _queryRepositoryLive.getAllLocationPosts();
    // print(allPosts.length);
    notifyListeners();
  }

  Future querySavedPosts() async {
    savedPosts = await _queryRepository.querySavedPosts();
    notifyListeners();
  }

  final List<String> localCategories = [];

  void changeLocalCategory(value) {
    if (localCategories.contains(value)) {
      localCategories.remove(value);
    } else {
      localCategories.add(value);
    }
    notifyListeners();
  }

  Future updateCategory() async {
    await _userRepository.updateUserCategory(localCategories);
    currUser = await _authRepository.getCurrUser();
    notifyListeners();
  }

  Future fetchCurrentUser() async {
    currUser = await _authRepository.getCurrUser();
    // print('fetchCurrentUser' + currUser.toString());
    // print(currUser.category);
    notifyListeners();
  }

  // User currUser = _userRepository.getCurrUser();

  Future fetchAllOtherUsers() async {
    allOtherUsers = await _authRepository.getAllOtherUsers();
    // print('allOtherUsers' + allOtherUsers.toString());
    notifyListeners();
  }

  final localPost = {};

  void changePostCategory(value) {
    if (localPost['category'].contains(value)) {
      localPost['category'].remove(value);
    } else {
      localPost['category'].add(value);
    }
    notifyListeners();
  }

  Future<bool>? uploadPost() async {
    print('uploading video');
    String videoUrl = await _postRepository.storeVideo(localPost['video']);
    print('uploading thumb');
    String thumbUrl = await _postRepository.storeThumb(localPost['thumb']);
    print('creating post');
    print(localPost['location']);

    Future<bool>? x = _postRepository.createVideoPost(
      allowComments: localPost['comments'],
      categories: localPost['category'].toList(),
      desc: localPost['title'],
      location: localPost['location'],
      postVideoUrl: videoUrl,
      tags: localPost['tags'],
      thumbUrl: thumbUrl,
    );

    print('Post LIVE');
    return x;
  }

  late Map<String, User> postUsers = {};

  void fetchPostUser(String userId) async {
    postUsers[userId] = await _queryRepository.queryPostUser(userId);
    notifyListeners();
  }

  late bool isSubed = false;

  Future changeSubed(String userId) async {
    await _userRepository.subscribeQuery(userId);
    await fetchCurrentUser();
    // print('=================================================$isSubed=================================================');
    notifyListeners();
  }

  late Map<String, bool> isLiked = {};

  Future fetchLiked(String postId) async {
    isLiked[postId.toString()] = await _queryRepository.isLiked(postId);
    // print('=============================$isLiked===========================');
    notifyListeners();
  }

  Future changeLiked(String postId) async {
    await _queryRepository.updateLikes(postId);
    await fetchLiked(postId);

    notifyListeners();
  }

  late Map<String, bool> isSaved = {};

  Future fetchSaved(String postId) async {
    isSaved[postId.toString()] = await _queryRepository.isSaved(postId);
    notifyListeners();
  }

  Future changeSaved(String postId) async {
    await _queryRepository.updateSaves(postId);
    await fetchSaved(postId);
    notifyListeners();
  }

  List<Comment> postComments = [];

  Future fetchComments(String postId) async {
    final List<Comment> newComments =
        await _commentsRepository.queryAllCommentsForPost(postId);
    if (newComments != null) {
      print('New Comments: ' + newComments.toString());
      postComments.clear();
      postComments.addAll(newComments);
    }
    notifyListeners();
  }

  Future createComment(String postId, String commentText) async {
    await _commentsRepository.createComment(postId, commentText);
    fetchComments(postId);
    notifyListeners();
  }

  late User commentUser = User();

  Future fetchCommentUser(
    String userId,
  ) async {
    commentUser = await _commentsRepository.queryCommentUser(userId);
    // notifyListeners();
  }

  late User otherUser = User();

  Future fetchOtherUser(
    String userId,
  ) async {
    otherUser = await _commentsRepository.queryCommentUser(userId);
    notifyListeners();
  }

  late List<Post> userPosts = [];

  Future queryUserPosts(String userId) async {
    userPosts = await _queryRepository.queryAllUserPosts(userId);
    // print(allPosts.length);
    notifyListeners();
  }

  // late List<Post> currUserPosts = [];
  // Future queryCurrUserPosts(String userId) async {
  //   currUserPosts = await _queryRepo.queryAllUserPosts(currUser.id);
  //   // print(allPosts.length);
  //   notifyListeners();
  // }

  late List<Post> searchLatestPosts = [];

  Future querySearchLatestPosts(String searchText) async {
    searchLatestPosts =
        await _searchRepository.searchAndReturnLatestPosts(searchText);
    notifyListeners();
  }

  late List<Post> searchTopPosts = [];

  Future querySearchTopPosts(String searchText) async {
    searchTopPosts =
        await _searchRepository.searchAndReturnTopPosts(searchText);
    notifyListeners();
  }

  late List<User> searchUsers = [];

  Future querySearchUsers(String searchText) async {
    searchUsers = await _searchRepository.searchAndReturnUsers(searchText);
    notifyListeners();
  }

  late List<Post> subscribedPosts = [];

  Future querySubscribedPosts() async {
    subscribedPosts = await _queryRepositoryLive.queryAllSubscribedPosts();
    notifyListeners();
  }

  Future reportPost(String postId, String title) async {
    await _reportRepository.createReport(postId, title);
  }

  Future deletePost(String postId) async {
    await _postRepository.deletePost(postId);
    notifyListeners();
  }
}
