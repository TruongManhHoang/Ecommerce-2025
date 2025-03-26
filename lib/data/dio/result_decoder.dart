import 'package:ecommerce_app/data/dio/result.dart';

typedef Decoder<T> = T Function(dynamic data);

class ResultDecoder<T> {
  final Result result;
  final Decoder decoder;

  ResultDecoder(
    this.result, {
    required this.decoder,
  });

  T get modelDTO => _decoded();

  T _decoded() {
    try {
      if (result.data != null) {
        return decoder(result.data) as T;
      } else {
        throw UnsupportedError(
            'BaseDecoder Error=> ${T.runtimeType} data is null');
      }
    } on Exception catch (e) {
      throw UnsupportedError(
          'BaseDecoder Error=> ${T.runtimeType} ${e.toString()}');
    }
  }
}
