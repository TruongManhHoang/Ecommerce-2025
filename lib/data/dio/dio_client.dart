import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:ecommerce_app/core/I10n/local/hive_storage.dart';
import 'package:ecommerce_app/utils/constants/api_constants.dart';
import 'package:ecommerce_app/utils/exceptions/log_dio_exception.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  late Dio _dio;
  final GlobalStorage _localStorage;
  final List<Interceptor>? interceptors;

  DioClient(
    Dio dio,
    this._localStorage, {
    this.interceptors,
  }) {
    _dio = dio;

    _dio
      ..options.baseUrl = AppConstants.baseUrl
      ..options.connectTimeout = const Duration(seconds: 15)
      ..options.receiveTimeout = const Duration(seconds: 60)
      ..httpClientAdapter;

    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }
    // ADD TOKEN
    // ADD LOG
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      final token = _localStorage.accessToken;
      options.headers['Content-Type'] = 'application/json; charset=UTF-8';
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      // if (kDebugMode) {
      print('Request: ${options.method} ${options.path}');
      print('Request Headers: ${options.headers}');
      print('Request Data: ${options.data}');
      // }

      return handler.next(options);
    }, onResponse: (response, handler) {
      if (kDebugMode) {
        print('Response Status Code: ${response.statusCode}');
        print('Response Data: ${response.data}');
      }

      return handler.next(response);
    }, onError: (DioException error, handler) {
      if (kDebugMode) {
        print("Error intercepted: ${error.response?.statusCode}");
        print("Error response: ${error.response?.data}");
      }
      handler.next(error);
    }));

    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        // Don't trust any certificate just because their root cert is trusted.
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        // You can test the intermediate / root cert here. We just ignore it.
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return client;
      },
    );

    //clean token
    void cleanToken(String newToken) {
      if (newToken == null || newToken.isEmpty) {
        _dio.options.headers.remove('Authorization');
      } else {
        _dio.options.headers['Authorization'] = 'Bearer $newToken';
      }
    }
  }

  Future<Map<String, dynamic>> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      // return jsonDecode(response.data);
      return response.data;
    } on SocketException catch (e) {
      Log.console(e,
          where: 'GET ${AppConstants.baseUrl}$uri', level: LogLevel.error);
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      Log.console('Unable to process the data',
          where: 'GET ${AppConstants.baseUrl}$uri', level: LogLevel.error);
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      debugPrint('response: ${response.data}');
      return response.data;
    } on FormatException catch (_) {
      Log.console('Unable to process the data',
          where: 'POST ${AppConstants.baseUrl}$uri', level: LogLevel.error);
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      // return jsonDecode(response.data);
      return response.data;
    } on FormatException catch (_) {
      Log.console('Unable to process the data',
          where: 'PATCH ${AppConstants.baseUrl}$uri', level: LogLevel.error);
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      // return jsonDecode(response.data);
      return response.data;
    } on FormatException catch (_) {
      debugPrint('Unable to process the data');
      Log.console('Unable to process the data',
          where: 'PUT ${AppConstants.baseUrl}$uri', level: LogLevel.error);
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      // return jsonDecode(response.data);
      return response.data;
    } on FormatException catch (_) {
      Log.console('Unable to process the data',
          where: 'DELETE ${AppConstants.baseUrl}$uri', level: LogLevel.error);
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }
}

//clean token



// class LoggingInterceptor extends Interceptor {
//   LoggingInterceptor();
//
//   @override
//   Future onRequest(RequestOptions options,
//       RequestInterceptorHandler handler) async {
//
//     options.extra['start_time'] = DateTime
//         .now()
//         .millisecondsSinceEpoch;
//     return handler.next(options);
//   }
//
//   @override
//   void onError(err, ErrorInterceptorHandler handler) {
//     Log.console(
//         err, where: '${err.requestOptions.method} ${err.requestOptions.uri}',
//         level: LogLevel.error);
//     //? TODO: Send error to server
//     // var msg = 'URI: ${err.requestOptions.uri}\\n';
//     // msg += 'METHOD:${err.requestOptions.method}\\n';
//     // msg += 'REQUEST HEADER:${err.requestOptions.headers.toString()}\\n';
//     // if (err.response != null) {
//     //   msg += 'STATUS CODE:${err.response?.statusCode?.toString()}\\n';
//     // }
//     // if (err.response != null) {
//     //   msg += 'BODY:${err.response?.data.toString() ?? ''}\\n';
//     // }
//     // msg += 'ERROR: ${err.toString()}';
//     // UDPLog.instance.sendMessage(_msg);
//
//     String? msg = "Đã có lỗi xảy ra";
//     if (err.response != null) {
//       msg = err.response?.data['message'].toString();
//     }
//
//     // return handler.next(err);
//     return handler.reject(DioException(
//         requestOptions: err.requestOptions, error: msg, response: err.response
//     ));
//   }
//
//   @override
//   Future onResponse(response, ResponseInterceptorHandler handler) async {
//     Log.console(response.data,
//         where: '${response.requestOptions.method} ${response.requestOptions
//             .uri}', level: LogLevel.info);
//     if ((response.statusCode ?? 200) != 200) {
//       // TODO: Send log to server
//       // var msg = 'URI: ${response.requestOptions.uri}\\n';
//       // msg += 'METHOD:${response.requestOptions.method}\\n';
//       // msg += 'REQUEST HEADER:${response.requestOptions.headers.toString()}\\n';
//       // msg += 'STATUS CODE:${response.statusCode ?? ''}\\n';
//       // msg += 'BODY: ${response.data ?? ''}';
//       //UDPLog.instance.sendMessage(_msg);
//       //Log.d(_msg);
//     } else {
//       /// có kết quả trả về nhưng lớn hơn ??? giây
//       var startTime = response.requestOptions.extra['start_time'] as int;
//       if (DateTime
//           .now()
//           .millisecondsSinceEpoch - startTime >= 2000) {
//         // TODO: Send log to server
//         // var _msg = 'URI: ${response.requestOptions.uri}\\n';
//         // _msg += 'METHOD:${response.requestOptions.method}\\n';
//         // _msg += 'REQUEST TIME :${DateTime.now().millisecondsSinceEpoch - startTime}ms\\n';
//         // UDPLog.instance.sendMessage(_msg);
//         // Log.d(_msg.toString());
//       }
//     }
//     return handler.next(response);
//   }
//
//   void printKV(String key, Object v) {
//     logPrint('$key: $v');
//   }
//
//   void printAll(msg) {
//     msg.toString().split('\n').forEach(logPrint);
//   }
//
//   void logPrint(String s) {
//     debugPrint(s);
//   }
// }
