import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/domain/entity/model/user.dart';
import 'package:man_memo_v2/presentation/widgets/components/user_list/parts/user_list.dart';

import '../../../../providers/users/users_state.dart';

class UserListContainer extends ConsumerWidget {
  const UserListContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersViewModel = ref.watch(usersNotifierProvider);

    return Consumer(
      builder: (context, ref, _) {
        return usersViewModel.map(
          error: (_) => const Text('On Error'),
          loading: (_) => const CircularProgressIndicator(),
          data: (data) => UserListComponent(data.value),
        );
      },
    );
  }
}
