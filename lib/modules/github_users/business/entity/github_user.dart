import 'package:flutter_clean_skeleton/modules/github_users/data/models/github_user_model.dart';

class GithubUser {
  int? id;
  String? login;
  String? avatarUrl;

  GithubUser({
    this.id,
    this.login,
    this.avatarUrl,
  });

  factory GithubUser.fromModel(GithubUserModel model) {
    return GithubUser(
      id: model.id,
      login: model.login,
      avatarUrl: model.avatarUrl,
    );
  }
}
