import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:user_app_with_http_riverpod/models/user_model.dart';

class ApiService {
  String apiUrl = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final userProvider = Provider<ApiService>((ref) => ApiService());
