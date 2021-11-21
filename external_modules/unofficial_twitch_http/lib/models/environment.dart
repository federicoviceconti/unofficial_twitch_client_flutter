class EnvironmentBundle {
  final String basePath;

  EnvironmentBundle({
    required this.basePath,
  });
}

enum Environment { mockHttp, staging, prod }