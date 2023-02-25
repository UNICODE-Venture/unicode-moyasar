import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:unicode_moyasar/unicode_moyasar.dart';

class MoyasarPaymentControllers {
  MoyasarPaymentControllers._();

  ///* Get api url
  static String moyasarV1ApiUrl = 'https://api.moyasar.com/v1/payments';
  static String moyasarPaymentUrl = "https://unicode-moyasar.web.app/";

  ///* Web view options
  static InAppWebViewGroupOptions webViewGroupOptions =
      InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true, cacheEnabled: false),
    android: AndroidInAppWebViewOptions(disableDefaultErrorPage: true),
    ios: IOSInAppWebViewOptions(
        applePayAPIEnabled: true, allowsInlineMediaPlayback: true),
  );

  //* -------------------- -------------------- ---------------------

  ///* Validate payment
  static Future<PaymentResponse> paymentVerification(
      {required Uri paymentCallBackUrl}) async {
    PaymentResponse paymentResponse = PaymentResponse();
    //* Decode
    PaymentCallBackResponse paymentUrlResponse =
        PaymentCallBackResponse.fromJson(paymentCallBackUrl.queryParameters);
    // printMeLog(paymentUrlResponse.toMap());
    //* Verify if success
    if (paymentUrlResponse.paymentStatus.isSuccess) {
      paymentResponse =
          await MoyasarPaymentService.verifyPayment(paymentUrlResponse.id);

      //* Cross verification
      bool isCrossVerified =
          paymentProvider.crossVerificationSuccess(paymentResponse);
      paymentResponse.paymentStatus =
          isCrossVerified ? PaymentStatus.success : PaymentStatus.failed;
    }
    //* Verify if failed
    else {
      // printMeLog("Case ---> C-Failed");
      paymentResponse.paymentSource.message = paymentUrlResponse.message;
    }

    paymentProvider.changePaymentStatus(paymentResponse.paymentStatus);
    return paymentResponse;
  }
}
