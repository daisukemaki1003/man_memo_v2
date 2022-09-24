import 'package:man_memo_v2/data/model/user_detail.dart';

import '../model/user.dart';

class UsersDataSource {
  static final UsersDataSource _instance = UsersDataSource._internal();

  factory UsersDataSource() {
    return _instance;
  }

  UsersDataSource._internal();

  final List<UserData> _users = [
    UserData(name: "test0", userId: "0", createdAt: DateTime.now()),
    UserData(name: "test2", userId: "1", createdAt: DateTime.now()),
    UserData(name: "test1", userId: "2", createdAt: DateTime.now()),
    UserData(name: "test3", userId: "3", createdAt: DateTime.now()),
  ];

  /// 追加
  add(String name) {
    _users.add(UserData(name: name, userId: "3", createdAt: DateTime.now()));
  }

  /// ユーザーリストを取得
  List<UserData> fetchList() {
    return _users;
  }

  /// 検索
  List<UserData> search(String searchText) {
    List<UserData> users = [];

    for (var user in _users) {
      if (user.name.contains(searchText)) users.add(user);
    }

    return users;
  }

  /// 詳細データ取得
  UserDetailData getDetail() {
    UserData userData = UserData(
      name: "test0",
      userId: "0",
      createdAt: DateTime.now(),
    );

    return UserDetailData(
      user: userData,
      age: 20,
      birthday: "birthday",
      birthplace: "birthplace",
      residence: "residence",
      holiday: 10,
      occupation: "occupation",
      memo: "memo",
    );
  }
}
