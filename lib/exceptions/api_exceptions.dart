import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String? message;

  ApiException({required this.message});

  @override
  String toString() => message ?? 'unknown error';
}

class BadRequestException extends ApiException {
  BadRequestException({String? message}) : super(message: message);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({String? message}) : super(message: message);
}

class ForbiddenException extends ApiException {
  ForbiddenException({String? message}) : super(message: message);
}

class NotFoundException extends ApiException {
  NotFoundException({String? message}) : super(message: message);
}

class ConflictException extends ApiException {
  ConflictException({String? message}) : super(message: message);
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException({String? message}) : super(message: message);
}

class BadGatewayException extends ApiException {
  BadGatewayException({String? message}) : super(message: message);
}

class ServiceUnavailableException extends ApiException {
  ServiceUnavailableException({String? message}) : super(message: message);
}

class ApiErrorHandler {
  static Exception handleError(error) {
    // I usually use Dio package for networking. If you use Http, you have to change here to HttpError
    if (error is DioError) {
      final e = error.response;
      switch (e?.statusCode) {
        case 400:
          return BadRequestException(message: e?.data);
        case 401:
          return UnauthorizedException(message: e?.data);
        case 403:
          return ForbiddenException(message: e?.data);
        case 404:
          return NotFoundException(message: e?.data);
        case 409:
          return ConflictException(message: e?.data);
        case 500:
          return InternalServerErrorException(message: e?.data);
        case 502:
          return BadGatewayException(message: e?.data);
        case 503:
          return ServiceUnavailableException(message: e?.data);
        default:
          return ApiException(message: e?.data);
      }
    } else {
      return ApiException(message: error.toString());
    }
  }
}
