import 'package:flutter_clean_skeleton/core/use_cases/no_param.dart';
import 'package:flutter_clean_skeleton/core/use_cases/async_use_case.dart';
import 'package:flutter_clean_skeleton/modules/github_users/business/entity/github_user.dart';
import 'package:flutter_clean_skeleton/modules/github_users/business/repositories/github_users_repository.dart';

class GetGithubUserUseCase implements AsyncUseCase<List<GithubUser>, NoParam> {

  final GitHubUsersRepository githubUserRepository;

  const GetGithubUserUseCase({required this.githubUserRepository});

  @override
  Future<List<GithubUser>> execute(NoParam param) {
    return githubUserRepository.getUsers();
  }

}