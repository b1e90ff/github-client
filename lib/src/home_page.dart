import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:github_client/src/github_login.dart';

import '../github_oauth_credentials.dart';
import 'github_summary.dart';

class HomePage extends StatelessWidget {

  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GithubLoginWidget(
      builder: (context, httpClient) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: GitHubSummary(
            gitHub: _getGitHub(httpClient.credentials.accessToken),
          ),
        );
      },
      githubClientId: githubClientId,
      githubClientSecret: githubClientSecret,
      githubScopes: githubScopes,
    );
  }
}

GitHub _getGitHub(String accessToken) {
  return GitHub(auth: Authentication.withToken(accessToken));
}
