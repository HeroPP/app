import 'package:flutter/material.dart';
import 'package:hero/src/features/admin/presentation/skilltree/components/editable_node.dart';
import 'package:hero/src/features/admin/presentation/skilltree/components/node_widget.dart';

import '../../../domain/node.dart';

class DraggableNode extends StatelessWidget {
  final Node item;
  final Function(Node node) onTap;

  const DraggableNode(this.item, {required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: item.xpos,
      top: item.ypos,
      child: Draggable<Node>(
        data: item,
        maxSimultaneousDrags: 1,
        feedback: NodeWidget(item),
        child: EditableNode(item, onTap: onTap),
      ),
    );
  }
}