import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../domain/skilltree_overview.dart';

class SkilltreeItem extends StatelessWidget {
  final SkilltreeOverview item;

  const SkilltreeItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.name, maxLines: 2, overflow: TextOverflow.ellipsis),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(children: [
            Row(
              children: [
                const FaIcon(FontAwesomeIcons.lightbulb, size: 18),
                const SizedBox(width: 5),
                Text("${item.points}"),
              ],
            ),
            const SizedBox(width: 10),
            Row(
              children: [
                Transform.rotate(angle: pi / 4, child: FaIcon(FontAwesomeIcons.square, color: Theme.of(context).colorScheme.secondary, size: 18)),
                const SizedBox(width: 5),
                Text("${item.nodeCount}"),
              ],
            ),
          ]),
        ),
        trailing: item.isActiveTree ? const Icon(Icons.check_circle_outline_outlined, size: 32) : null,
      ),
    );
  }
}