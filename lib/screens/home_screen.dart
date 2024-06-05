import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/providers/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValuee = ref.watch(usersProvider);
    print("Tick");

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () async {
              final userAsyncValue = await ref.refresh(usersProvider.future);
              print("userA :: $userAsyncValue");
            },
            child: const Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: () {
              final userAsyncValue = ref.watch(usersProvider);
              print("userA :: $userAsyncValue");
            },
            child: const Icon(Icons.info),
          ),
        ],
      ),
      body: userAsyncValuee.when(
        data: (result) {
          return Center(
            child: ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(result[index].title),
                subtitle: Text(result[index].title),
              ),
            ),
          );
        },
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
