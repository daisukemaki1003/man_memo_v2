import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/model/user_model.dart';

import '../provider/users_provider.dart';
import '../widgets/drawer_header.dart';
import 'search.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: const MyDrawerHeader(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Consumer(builder: (context, ref, _) {
              final users = ref.watch(usersNotifierProvider);
              return users.map(
                error: (_) => const Text('On Error'),
                loading: (_) => const CircularProgressIndicator(),
                data: (data) => _userList(data.value),
              );
            }),

            Positioned(
              right: 10,
              bottom: 10,
              child: _addButton(ref),
            ),

            /// 検索バー
            const MySerachBar(),
          ],
        ),
      ),
    );
  }

  Widget _userList(List<UserModel> users) {
    return ListView(
      children: [
        const SizedBox(height: 100),
        ListView.builder(
          itemCount: users.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final user = users[index];
            return _userListItem(user);
          },
        ),
      ],
    );
  }

  Widget _userListItem(UserModel user) {
    return Dismissible(
      key: ObjectKey(user),
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.redAccent[700],
      ),
      confirmDismiss: (DismissDirection direction) async {
        print("object");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                "https://gws-ug.jp/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png"),
          ),
          title: Text(user.name),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _addButton(WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.watch(usersActionsProvider).add("name");
        ref.refresh(usersActionsProvider);
      },
      child: Container(
        height: 54,
        width: 54,
        margin: const EdgeInsets.only(right: 17, bottom: 50),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(Icons.add, size: 25, color: Colors.white),
      ),
    );
  }
}
