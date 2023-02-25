import '../../../unicode_moyasar.dart';

class MoyasarPaymentData {
  ///* App name
  final String appName;

  ///* Payment `secret key`
  final String secretKey;

  ///* Payment `publishable secret key`
  final String publishableSecretKey;

  ///* Payment options
  final List<PaymentOption> paymentOptions;

  ///* Payment type `LIVE` or `TEST`
  final PaymentEnvironment paymentEnvironment;

  ///* Payment locale `ar` or `en` default is `ar`
  final PaymentLocale locale;

  ///* Payment purchase amount
  final num purchaseAmount;

  MoyasarPaymentData({
    required this.appName,
    required this.secretKey,
    required this.publishableSecretKey,
    required this.purchaseAmount,
    this.paymentEnvironment = PaymentEnvironment.test,
    this.paymentOptions = const [PaymentOption.card],
    this.locale = PaymentLocale.ar,
  })  : assert(appName.trim().isNotEmpty, AppTexts.appName),
        assert(purchaseAmount > 1, AppTexts.amountError),
        assert(secretKey.trim().isNotEmpty, AppTexts.secretKey),
        assert(
            publishableSecretKey.trim().isNotEmpty, AppTexts.secretPublishtKey);

  Map<String, dynamic> toMap() => {
        "appName": appName,
        "secretKey": secretKey,
        "publishableSecretKey": publishableSecretKey,
        "purchaseAmount": purchaseAmount,
        "paymentType": paymentEnvironment.index,
        "paymentOptions": Utils.getEnumsToList(paymentOptions),
        "locale": locale.index,
      };
}
