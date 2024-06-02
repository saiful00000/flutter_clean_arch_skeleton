import '../entity/github_user.dart';

abstract class GitHubUsersRepository {
  Future<List<GithubUser>> getUsers();
}