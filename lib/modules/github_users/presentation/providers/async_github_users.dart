
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_skeleton/core/use_cases/no_param.dart';
import 'package:flutter_clean_skeleton/core/use_cases/async_use_case.dart';
import '../../business/repositories/github_users_repository.dart';
import '../../business/use_cases/get_github_user_use_case.dart';
import '../../data/data_sources/github_user_datasource.dart';
import '../../data/data_sources/github_users_remote_datasource.dart';
import '../../data/repositories_impl/github_users_repository_impl.dart';
import '../../business/entity/github_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_github_users.g.dart';

@riverpod
class AsyncGithubUsers extends _$AsyncGithubUsers {

  late final GithubUsersDatasource _dataSource;
  late final GitHubUsersRepository _repository;
  late final AsyncUseCase<List<GithubUser>, NoParam> _useCase;

  Future<List<GithubUser>> _getUsers() async {
    try {
      return _useCase.execute(NoParam());
    } catch (error, stck) {
      debugPrint(error.toString());
      debugPrint(stck.toString());
    }

    return [];
  }


  @override
  Future<List<GithubUser>> build () async {
    _dataSource = GithubUsersRemoteDataSource();
    _repository = GithubUsersRepositoryImpl(datasource: _dataSource);
    _useCase = GetGithubUserUseCase(githubUserRepository: _repository);

    return _getUsers();
  }
}