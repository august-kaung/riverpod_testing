import '../const/something/import_testing.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<FakeProductModel>> fetchUsers() async {
    final response = await _dio.get('https://fakestoreapi.com/products');
   return (response.data as List).map((user) => FakeProductModel.fromJson(user)).toList();
  }
}