import '../../unicode_moyasar.dart';

extension PaymentStatusType on PaymentStatus {
  ///* Check is success
  bool get isSuccess => this == PaymentStatus.success;

  ///* Check is success
  bool get isFailed => this == PaymentStatus.failed;
}
