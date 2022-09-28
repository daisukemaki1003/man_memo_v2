import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../presenter/users/user_add_presenter.dart';
import '../../../components/user_list/parts/user_add_button.dart';

class UserAddButtonContainer extends ConsumerWidget {
  const UserAddButtonContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAddPresenter =
        ref.watch(userAddPresenterNotifierProvider.notifier);

    return UserAddButtonComponent(userAddPresenter.handle);
  }
}