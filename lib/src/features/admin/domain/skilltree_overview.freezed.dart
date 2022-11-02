// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'skilltree_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SkilltreeOverview _$SkilltreeOverviewFromJson(Map<String, dynamic> json) {
  return _SkilltreeOverview.fromJson(json);
}

/// @nodoc
mixin _$SkilltreeOverview {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Character? get character => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  bool get isActiveTree => throw _privateConstructorUsedError;
  int get nodeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SkilltreeOverviewCopyWith<SkilltreeOverview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkilltreeOverviewCopyWith<$Res> {
  factory $SkilltreeOverviewCopyWith(
          SkilltreeOverview value, $Res Function(SkilltreeOverview) then) =
      _$SkilltreeOverviewCopyWithImpl<$Res, SkilltreeOverview>;
  @useResult
  $Res call(
      {String id,
      String name,
      Character? character,
      int points,
      bool isActiveTree,
      int nodeCount});

  $CharacterCopyWith<$Res>? get character;
}

/// @nodoc
class _$SkilltreeOverviewCopyWithImpl<$Res, $Val extends SkilltreeOverview>
    implements $SkilltreeOverviewCopyWith<$Res> {
  _$SkilltreeOverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? character = freezed,
    Object? points = null,
    Object? isActiveTree = null,
    Object? nodeCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      character: freezed == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      isActiveTree: null == isActiveTree
          ? _value.isActiveTree
          : isActiveTree // ignore: cast_nullable_to_non_nullable
              as bool,
      nodeCount: null == nodeCount
          ? _value.nodeCount
          : nodeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CharacterCopyWith<$Res>? get character {
    if (_value.character == null) {
      return null;
    }

    return $CharacterCopyWith<$Res>(_value.character!, (value) {
      return _then(_value.copyWith(character: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SkilltreeOverviewCopyWith<$Res>
    implements $SkilltreeOverviewCopyWith<$Res> {
  factory _$$_SkilltreeOverviewCopyWith(_$_SkilltreeOverview value,
          $Res Function(_$_SkilltreeOverview) then) =
      __$$_SkilltreeOverviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      Character? character,
      int points,
      bool isActiveTree,
      int nodeCount});

  @override
  $CharacterCopyWith<$Res>? get character;
}

/// @nodoc
class __$$_SkilltreeOverviewCopyWithImpl<$Res>
    extends _$SkilltreeOverviewCopyWithImpl<$Res, _$_SkilltreeOverview>
    implements _$$_SkilltreeOverviewCopyWith<$Res> {
  __$$_SkilltreeOverviewCopyWithImpl(
      _$_SkilltreeOverview _value, $Res Function(_$_SkilltreeOverview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? character = freezed,
    Object? points = null,
    Object? isActiveTree = null,
    Object? nodeCount = null,
  }) {
    return _then(_$_SkilltreeOverview(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      character: freezed == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character?,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      isActiveTree: null == isActiveTree
          ? _value.isActiveTree
          : isActiveTree // ignore: cast_nullable_to_non_nullable
              as bool,
      nodeCount: null == nodeCount
          ? _value.nodeCount
          : nodeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SkilltreeOverview implements _SkilltreeOverview {
  const _$_SkilltreeOverview(
      {required this.id,
      required this.name,
      this.character,
      required this.points,
      required this.isActiveTree,
      required this.nodeCount});

  factory _$_SkilltreeOverview.fromJson(Map<String, dynamic> json) =>
      _$$_SkilltreeOverviewFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final Character? character;
  @override
  final int points;
  @override
  final bool isActiveTree;
  @override
  final int nodeCount;

  @override
  String toString() {
    return 'SkilltreeOverview(id: $id, name: $name, character: $character, points: $points, isActiveTree: $isActiveTree, nodeCount: $nodeCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SkilltreeOverview &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.isActiveTree, isActiveTree) ||
                other.isActiveTree == isActiveTree) &&
            (identical(other.nodeCount, nodeCount) ||
                other.nodeCount == nodeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, character, points, isActiveTree, nodeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SkilltreeOverviewCopyWith<_$_SkilltreeOverview> get copyWith =>
      __$$_SkilltreeOverviewCopyWithImpl<_$_SkilltreeOverview>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SkilltreeOverviewToJson(
      this,
    );
  }
}

abstract class _SkilltreeOverview implements SkilltreeOverview {
  const factory _SkilltreeOverview(
      {required final String id,
      required final String name,
      final Character? character,
      required final int points,
      required final bool isActiveTree,
      required final int nodeCount}) = _$_SkilltreeOverview;

  factory _SkilltreeOverview.fromJson(Map<String, dynamic> json) =
      _$_SkilltreeOverview.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  Character? get character;
  @override
  int get points;
  @override
  bool get isActiveTree;
  @override
  int get nodeCount;
  @override
  @JsonKey(ignore: true)
  _$$_SkilltreeOverviewCopyWith<_$_SkilltreeOverview> get copyWith =>
      throw _privateConstructorUsedError;
}