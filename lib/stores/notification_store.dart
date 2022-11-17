import '../repositories/user_repository.dart';
import 'state_keeper.dart';

class NotificationStore extends StateKeeper {
  NotificationStore._();

  static final NotificationStore _instance = NotificationStore._();

  factory NotificationStore() {
    return _instance;
  }

  final UserRepository _userRepository = UserRepository();
}
