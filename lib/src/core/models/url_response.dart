import '../../../unicode_moyasar.dart';

class PaymentCallBackResponse {
  late String id;
  late PaymentStatus paymentStatus;
  late String amount;
  late String message;

  PaymentCallBackResponse({
    this.id = '',
    this.paymentStatus = PaymentStatus.notSpecified,
    this.amount = '0',
    this.message = AppTexts.error,
  });

  PaymentCallBackResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    paymentStatus =
        json['status'] == 'paid' ? PaymentStatus.success : PaymentStatus.failed;
    amount = json['amount'] ?? '';
    message = json['message'] ?? '';
  }
  Map<String, dynamic> toMap() => {
        "id": id,
        "paymentStatus": paymentStatus.index,
        "amount": amount,
        "message": message,
      };
}
