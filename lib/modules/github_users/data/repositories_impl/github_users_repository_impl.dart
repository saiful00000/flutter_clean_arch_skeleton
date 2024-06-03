import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_clean_skeleton/infrastructure/network/api_urls.dart';

import '../../business/entity/github_user.dart';
import '../../business/repositories/github_users_repository.dart';
import 'package:http/http.dart' as http;

class GithubUsersRepositoryImpl implements GitHubUsersRepository {

  @override
  Future<List<GithubUser>> getUsers() async {
    try {
      final uri = Uri.parse(ApiUrls.baseUrl + ApiUrls.usersUrl);
      final headers = {'Authorization': 'Bearer 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'};

      final response = await http.get(uri, headers: headers);

      log('''URL      -> $uri
      STATUS   -> ${response.statusCode}
      LOAD     -> null
      RESPONSE -> ${response.body}
      ''');

      if (response.statusCode == 200) {

      }
    } catch (error, stck) {
      debugPrint(error.toString());
      debugPrint(stck.toString());
    }

    return [];
  }
}
