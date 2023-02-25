import '../../unicode_moyasar.dart';

extension PaymentEnvironmentType on PaymentEnvironment {
  ///* Check is live
  bool get isLive => this == PaymentEnvironment.live;

  ///* Check is test
  bool get isTest => this == PaymentEnvironment.test;
}
