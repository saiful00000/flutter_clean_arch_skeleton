
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_skeleton/modules/github_users/business/repositories/github_users_repository.dart';
import 'package:flutter_clean_skeleton/modules/github_users/data/data_sources/github_user_datasource.dart';
import 'package:flutter_clean_skeleton/modules/github_users/data/data_sources/github_users_remote_datasource.dart';
import 'package:flutter_clean_skeleton/modules/github_users/data/repositories_impl/github_users_repository_impl.dart';
import '../../business/entity/github_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_github_users.g.dart';

@riverpod
class AsyncGithubUsers extends _$AsyncGithubUsers {

  late final GithubUsersDatasource _dataSource;
  late final GitHubUsersRepository _repository;

  Future<List<GithubUser>> _getusers() async {
    try {
      return _repository.getUsers();
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

    return _getusers();
  }
}