import 'package:flutter/material.dart';
import 'package:unicode_moyasar/unicode_moyasar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNICODE Moyasar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const PaymentView(),
    );
  }
}

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
          secretKey: "sk_live_",
          publishableSecretKey: "pk_live",
          purchaseAmount: 1.50,
          locale: PaymentLocale.en,
          paymentEnvironment: PaymentEnvironment.live,
          paymentOptions: [
            PaymentOption.card,
            PaymentOption.applepay,
            PaymentOption.stcpay,
          ],
        ),
        onPaymentSucess: (response) {
          //TODO Handle success payment response
          print("Success ------> ${response.toMap()}");
        },
        onPaymentFailed: (response) {
          //TODO Handle failed payment response
          print("Failed ------> ${response.toMap()}");
        },
      ),
    );
  }
}
