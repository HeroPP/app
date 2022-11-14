import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hero/src/features/admin/management/domain/attribute.dart';

part 'attribute_value.freezed.dart';
part 'attribute_value.g.dart';

@freezed
class AttributeValue with _$AttributeValue {
  const factory AttributeValue({
    required String attributeId,
    required Attribute attribute,
    required double value,
  }) = _AttributeValue;

  factory AttributeValue.fromJson(Map<String, dynamic> json) => _$AttributeValueFromJson(json);
}