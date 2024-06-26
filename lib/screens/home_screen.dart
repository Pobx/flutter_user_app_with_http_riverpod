import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app_with_http_riverpod/models/user_model.dart';
import 'package:user_app_with_http_riverpod/providers/data_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reverpod Flutter'),
        ),
        body: userData.when(
          data: (userData) {
            List<UserModel> userList = userData.map((e) => e).toList();
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: ListTile(
                        title: Text(
                          '${userList[index].fristName} ${userList[index].lastName}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '${userList[index].email}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(userList[index].avatar.toString()),
                        ),
                      ),
                    ),
                  );
                });
          },
          error: (error, s) => Text(error.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
