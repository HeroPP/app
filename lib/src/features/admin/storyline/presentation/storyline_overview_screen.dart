import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kalinar/src/features/admin/storyline/application/story_entry_controller.dart';
import 'package:kalinar/src/features/admin/storyline/presentation/components/reorderable_entry_list.dart';
import 'package:kalinar/src/features/admin/storyline/presentation/storyline_edit_screen.dart';

import '../../../../common_widgets/user_menu.dart';
import '../../../../utilities/async_value_extension.dart';
import '../application/story_entry_list_controller.dart';

class StorylineOverviewScreen extends ConsumerStatefulWidget {
  static const String name = "storylineList";
  static const String route = "story";

  const StorylineOverviewScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StorylineOverviewScreenState();
}

class _StorylineOverviewScreenState extends ConsumerState<StorylineOverviewScreen> {
  Future<void> _onRefresh() async {
    await ref.read(storyEntryListControllerProvider.notifier).getAll();
  }

  void _unlock(String id, bool isUnlocked) {
    ref.read(storyEntryControllerProvider).unlock(id, isUnlocked).then((value) => value.showSnackbarOnError(context));
  }

  void _reorder(String id, int newIndex) {
    ref.read(storyEntryControllerProvider).reorder(id, newIndex).then((value) => value.showSnackbarOnError(context));
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, _onRefresh);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(storyEntryListControllerProvider, (previous, next) => next.showSnackbarOnError(context));
    final state = ref.watch(storyEntryListControllerProvider);

    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(padding: EdgeInsets.only(right: 12.0), child: UserMenu()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GoRouter.of(context).pushNamed(StorylineEditScreen.name),
        child: const Icon(Icons.add),
      ),
      body: state.when(
        data: (data) {
          data.sort((a, b) => a.order.compareTo(b.order));

          return data.isEmpty
              ? Center(child: Text(AppLocalizations.of(context)!.listEmpty))
              : RefreshIndicator(onRefresh: _onRefresh, child: ReorderableEntryList(data, unlock: _unlock, reorder: _reorder));
        },
        error: (_, __) => Center(child: Text(AppLocalizations.of(context)!.listLoadingFailed)),
        loading: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const CircularProgressIndicator(), Text(AppLocalizations.of(context)!.listLoading)],
          ),
        ),
      ),
    );
  }
}