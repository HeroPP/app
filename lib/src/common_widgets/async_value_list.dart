import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueList<T> extends StatelessWidget {
  final AsyncValue<List<T>> list;
  final Widget Function(T item) builder;
  final Future<void> Function() refreshList;
  final Widget? loading;
  final Widget? error;

  const AsyncValueList(this.list, {required this.builder, required this.refreshList, this.loading, this.error, super.key});

  @override
  Widget build(BuildContext context) {
    return list.when(
      data: (data) => RefreshIndicator(
        onRefresh: refreshList,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, index) => builder(data[index]),
        ),
      ),
      error: (_, __) => error ?? const Center(child: Text("Fehler beim Laden der Daten.")),
      loading: () =>
          loading ??
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [CircularProgressIndicator(), Text("Fähigkeiten werden geladen...")],
            ),
          ),
    );
  }
}
