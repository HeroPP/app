// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Edge _$EdgeFromJson(Map<String, dynamic> json) {
  return _Edge.fromJson(json);
}

/// @nodoc
mixin _$Edge {
  Node get start => throw _privateConstructorUsedError;
  Node get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EdgeCopyWith<Edge> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EdgeCopyWith<$Res> {
  factory $EdgeCopyWith(Edge value, $Res Function(Edge) then) =
      _$EdgeCopyWithImpl<$Res>;
  $Res call({Node start, Node end});

  $NodeCopyWith<$Res> get start;
  $NodeCopyWith<$Res> get end;
}

/// @nodoc
class _$EdgeCopyWithImpl<$Res> implements $EdgeCopyWith<$Res> {
  _$EdgeCopyWithImpl(this._value, this._then);

  final Edge _value;
  // ignore: unused_field
  final $Res Function(Edge) _then;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Node,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Node,
    ));
  }

  @override
  $NodeCopyWith<$Res> get start {
    return $NodeCopyWith<$Res>(_value.start, (value) {
      return _then(_value.copyWith(start: value));
    });
  }

  @override
  $NodeCopyWith<$Res> get end {
    return $NodeCopyWith<$Res>(_value.end, (value) {
      return _then(_value.copyWith(end: value));
    });
  }
}

/// @nodoc
abstract class _$$_EdgeCopyWith<$Res> implements $EdgeCopyWith<$Res> {
  factory _$$_EdgeCopyWith(_$_Edge value, $Res Function(_$_Edge) then) =
      __$$_EdgeCopyWithImpl<$Res>;
  @override
  $Res call({Node start, Node end});

  @override
  $NodeCopyWith<$Res> get start;
  @override
  $NodeCopyWith<$Res> get end;
}

/// @nodoc
class __$$_EdgeCopyWithImpl<$Res> extends _$EdgeCopyWithImpl<$Res>
    implements _$$_EdgeCopyWith<$Res> {
  __$$_EdgeCopyWithImpl(_$_Edge _value, $Res Function(_$_Edge) _then)
      : super(_value, (v) => _then(v as _$_Edge));

  @override
  _$_Edge get _value => super._value as _$_Edge;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_$_Edge(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Node,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Node,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Edge implements _Edge {
  const _$_Edge({required this.start, required this.end});

  factory _$_Edge.fromJson(Map<String, dynamic> json) => _$$_EdgeFromJson(json);

  @override
  final Node start;
  @override
  final Node end;

  @override
  String toString() {
    return 'Edge(start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Edge &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end));

  @JsonKey(ignore: true)
  @override
  _$$_EdgeCopyWith<_$_Edge> get copyWith =>
      __$$_EdgeCopyWithImpl<_$_Edge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EdgeToJson(
      this,
    );
  }
}

abstract class _Edge implements Edge {
  const factory _Edge({required final Node start, required final Node end}) =
      _$_Edge;

  factory _Edge.fromJson(Map<String, dynamic> json) = _$_Edge.fromJson;

  @override
  Node get start;
  @override
  Node get end;
  @override
  @JsonKey(ignore: true)
  _$$_EdgeCopyWith<_$_Edge> get copyWith => throw _privateConstructorUsedError;
}
