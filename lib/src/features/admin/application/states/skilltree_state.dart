import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/node.dart';

part 'skilltree_state.freezed.dart';
part 'skilltree_state.g.dart';

@freezed
class SkilltreeState with _$SkilltreeState {
  const factory SkilltreeState({
    @Default([]) List<Node> nodes,
    Node? selectedNode,
    @Default(false) bool isSaving,
  }) = _SkilltreeState;

  factory SkilltreeState.fromJson(Map<String, dynamic> json) => _$SkilltreeStateFromJson(json);
}