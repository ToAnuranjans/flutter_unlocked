import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/activity.dart';
import '../providers/activity_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Activity> activity = ref.watch(activtyProvider);
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey.shade100,
            padding: EdgeInsets.all(16),
            child: switch (activity) {
              AsyncData(:final value) => Text('Activity: ${value.activity}'),
              AsyncError() => const Text(
                'Oops, something unexpected happened...',
              ),
              _ => const CircularProgressIndicator(),
            },
          );
        },
      ),
    );
  }
}
