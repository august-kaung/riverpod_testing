import '../const/something/import_testing.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final usersProvider = FutureProvider<List<FakeProductModel>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.fetchUsers();
});