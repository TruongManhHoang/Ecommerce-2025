// import 'dart:async';
// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:ecommerce_app/utils/popups/loaders.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;

// class StripeService {
//   StripeService._();
//   static final StripeService instance = StripeService._();
//   final Dio dio = Dio();
//   Map<String, dynamic>? _intentPaymentData;

//   Future<bool> _showPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet();
//       return true; // Thanh toán thành công
//     } on StripeException catch (e) {
//       TLoaders.errorSnackBar(
//           title: 'Empty Cart', message: 'Payment Cancelled.');
//       return false;
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'Empty Cart', message: 'Payment Failed.');
//       return false;
//     }
//   }

//   Future<Map<String, dynamic>?> _createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       final response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         headers: {
//           'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET_KEY']}',
//           'Content-Type': 'application/x-www-form-urlencoded',
//         },
//         body: {
//           'amount': (int.parse(amount) * 100).toString(),
//           'currency': currency,
//           'payment_method_types[]': 'card',
//         },
//       );
//       final responseData = jsonDecode(response.body);
//       return responseData;
//     } catch (e) {
//       return null;
//     }
//   }

//   Future<bool> initializePaymentSheet(String amount, String currency) async {
//     try {
//       _intentPaymentData = await _createPaymentIntent(amount, currency);
//       if (_intentPaymentData == null ||
//           !_intentPaymentData!.containsKey('client_secret')) {
//         return false; // Thanh toán thất bại
//       }

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           allowsDelayedPaymentMethods: true,
//           paymentIntentClientSecret: _intentPaymentData!['client_secret'],
//           style: ThemeMode.dark,
//           merchantDisplayName: 'Company Name Example',
//         ),
//       );

//       // Gọi hàm _showPaymentSheet() và trả về kết quả
//       return await _showPaymentSheet();
//     } catch (e) {
//       TLoaders.errorSnackBar(
//           title: 'Empty Cart', message: 'Payment Initialization Failed.');
//       return false; // Thanh toán thất bại
//     }
//   }
// }

import 'package:dio/dio.dart';

class StripeService {
  static final StripeService instance = StripeService._internal();
  late Dio _dio;

  StripeService._internal() {
    _initializeDio();
  }

  void _initializeDio() {
    _dio = Dio(BaseOptions(
      baseUrl: "https://api.stripe.com/v1/",
      headers: {
        "Authorization":
            "pk_test_51R1l5ZKva2BdimVB58n1fZ3ZAkJWuQI156oXMVWTtOkpaYiMMAGOpOPDFF820Bx3FE4MgscXjywxScAXaHMlB5TV00j4g4SpkJ", // Thay bằng Secret Key của bạn
        "Content-Type": "application/x-www-form-urlencoded"
      },
    ));
  }

  Future<String?> makePayment(double amount) async {
    try {
      print("🔵 Gửi request tạo Payment Intent với số tiền: $amount");

      final response = await _dio.post(
        'payment_intents',
        data: {
          "amount": (amount * 100).toInt(), // Stripe yêu cầu đơn vị cents
          "currency": "vnd",
          "payment_method_types": ["card"],
        },
      );

      print("✅ Payment Intent Response: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['client_secret'];
      } else {
        print("❌ Lỗi tạo Payment Intent: ${response.data}");
        return null;
      }
    } on DioException catch (e) {
      print("❗ DioException: ${e.response?.data}");
      return null;
    } catch (e) {
      print("❗ Exception khi tạo Payment Intent: $e");
      return null;
    }
  }
}
