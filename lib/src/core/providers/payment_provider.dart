import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import '../../../unicode_moyasar.dart';

PaymentProvider get paymentProvider =>
    PaymentProvider.get(navStateKey.currentContext!);

class PaymentProvider extends ChangeNotifier {
  static PaymentProvider get(BuildContext context) =>
      Provider.of(context, listen: false);

  ///* Moyasar payment options
  late MoyasarPaymentData moyasarPaymentData;

  ///* Payment url
  late URLRequest paymentUrlRequest;

  ///* Payment url
  PaymentStatus paymentStatus = PaymentStatus.notSpecified;

  ///* Set the payment gateway info
  void setPaymentGatewayData(MoyasarPaymentData moyasarPaymentData) {
    this.moyasarPaymentData = moyasarPaymentData;
    String publishableSecretKey =
        base64.encode(utf8.encode(moyasarPaymentData.publishableSecretKey));

    String paymentOptions = "";
    for (PaymentOption option in moyasarPaymentData.paymentOptions) {
      paymentOptions = paymentOptions.isEmpty
          ? "${option.index}"
          : "$paymentOptions,${option.index}";
    }

    paymentUrlRequest = URLRequest(
      url: WebUri(
        "${MoyasarPaymentControllers.moyasarPaymentUrl}?purchaseAmount=${moyasarPaymentData.purchaseAmount}&appName=${moyasarPaymentData.appName}&pSk=$publishableSecretKey&locale=${moyasarPaymentData.locale.index}&paymentOptions=$paymentOptions",
      ),
    );

    notifyListeners();
  }

  ///* Check data is valid or not
  // bool get isInitMethodCalled =>
  //     moyasarPaymentData.appName.isNotEmpty &&
  //     moyasarPaymentData.skLiveKey.isNotEmpty &&
  //     moyasarPaymentData.skTestKey.isNotEmpty;

  ///* Get key based
  // String get getSecretKey => moyasarPaymentData.paymentEnvironment.isLive
  //     ? moyasarPaymentData.skLiveKey
  //     : moyasarPaymentData.skTestKey;

  ///* Cross verification
  bool crossVerificationSuccess(PaymentResponse paymentResponse) =>
      paymentResponse.amount == moyasarPaymentData.purchaseAmount * 100;

  ///* Change payment status
  void changePaymentStatus(PaymentStatus paymentStatus) {
    this.paymentStatus = paymentStatus;
    notifyListeners();
  }
}
