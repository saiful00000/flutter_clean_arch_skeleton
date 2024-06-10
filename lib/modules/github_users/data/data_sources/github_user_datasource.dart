import '../../business/entity/github_user.dart';

abstract class GithubUsersDatasource {
  Future<List<GithubUser>> getUsers();
}