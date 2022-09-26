import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/views/models/diary.dart';

import 'diary_state.dart';

final diaryActionsProvider = Provider((ref) => DiaryActions(ref));

/// Presenter 操作
class DiaryActions {
  DiaryActions(this.ref);

  final Ref ref;

  /// Presenter
  /// Domain層へのアクセス

  void save(Diary diary) {
    ref.read(diariesNotifierProvider.notifier).save(diary);
  }

  void open(Diary diary) {
    ref.read(diariesNotifierProvider.notifier).open(diary);
  }
}