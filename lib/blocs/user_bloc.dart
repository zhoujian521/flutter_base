import 'package:flutter_base/data/model/user.dart';
import 'package:flutter_base/data/repository/user_repository.dart';
import 'package:rxdart/subjects.dart';
import 'bloc_provider.dart';

class UserBloc implements BlocBase {
  BehaviorSubject _userChannel = BehaviorSubject();

  Sink get userSink => _userChannel.sink;
  Stream get userStream => _userChannel.stream;

  void login({String username, String password}) async {
    User user = await UserRepository.login(username, password);
    userSink.add(user);
  }

  @override
  void dispose() {
    _userChannel.close();
  }

  @override
  Future getData() {
    return null;
  }

  @override
  Future onLoadMore() {
    return null;
  }

  @override
  Future onRefresh() {
    return null;
  }
}
