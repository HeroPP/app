import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group {
  const factory Group({
    required String id,
    required String ownerId,
    required String name,
    String? code,
    String? description,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
