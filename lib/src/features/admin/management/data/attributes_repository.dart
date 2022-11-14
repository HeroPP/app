import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hero/src/features/admin/management/domain/attribute.dart';

import '../../../../utilities/base_repository.dart';
import '../../../authentication/data/auth_repository.dart';
import '../../../group_management/application/has_group_controller.dart';

class AttributesRepository extends HeroBaseRepository {
  AttributesRepository(super.client, String? groupId) : super(groupId: groupId);

  Future<Attribute> getById(String id) async {
    return await heroGet("/api/attributes/$id", (response) => Attribute.fromJson(response));
  }

  Future<List<Attribute>> getAll() async {
    return await heroGet("/api/attributes", (response) => List<Attribute>.from(response.map((model) => Attribute.fromJson(model))));
  }

  Future<Attribute> createAttribute(Map<String, dynamic> data) async {
    return await heroPost("/api/attributes", data, (response) => Attribute.fromJson(json.decode(response)));
  }

  Future<Attribute> updateAttribute(String id, Map<String, dynamic> data) async {
    return await heroUpdate("/api/attributes/$id", data, (response) => Attribute.fromJson(json.decode(response)));
  }

  Future<bool> deleteAttribute(String id) async {
    return await heroDelete("/api/attributes/$id");
  }
}

final attributesRepositoryProvider =
    Provider<AttributesRepository>((ref) => AttributesRepository(ref.read(authProvider), ref.read(hasGroupProvider).groupId));