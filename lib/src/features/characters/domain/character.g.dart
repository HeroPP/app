// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Character _$$_CharacterFromJson(Map<String, dynamic> json) => _$_Character(
      id: json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int?,
      iconUrl: json['iconUrl'] as String?,
      description: json['description'] as String?,
      profession: json['profession'] as String?,
      religion: json['religion'] as String?,
      relationship: json['relationship'] as String?,
      notes: json['notes'] as String?,
      inventory: json['inventory'] as String?,
      raceId: json['raceId'] as String,
      race: Race.fromJson(json['race'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CharacterToJson(_$_Character instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'iconUrl': instance.iconUrl,
      'description': instance.description,
      'profession': instance.profession,
      'religion': instance.religion,
      'relationship': instance.relationship,
      'notes': instance.notes,
      'inventory': instance.inventory,
      'raceId': instance.raceId,
      'race': instance.race,
    };