import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/widgets/components/user_detail/page.dart';

import '../../../providers/users/user_model.dart';

class UserDetailPageContainer extends ConsumerWidget {
  const UserDetailPageContainer(this.user, {super.key});

  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        return UserDetailPageComponent(user: user);
      },
    );
  }
}
