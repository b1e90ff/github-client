class GitHubLoginException implements Exception {
  final String message;

  const GitHubLoginException(this.message);

  @override
  String toString() => message;
}