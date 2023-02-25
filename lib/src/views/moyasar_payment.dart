import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../unicode_moyasar.dart';

GlobalKey<NavigatorState> navStateKey = GlobalKey<NavigatorState>();

class MoyasarPayment extends StatefulWidget {
  ///* Moyasar payment options
  final MoyasarPaymentData moyasarPaymentData;

  ///* Listen to response when payment request is successfully completed
  final ValueChanged<PaymentResponse> onPaymentSucess;

  ///* Get response callback when payment request is failed
  final ValueChanged<PaymentResponse> onPaymentFailed;

  const MoyasarPayment({
    Key? key,
    required this.moyasarPaymentData,
    required this.onPaymentSucess,
    required this.onPaymentFailed,
  }) : super(key: key);

  @override
  State<MoyasarPayment> createState() => _MoyasarPaymentState();
}

class _MoyasarPaymentState extends State<MoyasarPayment> {
  @override
  Widget build(BuildContext context) {
    ScreenSizes.init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PaymentProvider>(
          create: (_) => PaymentProvider()
            ..setPaymentGatewayData(widget.moyasarPaymentData),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navStateKey,
        debugShowCheckedModeBanner: false,
        home: PaymentView(
          onPaymentSucess: widget.onPaymentSucess,
          onPaymentFailed: widget.onPaymentFailed,
        ),
      ),
    );
  }
}
