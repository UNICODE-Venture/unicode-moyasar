import 'package:flutter/material.dart';
import 'package:unicode_moyasar/unicode_moyasar.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        shape: const StadiumBorder(),
      ),
      body: MoyasarPayment(
        moyasarPaymentData: MoyasarPaymentData(
          appName: "UNICODE",
          secretKey: "sk_key",
          publishableSecretKey: "pk_key",
          purchaseAmount: 75.50,
          locale: PaymentLocale.en,
          paymentEnvironment: PaymentEnvironment.test,
          paymentOptions: [
            PaymentOption.card,
            PaymentOption.applepay,
            PaymentOption.stcpay,
          ],
        ),
        onPaymentSucess: (response) {
          //TODO Handle success payment response
          debugPrint("Success ------> ${response.toMap().toString()}");
        },
        onPaymentFailed: (response) {
          //TODO Handle failed payment response
          debugPrint("Failed ------> ${response.toMap().toString()}");
        },
      ),
    );
  }
}
