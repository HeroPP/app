import 'dart:convert';

import 'package:flutter_auth/flutter_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hero/src/utilities/base_repository.dart';

import '../../../utilities/constants.dart';
import '../../authentication/data/auth_repository.dart';
import '../domain/ability.dart';

class AbilitiesRepository extends HeroBaseRepository {
  AbilitiesRepository(FlutterAuth client) : super(client);

  Future<Ability> getByName(String name) async {
    return await heroGet("/api/abilities/$name", (response) => Ability.fromJson(response));
  }

  Future<List<Ability>> getAll() async {
    return await heroGet("/api/abilities", (response) => List<Ability>.from(response.map((model) => Ability.fromJson(model))));
  }

  Future<List<Ability>> filter(String query) async {
    return await heroGet(
      "/api/abilities",
      (response) => List<Ability>.from(response.map((model) => Ability.fromJson(model))),
      query: {"search": query},
    );
  }

  Future<Ability> createAbility(Map<String, dynamic> data) async {
    return await heroPost("/api/abilities", data, (response) => Ability.fromJson(json.decode(response)));
  }

  Future<Ability> updateAbility(String name, Map<String, dynamic> data) async {
    return await heroUpdate("/api/abilities/$name", data, (response) => Ability.fromJson(json.decode(response)));
  }

  Future<bool> deleteAbility(String name) async {
    return await heroDelete("/api/abilities/$name");
  }
}

final abilitiesRepositoryProvider = Provider<AbilitiesRepository>((ref) => AbilitiesRepository(ref.read(authProvider)));
