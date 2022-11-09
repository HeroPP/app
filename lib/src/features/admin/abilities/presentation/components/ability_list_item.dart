import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../domain/ability.dart';

class AbilityListItem extends StatelessWidget {
  final Ability item;
  final Function(Ability)? onDelete;
  final Function(Ability, BuildContext)? onTab;

  const AbilityListItem(this.item, {this.onDelete, this.onTab, super.key});

  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Fähigkeit löschen?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text("Abbrechen")),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text("Weiter")),
        ],
      ),
    );
  }

  Future<void> _pressDelete(BuildContext context) async {
    if (null != onDelete && await _confirmDelete(context)) {
      await onDelete!(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
          key: UniqueKey(),
          endActionPane: ActionPane(
            dismissible: DismissiblePane(
              onDismissed: () => null != onDelete ? onDelete!(item) : null,
              confirmDismiss: () async => _confirmDelete(context),
              closeOnCancel: true,
            ),
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                autoClose: true,
                onPressed: _pressDelete,
                icon: Icons.delete,
                label: "Löschen",
                backgroundColor: Theme.of(context).errorColor,
              )
            ],
          ),
          child: ListTile(
            title: Text(item.name),
            subtitle: null != item.description ? Text(item.description!) : null,
            onTap: null != onTab ? () => onTab!(item, context) : null,
          ),
        ),
        const Divider(),
      ],
    );
  }
}