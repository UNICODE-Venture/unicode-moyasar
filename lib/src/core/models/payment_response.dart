import '../../../unicode_moyasar.dart';

class PaymentResponse {
  late String transactionId;
  late PaymentStatus paymentStatus;
  late num amount;
  late num fee;
  late String currency;
  late String description;
  late String amountFormatted;
  late String ip;
  late String createdAt;
  late String invoiceId;
  late PaymentSource paymentSource;

  PaymentResponse({
    this.transactionId = "",
    this.paymentStatus = PaymentStatus.failed,
    this.amount = 0,
    this.fee = 0,
    this.currency = "",
    this.description = "",
    this.amountFormatted = "",
    this.ip = "",
    this.createdAt = "",
    this.invoiceId = "",
    PaymentSource? paymentSource,
  }) : paymentSource = paymentSource ?? PaymentSource();

  PaymentResponse.fromMap(Map<String, dynamic> json) {
    transactionId = json['id'] ?? "";
    paymentStatus = (json['status'] == 'paid' && transactionId.isNotEmpty)
        ? PaymentStatus.success
        : PaymentStatus.failed;

    amount = json['amount'] ?? 0;
    fee = json['fee'] ?? 0;
    currency = json['currency'] ?? "";
    description = json['description'] ?? "";
    amountFormatted = json['amount_format'] ?? "0 SAR";
    ip = json['ip'] ?? "N/A";
    createdAt = json['created_at'] ?? "";
    invoiceId = json['invoice_id'] ?? "";
    paymentSource = PaymentSource.fromMap(json['source'] ?? {});
  }

  Map<String, dynamic> toMap() => {
        'transaction_id': transactionId,
        'paymentStatus': paymentStatus.index,
        'amount': amount,
        'fee': fee,
        'currency': currency,
        'description': description,
        'amount_format': amountFormatted,
        'ip': ip,
        'created_at': createdAt,
        'invoice_id': invoiceId,
        'source': paymentSource.toMap(),
      };
}

class PaymentSource {
  late PaymentOption type;
  late String company;
  late String name;
  late String cardNumber;

  late String message;
  late String gatewayId;
  late String referenceNumber;

  PaymentSource({
    this.type = PaymentOption.card,
    this.company = "",
    this.name = "",
    this.cardNumber = "",
    this.message = AppTexts.error,
    this.gatewayId = "",
    this.referenceNumber = "",
  });

  PaymentSource.fromMap(Map<String, dynamic> json) {
    type = Utils.paymentType(json['type'] ?? "creditcard");
    company = json['company'] ?? "";
    name = json['name'] ?? "N/A";
    cardNumber = json['number'] ?? "";
    message = json['message'] ?? "";

    gatewayId = json['gateway_id'] ?? "";
    referenceNumber = json['reference_number'] ?? "";
  }

  Map<String, dynamic> toMap() => {
        'type': type.index,
        'company': company,
        'name': name,
        'cardNumber': cardNumber,
        'message': message,
        'gateway_id': gatewayId,
        'reference_number': referenceNumber,
      };
}
