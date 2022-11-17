import 'package:amplify_flutter/amplify_flutter.dart';

import '../repositories/auth_repository.dart';
import '../repositories/user_repository.dart';
import 'state_keeper.dart';
import 'userStore.dart';

class AuthStore extends StateKeeper {
  AuthStore._();

  static final AuthStore _instance = AuthStore._();

  factory AuthStore() {
    return _instance;
  }

  static const String loginUser = 'login_user';
  static const String loginGoogleUser = 'login_google_user';
  static const String signupUser = 'signup_user';

  late bool isAuthenticated;

  // final UserRepository _userRepository = UserRepository();
  final AuthRepository _authRepository = AuthRepository();

  Future isSignedIn() async {
    AuthSession authSessions = await Amplify.Auth.fetchAuthSession();
    isAuthenticated = authSessions.isSignedIn;
    notifyListeners();
  }

  Future<bool> loginWithGoogle() async {
    try {
      setStatus(loginGoogleUser, Status.Loading);
      bool isSignedIn = await _authRepository.signInWithGoogle();
      if (isSignedIn == false) setStatus(loginGoogleUser, Status.Idle);
      if (isSignedIn) {
        await UserStore().fetchCurrentUser();
        await UserStore().fetchAllOtherUsers();
        setStatus(loginGoogleUser, Status.Done);
        return true;
      }
      setStatus(loginGoogleUser, Status.Done);
      return false;
    } on UserCancelledException catch (_) {
      setError(loginGoogleUser, "Google authentication cancelled by user.");
      return false;
    } catch (e) {
      print("ERROR");
      setError(loginGoogleUser, e.toString());
      return false;
    }
  }

  Future logout() async {
    await _authRepository.signOut();
    notifyListeners();
  }
}
