import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../admin/data/abilities_repository.dart';
import '../../../../admin/domain/ability.dart';

class AbilityListController extends StateNotifier<AsyncValue<List<Ability>>> {
  final AbilitiesRepository repo;
  final savebuttonController = RoundedLoadingButtonController();

  AbilityListController(this.repo) : super(const AsyncData([]));

  Future<void> getAllAbilities() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(repo.getAll);
  }

  Future<void> deleteAbility(String name) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await repo.deleteAbility(name);
      return await repo.getAll();
    });
  }
}

final abilityListControllerProvider = StateNotifierProvider.autoDispose<AbilityListController, AsyncValue<List<Ability>>>(
    (ref) => AbilityListController(ref.read(abilitiesRepositoryProvider)));