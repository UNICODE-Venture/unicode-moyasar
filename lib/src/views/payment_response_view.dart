import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../unicode_moyasar.dart';

class PaymentResponseView extends StatefulWidget {
  final PaymentStatus paymentStatus;
  const PaymentResponseView({Key? key, required this.paymentStatus})
      : super(key: key);

  @override
  State<PaymentResponseView> createState() => _PaymentResponseViewState();
}

class _PaymentResponseViewState extends State<PaymentResponseView> {
  late PaymentStatus paymentStatus;

  @override
  void initState() {
    paymentStatus = widget.paymentStatus;
    super.initState();
    _setLottieImage();
  }

  LottieComposition? lottieComposition;

//* Loading lottie file
  void _setLottieImage() async {
    AssetLottie assetLottie = AssetLottie(
      paymentStatus.isSuccess ? AssetsPath.success : AssetsPath.failed,
      package: AppTexts.packageName,
    );
    lottieComposition = await assetLottie.load();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //* Icon
          SizedBox(
            width: 100.w,
            height: 50.h,
            child: lottieComposition != null
                ? Lottie(
                    composition: lottieComposition,
                  )
                : const CircularProgressIndicator.adaptive(),
          ),

          //* Title
          //* Subtitle
        ],
      ),
    );
  }
}
