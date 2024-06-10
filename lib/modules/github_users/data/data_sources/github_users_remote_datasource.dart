import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_skeleton/modules/github_users/data/models/github_user_model.dart';

import '../../business/entity/github_user.dart';
import 'github_user_datasource.dart';
import 'package:http/http.dart' as http;

import '../../../../infrastructure/network/api_urls.dart';

class GithubUsersRemoteDataSource implements GithubUsersDatasource {
  final users = <GithubUser>[];
  @override
  Future<List<GithubUser>> getUsers() async {
    try {
      final uri = Uri.parse(ApiUrls.baseUrl + ApiUrls.usersUrl);
      final headers = {'Authorization': 'Bearer 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'};

      final response = await http.get(uri);

      log('''URL      -> $uri
      STATUS   -> ${response.statusCode}
      LOAD     -> null
      RESPONSE -> ${response.body}
      ''');

      if (response.statusCode == 200) {
        final decodedUsers = jsonDecode(response.body);

        for (var json in decodedUsers ?? []) {
          final userModel = GithubUserModel.fromJson(json);
          users.add(GithubUser.fromModel(userModel));
        }
      }
    } catch (error, stck) {
      debugPrint(error.toString());
      debugPrint(stck.toString());
    }

    return users;
  }

}