// Dart Imports
import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// Amplify Imports
import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/User.dart';
import '../models/UserType.dart';

class AuthRepository {
  // StreamSubscription<QuerySnapshot<User>>? _userStream;
  // bool _isSynced = false;
  // List<User> _users = [];
  // bool _loading = false;

  // fetches current Auth Session from AWS Cognito
  Future<AuthSession> fetchAuthSession() async {
    print('Inside Auth Session Fetch');
    AuthSession result;
    result = await Amplify.Auth.fetchAuthSession(
      options: CognitoSessionOptions(getAWSCredentials: true),
    );
    print('Auth Session Fetched Successully');
    String identityId = (result as CognitoAuthSession).identityId!;
    print('identityId: $identityId');
    return result;
  }

  // SignOut
  Future<bool> signOut() async {
    print('Inside Sign Out');
    try {
      // await Amplify.DataStore.clear();
      await Amplify.Auth.signOut();
    } on AuthException catch (_) {
      rethrow;
    }
    return false;
  }

  // Sign In With Google
  Future<bool> signInWithGoogle() async {
    try {
      print('Inside Signing with Google');

      var res =
          await Amplify.Auth.signInWithWebUI(provider: AuthProvider.google);
      print('signInWithWebUI Done');

      List<AuthUserAttribute> authUserAttributes =
          await Amplify.Auth.fetchUserAttributes();
      print('--------------fetchUserAttributes-----------------');

      var myList = {};
      for (var x in authUserAttributes) {
        myList[x.userAttributeKey.toString()] = x.value.toString();
        print('${x.userAttributeKey}: ${x.value}');
      }
      print(myList);
      // print('---------------------------------');
      final userId = myList['sub'];
      print('userId: ' + userId);
      final email = myList['email'];
      print('email: ' + email);
      final username = myList['name'];
      print('username: ' + username);
      final profilePicUrl = myList['picture'];
      print('profilePicUrl: ' + profilePicUrl);

      List<User> users = await Amplify.DataStore.query(User.classType,
          where: User.USERCOGID.eq(userId));
      print('DataStore Query Done $users');

      if (users.isNotEmpty) {
        print('User: $users');
        return res.isSignedIn;
      } else {
        print('Saving in DataStore');
        final item = User(
          userCogId: userId,
          username: username,
          phoneNumber: "",
          location: "",
          language: "English",
          email: email,
          bio: "",
          profilePicUrl: profilePicUrl,
          userType: UserType.USER,
          createdOn: TemporalDateTime.now(),
          updatedOn: TemporalDateTime.now(),
          subscribers: const [],
          subscribed: const [],
          saves: const [],
          category: const [],
          Posts: const [],
        );
        await Amplify.DataStore.save(item);
        print('Datastore Saved!!');
        return res.isSignedIn;
      }
    } on AmplifyException catch (e) {
      print('Error Message:$e');
      return false;
    }
  }

  // fetches Current User
  Future<User> getCurrUser() async {
    // print("Inside getCurrUser");
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    // print(authUser);
    // print("Current Auth User ID: ${authUser.userId}");
    User user = (await Amplify.DataStore.query(User.classType,
        where: User.USERCOGID.eq(authUser.userId)))[0];
    // print("User Query Successful");
    print(user);
    return user;
  }

  // fetches All other users
  Future<List<User>> getAllOtherUsers() async {
    // print("Inside getAllOtherUsers");
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    // print("Current Auth User ID: " + authUser.toString());
    List<User> users = await Amplify.DataStore.query(User.classType,
        where: User.USERCOGID.ne(authUser.userId));
    return users;
  }
}
