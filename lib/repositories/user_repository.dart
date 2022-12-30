// Flutter Imports
import 'dart:async';

// Amplify Imports
import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/User.dart';
import '../models/UserType.dart';
import '../stores/userStore.dart';

class UserRepository {
  Future updateUserType() async {
    print('Updating User Type');
    User user = UserStore().currUser;
    await Amplify.DataStore.save(user.copyWith(userType: UserType.PUBLISHER));
  }

  // Updating User Profile i.e Username and Bio
  Future updateProfile(String name, String newBio) async {
    print("Inside Update Profile");
    User user = UserStore().currUser;
    await Amplify.DataStore.save(user.copyWith(username: name, bio: newBio));
  }

  // Updating User's categories
  Future updateUserCategory(List<String> categories) async {
    print("Inside updateUserCategory");
    User user = UserStore().currUser;
    await Amplify.DataStore.save(user.copyWith(category: categories));
  }

  // Updating User's location
  Future updateUserLocation(String location) async {
    // print("Inside updateUserLocation");
    // print(location);
    User user = UserStore().currUser;
    Amplify.DataStore.save(user.copyWith(location: location));
    // print('++++++++++++++++++++++++++++++++++++++++++++++++'+user.location.toString());
  }

  // Updating User's Subscribed To and Subscribed To User's Subscribers List
  Future subscribeQuery(String subscribedToId) async {
    // print("Inside subscribeQuery");
    // print(subscribedToId);

    // Appending Subscribed To User's ID to the Current User's Subscribed To List
    User user = UserStore().currUser;
    if (user.id != subscribedToId) {
      List<String> subscribedList = [];
      if (user.subscribed != null) {
        subscribedList.addAll(user.subscribed!);
      }
      if (!(subscribedList.contains(subscribedToId))) {
        subscribedList.add(subscribedToId);
        print('Adding........');
      } else {
        subscribedList.remove(subscribedToId);
        print('Removing........');
      }
      // print(subscribedList);
      Amplify.DataStore.save(user.copyWith(subscribed: subscribedList));
      // print('SubedList Saved');

      // Appending Current User's ID to the Subscribed To User's List of Subscribers
      User subscribedToUser = (await Amplify.DataStore.query(
        User.classType,
        where: User.ID.eq(subscribedToId),
      ))[0];

      // print('subscribersList Saved');

      List<String> subscribersList = [];
      if (subscribedToUser.subscribers != null) {
        subscribersList.addAll(subscribedToUser.subscribers!);
      }
      // print(subscribedToId);
      // print(user.id);
      if (!(subscribersList.contains(user.id))) {
        subscribersList.add(user.id);
        print('Adding........');
      } else {
        subscribersList.remove(user.id);
        print('Removing........');
      }
      // print(subscribersList);
      Amplify.DataStore.save(
          subscribedToUser.copyWith(subscribers: subscribersList));
      // print('Suber List Saved');
    }
  }

  // NO USAGES
  void changeUserType(String userId, UserType type) {
    User user = UserStore().currUser;
    Amplify.DataStore.save(user.copyWith(userType: type));
  }
}
