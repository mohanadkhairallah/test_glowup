import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../api_const.dart';
import 'dio_errors_handler.dart';
import 'interceptors_handler.dart';

class BaseApiClient {
  static Dio client = Dio();
  static const String _acceptHeader = 'application/json';

  BaseApiClient() {
    client.interceptors.add(LogInterceptor());
    client.interceptors.add(ClientInterceptor());
    client.options.baseUrl = ApiConst.baseUrl;
    client.options.sendTimeout = const Duration(seconds: 5);
  }

  static Future<Either<String, T>> post<T>(
      {required String url,
      dynamic formData,
      Map<String, dynamic>? queryParameters,
      required T Function(dynamic) converter,
      dynamic returnOnError}) async {
    try {
      var response = await client.post(
        url,
        queryParameters: queryParameters,
        data: formData,
        onSendProgress: (int sent, int total) {
          if (kDebugMode) {
            log('progress: ${(sent / total * 100).toStringAsFixed(0)}% ($sent/$total)');
          }
        },
        options: Options(
          headers: {
            'accept': _acceptHeader,
            // 'authorization': 'Bearer ${DataStore.instance.token ?? ''}',
          },
        ),
      );
      if (((response.statusCode! >= 200 || response.statusCode! <= 205)) &&
          (response.data['error'].toString() != 'true')) {
        if (kDebugMode) {
          log(response.data.toString());
        }
        return right(converter(response.data));
      } else {
        return left(response.data['message']);
      }
    } on DioException catch (e) {
      Map dioError = DioErrorsHandler.onError(e);
      if (e.response?.statusCode! == 404 ||
          e.response?.statusCode! == 403 ||
          e.response?.statusCode! == 401) {
        return left(returnOnError ?? dioError["message"] ?? '');
      }
      return left(returnOnError ?? dioError["message"] ?? '');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left("");
    }
  }

  static Future<Either<String, T>> get<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic) converter,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await client.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'accept': _acceptHeader,
            // 'authorization': 'Bearer ${DataStore.instance.token ?? ''}',
          },
        ),
        cancelToken: cancelToken,
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 205) {
        if (kDebugMode) {
          log(response.data.toString());
          print(response);
        }
        return right(converter(response.data));
      } else if (response.statusCode! == 404 ||
          response.statusCode! == 403 ||
          response.statusCode! == 401) {
        return left(response.data['message']);
      } else {
        return left(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        return left('Cancel');
      }
      Map dioError = DioErrorsHandler.onError(e);
      if (kDebugMode) {
        print(e);
      }

      return left(dioError['message']);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left("");
    }
  }
}
