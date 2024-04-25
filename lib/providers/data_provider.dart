import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app_with_http_riverpod/models/user_model.dart';
import 'package:user_app_with_http_riverpod/services/api_service.dart';

final userDataProvider = FutureProvider<List<UserModel>>(
    (ref) async => ref.watch(userProvider).getUsers());
