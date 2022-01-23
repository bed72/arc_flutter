enum HttpError {
  unknown,
  notFound,
  forbidden,
  badRequest,
  serverError,
  unauthorized,
}

extension HttpErrorExtension on HttpError {
  String get descripition {
    switch (this) {
      case HttpError.unknown:
        return 'Unknown.';
      case HttpError.notFound:
        return 'Not Found.';
      case HttpError.forbidden:
        return 'Forbidden.';
      case HttpError.badRequest:
        return 'Bad Request.';
      case HttpError.serverError:
        return 'Server Error.';
      case HttpError.unauthorized:
        return 'Unauthorized.';
      default:
        return 'Unknown.';
    }
  }
}
