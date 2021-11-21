class HttpResult<T extends BaseHttpResponse> {
  final T? result;
  final ErrorHttpResponse? error;

  bool get hasError => error != null;

  HttpResult({
    this.result,
    this.error,
  });
}

class BaseHttpResponse {}

class ErrorHttpResponse {}
