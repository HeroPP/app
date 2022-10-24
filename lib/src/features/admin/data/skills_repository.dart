import 'dart:convert';

import 'package:flutter_auth/flutter_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hero/src/utilities/base_repository.dart';
import 'package:hero/src/features/admin/domain/skill.dart';

import '../../../utilities/constants.dart';
import '../../authentication/data/auth_repository.dart';

class SkillsRepository extends BaseRepository {
  SkillsRepository(FlutterAuth client) : super(client);

  Future<List<Skill>> getAll() async {
    Uri url = Uri.https(Constants.baseUrl, "/api/skills");
    return get(url, (response) => List<Skill>.from(response.map((model) => Skill.fromJson(model))));
  }

  Future<Skill> createSkill(Map<String, dynamic> data) async {
    final url = Uri.https(Constants.baseUrl, "/api/skills");
    return post(url, data, (response) => Skill.fromJson(json.decode(response)));
  }

  Future<Skill> updateSkill(String id, Map<String, dynamic> data) async {
    final url = Uri.https(Constants.baseUrl, "/api/skills/$id");
    return update(url, data, (response) => Skill.fromJson(json.decode(response)));
  }

  Future<bool> deleteSkill(String id) async {
    final url = Uri.https(Constants.baseUrl, "/api/skills/$id");
    return delete(url);
  }
}

final skillsRepositoryProvider = Provider<SkillsRepository>((ref) => SkillsRepository(ref.read(authProvider)));
