import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/views/models/diary.dart';
import 'package:man_memo_v2/views/widgets/components/diary_editor/page.dart';

import '../../../provider/diary/diary_action.dart';
import '../../../provider/diary/diary_state.dart';

class DiaryEditorContainer extends ConsumerWidget {
  const DiaryEditorContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diary = ref.watch(diaryStateProvider);
    final diaryActions = ref.watch(diaryActionsProvider);

    save() async {
      print(diary);
      diaryActions.save(diary);
    }

    return Consumer(builder: (context, ref, _) {
      return DiaryEditorComponent(
        save: save,
      );
    });
  }
}
