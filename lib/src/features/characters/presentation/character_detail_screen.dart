import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:kalinar/src/features/characters/presentation/components/details/character_configuration.dart';
import 'package:kalinar/src/utilities/async_value_extension.dart';

import '../../../common_widgets/loading_indicator.dart';
import '../../../utilities/router/routes.dart';
import '../../authentication/domain/user_info.dart';
import '../application/character_controller.dart';
import '../domain/character.dart';

import 'components/details/auto_saving_text_field.dart';
import 'components/details/character_abilities.dart';
import 'components/details/character_sheet_widget.dart';
import 'components/details/character_skilltree_list.dart';
import 'components/details/character_tab.dart';

class CharacterDetailScreen extends ConsumerStatefulWidget {
  static const String name = "CharacterDetail";
  static const String route = ":id";

  final String id;

  const CharacterDetailScreen(this.id, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends ConsumerState<CharacterDetailScreen> {
  bool _isOwner(UserInfo? user, Character character) {
    return user?.id == character.userId;
  }

  bool _isOwnerOrAdmin(UserInfo? user, Character character) {
    return _isOwner(user, character) || (user?.isAdmin() ?? false);
  }

  Future _saveField(String fieldName, dynamic value) async {
    final state = await ref.read(characterControllerProvider.notifier).update(widget.id, {fieldName: value});
    if (!mounted) return;
    state.showSnackbarOnError(context);
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async => await ref.read(characterControllerProvider.notifier).getById(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userChangedProvider);
    final state = ref.watch(characterControllerProvider);
    ref.listen(characterControllerProvider, (previous, next) => next.showSnackbarOnError(context));

    return state.when(
        data: (data) {
          final List<CharacterTab> tabs = [
            CharacterTab(
              icon: const FaIcon(FontAwesomeIcons.person),
              text: AppLocalizations.of(context)!.characteristics,
              tab: CharacterSheetWidget(data),
            ),
            CharacterTab(
              icon: const FaIcon(FontAwesomeIcons.award),
              text: AppLocalizations.of(context)!.abilities,
              tab: CharacterAbilities(data),
            ),
            if (_isOwnerOrAdmin(user, data))
              CharacterTab(
                icon: const FaIcon(FontAwesomeIcons.circleNodes),
                text: AppLocalizations.of(context)!.skilltrees,
                tab: CharacterSkilltreeList(data),
              ),
            CharacterTab(
              icon: const FaIcon(FontAwesomeIcons.clipboardCheck),
              text: AppLocalizations.of(context)!.characterInventory,
              tab: SingleChildScrollView(
                child: Column(
                  children: [
                    AutoSavingTextField(
                      title: AppLocalizations.of(context)!.characterInventory,
                      initialValue: data.inventory,
                      minLines: 1,
                      maxLines: 2000000000,
                      enabled: _isOwner(user, data),
                      onSaving: (currentText) async => await _saveField("inventory", currentText),
                    ),
                  ],
                ),
              ),
            ),
            CharacterTab(
              icon: const FaIcon(FontAwesomeIcons.noteSticky),
              text: AppLocalizations.of(context)!.characterNotes,
              tab: SingleChildScrollView(
                child: Column(
                  children: [
                    AutoSavingTextField(
                      title: AppLocalizations.of(context)!.characterNotes,
                      initialValue: data.notes,
                      minLines: 1,
                      maxLines: 2000000000,
                      enabled: _isOwner(user, data),
                      onSaving: (currentText) async => await _saveField("notes", currentText),
                    ),
                  ],
                ),
              ),
            ),
            if (_isOwner(user, data))
              CharacterTab(
                icon: const FaIcon(Icons.settings),
                text: AppLocalizations.of(context)!.settings,
                tab: CharacterConfiguration(data, save: _saveField),
              )
          ];

          return DefaultTabController(
            length: tabs.length,
            initialIndex: 0,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(tabs: tabs, isScrollable: true),
              ),
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TabBarView(
                  children: [...tabs.map((e) => e.tab)],
                ),
              ),
            ),
          );
        },
        loading: () => LoadingIndicator(AppLocalizations.of(context)!.fetchCharacter),
        error: (error, stacktrace) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text(AppLocalizations.of(context)!.fetchCharactersFailed)],
            ));
  }
}
