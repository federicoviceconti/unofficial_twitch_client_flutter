class HttpResult<T extends BaseHttpResponse> {
  final T? result;
  final ErrorHttpResponse? error;

  bool get hasError => error != null;

  HttpResult({
    this.result,
    this.error,
  });
}

class BaseHttpResponse {
  final int? status;
  final String? message;

  bool get hasError => status != null && status != 200;

  ErrorReason get reason => message?.reason ?? ErrorReason.unknown;

  BaseHttpResponse({
    this.status,
    this.message,
  });
}

class ErrorHttpResponse {}

enum ErrorReason {
  missingClient, invalidToken, unknown
}

extension InvalidErrorReasonStringExt on String {
  ErrorReason? get reason => {
    'Invalid token': ErrorReason.invalidToken,
    'missing client id': ErrorReason.missingClient,
  }[this];
}