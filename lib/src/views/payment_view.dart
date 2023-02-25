import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import '../../unicode_moyasar.dart';

class PaymentView extends StatefulWidget {
  ///* Get response when gateway request is done successfully
  final ValueChanged<PaymentResponse> onPaymentSucess;

  ///* Get response when gateway request is failed
  final ValueChanged<PaymentResponse> onPaymentFailed;
  const PaymentView(
      {Key? key, required this.onPaymentSucess, required this.onPaymentFailed})
      : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  final GlobalKey _webViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(
      builder: (_, paymentProvider, ___) {
        if (paymentProvider.paymentStatus == PaymentStatus.notSpecified) {
          return _showPaymentView(paymentProvider);
        } else {
          return _showMissingKeysWidgets(paymentProvider.paymentStatus);
        }
      },
    );
  }

  ///* Web view
  Widget _showPaymentView(PaymentProvider paymentProvider) => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: 100.w,
          height: 100.h,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 35.rSp),
          child: InAppWebView(
            key: _webViewKey,
            initialOptions: MoyasarPaymentControllers.webViewGroupOptions,
            initialUrlRequest: paymentProvider.paymentUrlRequest,
            shouldOverrideUrlLoading:
                (controller, NavigationAction navigationAction) async {
              String? currentLoadedUrl =
                  navigationAction.request.url?.toString();

              NavigationActionPolicy navigationActionPolicy =
                  NavigationActionPolicy.ALLOW;

              // printMeLog(currentLoadedUrl);

              //* Failed
              if (currentLoadedUrl == null ||
                  currentLoadedUrl.contains('https://moyasar.com/')) {
                navigationActionPolicy = NavigationActionPolicy.CANCEL;
                _handleFailedPayment();
              }

              //* Handle success
              else if (currentLoadedUrl.contains('payments.local')) {
                await _handleSuccessPayment(currentLoadedUrl);
              }
              //* Failed

              return navigationActionPolicy;
            },
          ),
        ),
      );

  ///* Error view
  Widget _showMissingKeysWidgets(PaymentStatus paymentStatus) =>
      PaymentResponseView(paymentStatus: paymentStatus);

//* Success handler
  Future<void> _handleSuccessPayment(String url) async {
    Uri paymentCallBackUrl = Uri.parse(url);
    PaymentResponse paymentResponse =
        await MoyasarPaymentControllers.paymentVerification(
            paymentCallBackUrl: paymentCallBackUrl);
    if (paymentResponse.paymentStatus.isSuccess) {
      widget.onPaymentSucess.call(paymentResponse);
      // printMeLog("Case ----> Success");
    } else {
      // printMeLog("Case ----> Failed");
      widget.onPaymentFailed.call(paymentResponse);
    }
  }

  //* Failed handler
  void _handleFailedPayment() {
    // printMeLog("Case ----> Failed");
    paymentProvider.changePaymentStatus(PaymentStatus.failed);
    widget.onPaymentFailed.call(PaymentResponse());
  }
}
