import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hero/src/features/group_management/presentation/user_list/user_list_item.dart';
import 'package:hero/src/features/group_management/presentation/user_list_controller.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  late UserListController controller;

  Future<void> _refresh() async {
    await controller.getMembers();
  }

  @override
  void initState() {
    controller = ref.read(userListControllerProvider.notifier);
    Future.delayed(Duration.zero, _refresh);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userListControllerProvider);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mitglieder:", style: Theme.of(context).textTheme.titleLarge),
              IconButton(
                onPressed: _refresh,
                icon: const Icon(Icons.refresh),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ],
          ),
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (value) {
                value.disallowIndicator();
                return true;
              },
              child: state.when(
                data: (data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (_, index) => UserListItem(data[index]),
                ),
                error: (error, _) => const Center(child: Text("Beim abrufen der Mitglieder ist ein Fehler aufgetreten.")),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
