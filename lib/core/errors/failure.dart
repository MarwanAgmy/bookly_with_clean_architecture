import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'Bad certificate with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure(message: 'No Internet Connection');

      case DioExceptionType.unknown:
        if (dioException.message != null &&
            dioException.message!.contains('SocketException')) {
          return ServerFailure(message: 'No Internet Connection');
        }
        return ServerFailure(message: 'Unexpected Error, Please try again!');

      default:
        return ServerFailure(
          message: 'Opps There was an Error, Please try again',
        );
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      final errorMessage =
          response?['error']?['message'] ?? 'Authentication / Validation Error';
      return ServerFailure(message: errorMessage);
    } else if (statusCode == 404) {
      return ServerFailure(
        message: 'Your request not found, Please try later!',
      );
    } else if (statusCode == 500) {
      return ServerFailure(message: 'Internal Server error, Please try later');
    } else {
      return ServerFailure(
        message: 'Opps There was an Error, Please try again',
      );
    }
  }
}
