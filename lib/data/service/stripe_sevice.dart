import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/utils/constants/api_constants.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeService {
  StripeService._();
  static final StripeService instance = StripeService._();
  final Dio dio = Dio();
  Map<String, dynamic>? _intentPaymentData;

  Future<bool> _showPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      return true; // Thanh toán thành công
    } on StripeException catch (e) {
      TLoaders.errorSnackBar(
          title: 'Empty Cart', message: 'Payment Cancelled.');
      return false;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Empty Cart', message: 'Payment Failed.');
      return false;
    }
  }

  Future<Map<String, dynamic>?> _createPaymentIntent(
      String amount, String currency) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $STRIPE_SECRET_KEY',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'amount': (int.parse(amount) * 100).toString(),
          'currency': currency,
          'payment_method_types[]': 'card',
        },
      );
      final responseData = jsonDecode(response.body);
      return responseData;
    } catch (e) {
      return null;
    }
  }

  Future<bool> initializePaymentSheet(String amount, String currency) async {
    try {
      _intentPaymentData = await _createPaymentIntent(amount, currency);
      if (_intentPaymentData == null ||
          !_intentPaymentData!.containsKey('client_secret')) {
        return false; // Thanh toán thất bại
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          allowsDelayedPaymentMethods: true,
          paymentIntentClientSecret: _intentPaymentData!['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: 'Company Name Example',
        ),
      );

      // Gọi hàm _showPaymentSheet() và trả về kết quả
      return await _showPaymentSheet();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Empty Cart', message: 'Payment Initialization Failed.');
      return false; // Thanh toán thất bại
    }
  }
}
