import 'package:dio/dio.dart';
import 'package:innovation_project/core/network/exceptions/exceptions.dart';

class AppInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    late final DioException dioException;
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        dioException = ConnectionTimeoutException(
          err.requestOptions,
          err.message,
        );
        break;
      case DioExceptionType.sendTimeout:
        dioException = SendTimeoutException(
          err.requestOptions,
          err.message,
        );
        break;
      case DioExceptionType.receiveTimeout:
        dioException = ReceiveTimeoutException(
          err.requestOptions,
          err.message,
        );
        break;
      case DioExceptionType.badCertificate:
        dioException = BadCertificateException(
          err.requestOptions,
          err.message,
        );
        break;
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            dioException = BadRequestException(
              err.requestOptions,
              err.message,
            );
            break;
          case 401:
            dioException = UnauthorizedException(
              err.requestOptions,
              err.message,
            );

            break;
          case 404:
            dioException = NotFoundException(
              err.requestOptions,
              err.message,
            );
            break;
          case 409:
            dioException = ConflictException(
              err.requestOptions,
              err.message,
            );
            break;
          case 500:
            dioException = InternalServerErrorException(
              err.requestOptions,
              err.message,
            );
            break;

          default:
            dioException = BadResponseException(
              err.requestOptions,
              err.message,
            );
        }
        break;

      case DioExceptionType.cancel:
        dioException = CancelException(
          err.requestOptions,
          err.message,
        );
        break;
      case DioExceptionType.connectionError:
        dioException = ConnectionErrorException(
          err.requestOptions,
          err.message,
        );
        break;
      case DioExceptionType.unknown:
        dioException = UnknownException(
          err.requestOptions,
          err.message,
        );
        break;

      default:
        return handler.next(err);
    }
    return handler.next(dioException);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
