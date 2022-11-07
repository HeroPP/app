import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utilities/base_repository.dart';
import '../../../authentication/data/auth_repository.dart';
import '../../../group_management/application/has_group_controller.dart';
import '../domain/ability.dart';

class AbilitiesRepository extends HeroBaseRepository {
  AbilitiesRepository(super.client, String? groupId) : super(groupId: groupId);

  Future<Ability> getByName(String id) async {
    return await heroGet("/api/abilities/$id", (response) => Ability.fromJson(response));
  }

  Future<List<Ability>> getAll() async {
    return await heroGet("/api/abilities", (response) => List<Ability>.from(response.map((model) => Ability.fromJson(model))));
  }

  Future<List<Ability>> filter(String query) async {
    return await heroGet("/api/abilities", (response) => List<Ability>.from(response.map((model) => Ability.fromJson(model))),
        query: {"search": query});
  }

  Future<Ability> createAbility(Map<String, dynamic> data) async {
    return await heroPost("/api/abilities", data, (response) => Ability.fromJson(json.decode(response)));
  }

  Future<Ability> updateAbility(String id, Map<String, dynamic> data) async {
    return await heroUpdate("/api/abilities/$id", data, (response) => Ability.fromJson(json.decode(response)));
  }

  Future<bool> deleteAbility(String id) async {
    return await heroDelete("/api/abilities/$id");
  }
}

final abilitiesRepositoryProvider =
    Provider<AbilitiesRepository>((ref) => AbilitiesRepository(ref.read(authProvider), ref.watch(hasGroupProvider).groupId));