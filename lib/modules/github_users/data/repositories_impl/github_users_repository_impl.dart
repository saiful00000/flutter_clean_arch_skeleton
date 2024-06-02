import '../../business/entity/github_user.dart';
import '../../business/repositories/github_users_repository.dart';

class GithubUsersRepositoryImpl implements GitHubUsersRepository {

  GithubUsersRepositoryImpl();

  @override
  Future<List<GithubUser>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
