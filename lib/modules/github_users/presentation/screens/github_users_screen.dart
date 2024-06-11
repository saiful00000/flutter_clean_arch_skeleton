import 'package:flutter/material.dart';
import 'package:flutter_clean_skeleton/modules/github_users/presentation/providers/async_github_users.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GithubUsersScreen extends StatelessWidget {
  const GithubUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: Consumer(builder: (context, ref, _) {
          final asyncUsers = ref.watch(asyncGithubUsersProvider);

          return asyncUsers.when(
            data: (users) {
              return ListView.builder(
                itemCount: users.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          users[index].avatarUrl ?? '',
                        ),
                      ),
                      title: Text(users[index].login ?? ''),
                    ),
                  );
                },
              );
            },
            error: (error, stck) => const SizedBox(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }),
      ),
    );
  }
}
