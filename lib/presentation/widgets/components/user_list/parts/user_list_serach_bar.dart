import 'package:flutter/material.dart';
import 'package:man_memo_v2/presentation/providers/users/user_model.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SerachBarComponent extends StatelessWidget {
  const SerachBarComponent({
    super.key,
    required this.search,
    required this.searchResults,
  });

  final Function(String keyword) search;
  final List<UserModel> searchResults;

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      hint: 'Search...',
      openAxisAlignment: 0.0,
      elevation: 4,
      height: 55,
      margins: const EdgeInsets.only(top: 70, left: 10, right: 10, bottom: 10),
      isScrollControlled: true,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 20),
      transitionDuration: const Duration(milliseconds: 500),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      transition: CircularFloatingSearchBarTransition(),
      onSubmitted: ((query) async {
        await search(query);
        print(searchResults);
      }),
      actions: const [],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: SingleChildScrollView(
              child: Column(
                children: searchResults
                    .map(
                      (user) => ListTile(
                        title: Text(user.name),
                        subtitle: const Text("body text"),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
